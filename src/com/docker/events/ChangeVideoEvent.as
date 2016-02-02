package com.docker.events
{
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	public class ChangeVideoEvent extends CairngormEvent 
	{
		public var streamName : String;
				
		public function ChangeVideoEvent(streamName : String) 
		{
			super( DashboardController.EVENT_CHANGE_VIDEO );
			
			this.streamName = streamName;
			
		}
	}
}