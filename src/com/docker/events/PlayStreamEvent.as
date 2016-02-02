package com.docker.events
{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.PlayStreamCommand
	 */	
	public class PlayStreamEvent extends CairngormEvent 
	{	
		/**
		* 
		*/		
		public var bufferTime : int;
		
		/**
		* 
		*/		
		public var streamName : String;
		
		/**
		* 
		*/		
		public var enableVideo : Boolean;
		
		/**
		* 
		*/		
		public var enableAudio : Boolean;
		
		
		public var videoIndex : int;
		
		/**
		 * 
		 * @param bufferTime
		 * @param streamName
		 * @param enableVideo
		 * @param enableAudio
		 */				
		public function PlayStreamEvent( bufferTime : int, 
										 streamName : String,
										 enableVideo : Boolean,
										 enableAudio : Boolean,
										 videoIndex : int
										) 
		{
			super( DashboardController.EVENT_PLAY_STREAM );
			this.bufferTime = bufferTime;
			this.streamName = streamName;
			this.enableVideo = enableVideo;
			this.enableAudio = enableAudio;
			this.videoIndex = videoIndex;
		}
	}
}
