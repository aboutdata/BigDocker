package com.docker.events
{
	 
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.StartMicrophoneCommand
	 */	
	public class StartMicrophoneEvent extends CairngormEvent 
	{
		/**
		* 
		*/		
		public var selectedMicIndex : int;	
		
		/**
		* 
		*/			
		public var gain : int;	
		
		/**
		* 
		*/		
		public var rate : int;
		
		/**
		* 
		*/		
		public var level : int;	
		
		/**
		* 
		*/		
		public var timeout : int;
		
		/**
		 * 
		 * @param selectedMicIndex
		 * @param gain
		 * @param rate
		 * @param level
		 * @param timeout
		 */		
		public function StartMicrophoneEvent() 
		{
			super( DashboardController.EVENT_START_MICROPHONE );
		}
	}
}
