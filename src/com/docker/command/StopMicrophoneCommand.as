package com.docker.command 
{	

	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.*;
	
	import com.docker.model.*;
	
	/**
	 * Stop and disconnect the <code>microphone</code> audio device.
	 * 
	 */	
	public class StopMicrophoneCommand implements ICommand 
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
	 	 * @param cgEvent
	 	 */	 	
	 	public function execute( cgEvent : CairngormEvent ) : void
	    { 			
			// disconnect mic
			if ( main.media.microphone != null ) 
			{
				main.media.microphone.setLoopBack( false );
				// update audio stream when publishing
				
			}		
		}
	}
}
