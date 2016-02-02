package com.docker.command 
{	
	 
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.docker.business.*;
	import com.docker.events.*;
	import com.docker.model.*;
	import com.docker.views.general.Images;
	import com.docker.vo.NetConnectionClient;
	
	import flash.events.*;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.setInterval;
	
	import mx.rpc.IResponder;

	/**
	 * Setup a new NetConnection with the RTMP server.
	 * <p>The NetConnection is stored in the Model.</p>
	 * 
	 * @see com.docker.model.Media#nc nc
	 */	
	public class SetupConnectionCommand implements ICommand
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
			var event : SetupConnectionEvent = SetupConnectionEvent( cgEvent );
			// Setup the permanent Delegate to manage the NetConnection.
			main.nc_delegate = new NetConnectionDelegate( new NetConnectionClient());
		}
		

	}
}
