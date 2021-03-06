package com.docker.business
{

	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.docker.events.*;
	import com.docker.model.*;
	import com.docker.views.general.Images;
	
	import flash.events.*;
	import flash.media.*;
	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.media.VideoStreamSettings;
	import flash.net.*;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;	
	

	public class NetStreamDelegate
	{	
		/**
		* 
		*/		
		private var model : ModelLocator = ModelLocator.getInstance();
		
		/**
		* 
		*/		
		private var responder : IResponder;
		
		/**
		* 
		*/		
		public var main : Main = model.main;
			
		/**
		*  
		*/		
		private var nsPublish : NetStream = main.media.nsPublish;
		
		/**
		*  
		*/		
		private var nsPlay : NetStream = main.media.nsPlay;
		
		/**
		*  
		*/		
		private var camera : Camera;
		
		/**
		*  
		*/		
		private var microphone : Microphone;
		
		
		/**
	 	* 
	 	*/	 	
	 	private var logger : Logger = model.logger;
		

		public var chat : Chat = model.chat;
		/**
		 * 
		 * @param res
		 */		
		public function NetStreamDelegate( res : IResponder )
		{
			// Listen and capture the NetConnection info and error events.
			responder = res;
		}
	
		/***
		 * 
		 * 播放主屏幕的 视频流
		 * **/
		public function startPlaybackMain(streamName : String) : void
		{
			try 
			{
				// Check for reconnect.
				if ( nsPlay != null ) 
				{
					chat.sendMessage("startPlaybackMain:： Stop and close previous NetStream");
					// Stop and close previous NetStream.
					var stopStreamEvent : StopStreamEvent = new StopStreamEvent();
					stopStreamEvent.dispatch();
				}
				
				nsPlay = new NetStream( main.media.nc );
				
				nsPlay.addEventListener( NetStatusEvent.NET_STATUS, netStatusEvent );
				nsPlay.addEventListener( IOErrorEvent.IO_ERROR, netIOError );
				nsPlay.addEventListener( AsyncErrorEvent.ASYNC_ERROR, netASyncError );
				
				nsPlay.bufferTime = 0;
				nsPlay.receiveAudio( true );
				nsPlay.receiveVideo( true );
				
				nsPlay.client = responder;
				
				main.media.videoMain = new Video( 640,480 );
				main.media.videoMain.attachNetStream( nsPlay );
				
				nsPlay.play( streamName );
				
			}
			catch( e : ArgumentError ) 
			{
				//
				//main.playbackState = main.stopState;
				// Invalid parameters
				switch ( e.errorID ) 
				{
					// NetStream object must be connected.
					case 2126 :
						//
						break;
					default :
						break;
				}
			}
		}
		
		
		/**
		 * 关闭流信息 关闭主屏的视频信息
		 */		
		public function stopPlayback() : void
		{
			chat.sendMessage("关闭流信息:： ");
			main.media.videoMain=null
			// Close the NetStream.
			if ( nsPlay != null ) {
				nsPlay.close();
			}
		}
		
		
		
		/**
		 * 
		 * @param publishMode
		 * @param streamName
		 */		
		public function startPublish( publishMode : String, streamName : String ) : void
		{
			try 
			{
				camera = main.media.camera;
				microphone = main.media.microphone;
				
				// 摄像头和声音必须要其中一个
				if (microphone != null || camera != null) 
				{
					// close previous stream
					if ( nsPublish != null ) 
					{
						//Alert.show("nsPublish != null")
						// Stop and unpublish current NetStream.
						var unpublishStreamEvent : UnpublishStreamEvent = new UnpublishStreamEvent();
						unpublishStreamEvent.dispatch();
					}
					// Setup NetStream for publishing.
					nsPublish = new NetStream( main.media.nc );
					//
					nsPublish.addEventListener( NetStatusEvent.NET_STATUS, netStatusEvent );
					nsPublish.addEventListener( IOErrorEvent.IO_ERROR, netIOError );
					nsPublish.addEventListener( AsyncErrorEvent.ASYNC_ERROR, netASyncError );
					//
					nsPublish.client = responder;	
					// attach devices to NetStream.
					if ( camera != null ) 
					{
						nsPublish.attachCamera( camera );
						//使用264编码视频文件
						var videoStreamSettings:VideoStreamSettings = null;
						var vss:H264VideoStreamSettings = new H264VideoStreamSettings();
						vss.setProfileLevel(H264Profile.BASELINE, H264Level.LEVEL_5_1);
						videoStreamSettings = vss;
						videoStreamSettings.setQuality(camera.bandwidth, camera.quality);
						videoStreamSettings.setKeyFrameInterval(camera.keyFrameInterval);
						videoStreamSettings.setMode(camera.width, camera.height, camera.fps);
						
						nsPublish.videoStreamSettings = videoStreamSettings;
						
					}
					if ( microphone != null) 
					{
						nsPublish.attachAudio( microphone );
					}
					
					
					// Start publishing.
					//type:String (default = null) — 指定如何发布该流的字符串。 有效值为“record”、“append”和“live”。 默认值为“live”。
    				//如果传递“record”，则 Flash Player 将发布并录制实时数据，同时将录制的数据保存到名称与传递给 name 参数的值相匹配的 FLV 文件中。 该文件保存在服务器上服务器应用程序所在目录的子目录中。 如果该文件已经存在，则覆盖该文件。
    				//如果传递“append”，则 Flash Player 将发布并录制实时数据，同时将录制的数据追加到名称与传递给 name 参数的值相匹配的 FLV 文件中，该文件保存在服务器上服务器应用程序所在目录的子目录中。 如果未找到名称与 name 参数相匹配的文件，则创建一个。
   					//如果省略此参数或传递“live”，则 Flash Player 将发布实时数据而不进行录制。 如果存在名称与传递给 name 参数的值相匹配的文件，则删除它。
					//main.publishState = true;
					nsPublish.publish( streamName, publishMode);
				} 
				else 
				{
					logger.logMessage( "Can't publish stream, no input device(s) selected", logger.serverMessage );
					//
					//main.publishState = false;
				}
			}
			catch( e : ArgumentError ) 
			{
				//
				//main.publishState = false;
				// Invalid parameters
				switch ( e.errorID ) 
				{
					// NetStream object must be connected.
					case 2126 :
						logger.logMessage( "Can't publish stream, not connected to server", logger.serverMessage  );
						//logger.monitorMessage(	"Not connected to server", 
							//					images.warnServer_img, 
						//						serverMessage );
						break;
					default :
					   logger.logMessage( e.toString(), logger.streamMessage);
					   break;
				}
			}
		}
		
		/**
		 * 
		 */		
		public function stopPublish() : void
		{
			//main.publishState = false;
			
			nsPublish.close();
			
		}
		
		
		
		
			
		/**
		 * 
		 * @param event
		 */		
		protected function netStatusEvent( event : NetStatusEvent ) : void 
		{
			// Pass NetStatusEvent to Command.
			responder.result( event );
		}
		
		/**
		 * 
		 * @param event
		 */		
		protected function netSecurityError( event : SecurityErrorEvent ) : void 
		{
			// Pass SecurityErrorEvent to Command.
		    responder.fault( new SecurityErrorEvent ( SecurityErrorEvent.SECURITY_ERROR, false, true,
		    										  "Security error - " + event.text ) );
		}
		
		/**
		 * 
		 * @param event
		 */		
		protected function netIOError( event : IOErrorEvent ) : void 
		{
			// Pass IOErrorEvent to Command.
			responder.fault( new IOErrorEvent ( IOErrorEvent.IO_ERROR, false, true, 
							 "Input/output error - " + event.text ) );
		}
		
		/**
		 * 
		 * @param event
		 */		
		protected function netASyncError( event : AsyncErrorEvent ) : void 
		{
			// Pass AsyncErrorEvent to Command.
			responder.fault( new AsyncErrorEvent ( AsyncErrorEvent.ASYNC_ERROR, false, true,
							 "Asynchronous code error - <i>" + event.error + "</i>" ) );
		}
		
    }
}
