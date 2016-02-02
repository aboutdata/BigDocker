package com.docker.events
{
 
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.SetupConnectionCommand
	 */	
	public class SetupConnectionEvent extends CairngormEvent 
	{
		/**
		 * 
		 */		
		public function SetupConnectionEvent() 
		{
			super( DashboardController.EVENT_SETUP_CONNECTION );
		}
	}
}
