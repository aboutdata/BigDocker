package com.docker.ui
{
	
	import com.docker.model.*;
	
	import flash.events.Event;
	import flash.media.Video;
	import flash.net.*;
	
	import mx.core.UIComponent;
	
	/**
	 * 用户显示多个用户视频显示
	 * */
	public class PlayVideoContainer extends UIComponent
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		private var main : Main = model.main;
		
		private var netConnection : NetConnection = main.media.nc;
		
		private var nsPlay:NetStream;
		
		private var streamName:String;
		
		public var chat : Chat = model.chat;
		/**
		 * Video object instance.
		 */		
		private var _video:Video;
		
		
		public function PlayVideoContainer(streamName:String)
		{
			super();
			this.streamName= streamName;
			addEventListener(Event.REMOVED,removeHandler);
			addEventListener( Event.RESIZE, resizeHandler );
			startPlayback();
		}
		
		//播放该视频流信息
		public function startPlayback():void{
			chat.sendMessage("新创建的视频开始播放了 ... streamName ="+streamName);
			nsPlay= new NetStream( netConnection );
			
			nsPlay.bufferTime = 0;
			nsPlay.receiveAudio( true );
			nsPlay.receiveVideo( true );
			_video = new Video( 320,240 );
			_video.attachNetStream( nsPlay );
			nsPlay.play( streamName );
			
			addChild( _video );
		}
		
		
		/**
		 * 当用户退出或者失去连接 都会关闭退出用户的视频
		 **/
		public function removeHandler():void{
			chat.sendMessage("新创建的视频开始播放了 ... removeHandler =");
			_video =null;
			if ( nsPlay != null ) {nsPlay.close();}
		}
		/**
		 * Resize the <code>Video</code> object so it matches the dimensions of
		 * the interface component.
		 * @param event <code>Event.RESIZE</code> 
		 */		
		private function resizeHandler( event : Event ) : void
		{
			if ( _video != null )
			{
				_video.width = width;
				_video.height = height;
			}
		}
	}
}