package com.docker.command 
{	
	 
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.business.*;
	import com.docker.events.*;
	import com.docker.model.*;
	
	/**
	 * Connect to the RTMP server with the <code>nc</code> NetConnection.
	 * 
	 * @see com.docker.model.Media#nc nc
	 */	
	public class StartConnectionCommand implements ICommand 
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
	 	private var netConnectionDelegate : NetConnectionDelegate = main.nc_delegate;
	 
	 	/**
	 	 * 
	 	 * @param cgEvent
	 	 */	 	 	
	 	public function execute ( cgEvent : CairngormEvent ) : void
	    { 
			var event : StartConnectionEvent = StartConnectionEvent( cgEvent );
			var uri : String = 		event.uri;
			var proxy : String = 	event.proxy;
			var encoding : uint = 	event.encoding;
			// Use Delegate to create a connection to the RTMP server.
	      	netConnectionDelegate.connect( uri, proxy, encoding );
		}
		
	}
}
