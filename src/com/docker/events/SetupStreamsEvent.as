package com.docker.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.SetupStreamsCommand
	 */	
	public class SetupStreamsEvent extends CairngormEvent 
	{
		/**
		 * 
		 */		
		public function SetupStreamsEvent() 
		{
			super( DashboardController.EVENT_SETUP_STREAMS );
		}
	}
}
