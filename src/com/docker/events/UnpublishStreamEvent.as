package com.docker.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.UnpublishStreamCommand
	 */	
	public class UnpublishStreamEvent extends CairngormEvent 
	{	
		/**
		 * 
		 */		
		public function UnpublishStreamEvent() 
		{
			super( DashboardController.EVENT_UNPUBLISH_STREAM );
		}
		
	}
}
