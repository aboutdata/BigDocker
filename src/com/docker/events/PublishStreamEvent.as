package com.docker.events
{
	
	 
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy org.red5.samples.publisher.command.PublishStreamCommand
	 */	
	public class PublishStreamEvent extends CairngormEvent 
	{	
		/**
		* 
		*/		
		public var publishMode : String;
		
		/**
		* 
		*/		
		public var streamName : String;
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public function PublishStreamEvent( streamName : String ) 
		{
			super( DashboardController.EVENT_PUBLISH_STREAM );
			this.streamName = streamName;
		}
	}
}
