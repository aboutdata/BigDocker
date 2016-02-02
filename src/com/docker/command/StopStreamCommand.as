package com.docker.command 
{	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.business.NetStreamDelegate;
	import com.docker.events.StopStreamEvent;
	import com.docker.model.*;
	
	/**
	 * Stop playback on the <code>nsPlay</code> NetStream.
	 * <p>The NetStream is stored in the Model.</p>
	 * 
	 * @see com.docker.model.Media#nsPlay nsPlay
	 */	
	public class StopStreamCommand implements ICommand 
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
	    	var event : StopStreamEvent = StopStreamEvent( cgEvent );
	    	// Use Delegate to close NetStream.
	      	netStreamDelegate.stopPlayback();
		}
	}
}
