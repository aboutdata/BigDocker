package com.docker.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.business.NetStreamDelegate;
	import com.docker.events.ChangeVideoEvent;
	import com.docker.model.*;
	
	public class ChangeVideoCommand  implements ICommand 
	{
		/**
		 * 
		 */			
		private var model : ModelLocator = ModelLocator.getInstance();
		
		/**
		 * 
		 */	 	
		private var main : Main = model.main;
		
		/**
		 * 
		 */	 	
		private var netStreamDelegate : NetStreamDelegate = main.ns_delegate;
		
		/**
		 * 
		 * @param cgEvent
		 */	 	 	
		public function execute( cgEvent : CairngormEvent ) : void
		{ 
			var event : ChangeVideoEvent = ChangeVideoEvent( cgEvent );
			var streamName : String = event.streamName;
			// Use Delegate to playback the NetStream.
			netStreamDelegate.startPlaybackMain(streamName);
		}
		
	}
}