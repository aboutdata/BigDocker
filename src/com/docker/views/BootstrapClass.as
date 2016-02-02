package com.docker.views
{
	import mx.containers.Box;
	
	import com.docker.model.*;
	import com.docker.events.*;
	
	import flash.events.*;
	import flash.media.*;
	import flash.net.ObjectEncoding;
	
	public class BootstrapClass extends Box
	{
			
		private var model : ModelLocator = ModelLocator.getInstance();
							
		[Bindable]
		public var main : Main = model.main;
		
		[Bindable]		
		public var chat : Chat = model.chat;
		
		private var camera : Camera = main.media.camera;
		
		public function setupApp():void
		{
			chat.sendMessage("设置网络链接..");
			/***
			 * 设置网络链接
			 * */
			var connectionEvent : SetupConnectionEvent = new SetupConnectionEvent();
			connectionEvent.dispatch();
			/***
			 * 设置网络流 可以是发布流 和 接收流
			 * */
			var streamsEvent : SetupStreamsEvent = new SetupStreamsEvent();
			streamsEvent.dispatch();
			/***
			 * 说明:这是初始化就执行连接操作,如果有必要可以选择 配置方式连接
			 * 开始连接到服务器
			 * */
			chat.sendMessage("开始连接到服务器..");
			var host:String  = main.params.host;
			var startConnectionEvent : StartConnectionEvent = new StartConnectionEvent("rtmp://"+host+"/bigbox/room1","CONNECT",ObjectEncoding.AMF0);
			startConnectionEvent.dispatch();
		}
		
		/**
		 * 1 启动摄像头和mic
		 * 2 重要提示:启动摄像头和mic必须再发布流之前执行，否则发送看不到画面和听不到声音
		 **/
		public function startDevices():void{
			
			chat.sendMessage("开启摄像头设备..");
			
			var keyFrameInterval : int = 	15;
			var cameraWidth : int = 		640;//680
			var cameraHeight : int = 		480;//360
			var cameraFPS : int = 			30;
			var cameraBandwidth : int = 	0;
			var cameraQuality : int = 		50;
			
			//检测带宽 计算规则 发送5次报文，然后统计平均值
			if(main.netConnected){
				// @see link BandWidthClient.class
				main.media.nc.call("checkBandwidth",null);
			}
			//在应用启动时 就创建camera的到monitor
			var startCameraEvent : StartCameraEvent = new StartCameraEvent(keyFrameInterval,cameraWidth,cameraHeight,cameraFPS,cameraBandwidth,cameraQuality);
			startCameraEvent.dispatch();
			//在启动时设置麦克风
			var startMicrophoneEvent : StartMicrophoneEvent = new StartMicrophoneEvent();
			startMicrophoneEvent.dispatch();
		}
		
		public function start():void
		{
			chat.sendMessage("start..");
			startDevices();
			
			publishStream();
			
		}
		
		/**
		 *  发布摄像头视频到服务器（网络流）
		 * Create new NetStream.
		 */		
		public function publishStream() : void
		{	
			chat.sendMessage("发布本地视频到服务器..");
			//main.params 根据会诊医生id从html页面传入 see：@link monitor_video.jsp
			//var streamName : String = main.streamName;
			//logger.logMessage("publishStream netConnected : "+main.netConnected,logger.serverMessage);
			
			var publish_streamName : String = "stream_consult_"+main.params.uid;
			if ( main.netConnected ) 
			{
				var publishStreamEvent : PublishStreamEvent = new PublishStreamEvent(publish_streamName);
				publishStreamEvent.dispatch();
			}
		}

	}
}