package com.docker.command 
{	
	
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.business.NetStreamDelegate;
	import com.docker.events.UnpublishStreamEvent;
	import com.docker.model.*;
	
	/**
	 * Stop publishing the <code>nsPublish</code> NetStream.
	 * <p>The NetStream is stored in the Model.</p>
	 * 
	 */	
	public class UnpublishStreamCommand implements ICommand 
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
	    	var event : UnpublishStreamEvent = UnpublishStreamEvent( cgEvent );
			// Use Delegate to unpublish the NetStream.
	      	netStreamDelegate.stopPublish();
		}
				
	}
}
