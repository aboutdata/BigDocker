package com.docker.events
{

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.StopStreamCommand
	 */	
	public class StopStreamEvent extends CairngormEvent 
	{		
		
		public var videoIndex : int;
		/**
		 * 
		 */		
		public function StopStreamEvent( videoIndex : int) 
		{
			super( DashboardController.EVENT_STOP_STREAM );
			this.videoIndex =videoIndex;
		}
	}
}
