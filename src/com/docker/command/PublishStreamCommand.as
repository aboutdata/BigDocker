package com.docker.command 
{
	
	 	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.business.NetStreamDelegate;
	import com.docker.events.PublishStreamEvent;
	import com.docker.model.*;
	
	/**
	 * Setup the <code>nsPublish</code> NetStream for publishing.
	 * <p>The NetStream is stored in the Model.</p>
	 */	
	public class PublishStreamCommand implements ICommand 
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
	    	var event : PublishStreamEvent = PublishStreamEvent( cgEvent );
	    	var streamName : String = event.streamName;
			// Use Delegate to publish the NetStream.
			//live record append
	      	netStreamDelegate.startPublish("live", streamName );
		}
				
	}
}
