package com.docker.events
{
	 
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy com.docker.command.StartConnectionCommand
	 */	
	public class StartConnectionEvent extends CairngormEvent 
	{
		/**
		* 
		*/		
		public var uri : String;
		
		/**
		* 
		*/			
		public var proxy : String;
		
		/**
		* 
		*/		
		public var encoding : uint;
		
		/**
		 * 
		 * @param uri
		 * @param proxy
		 * @param encoding
		 */		
		public function StartConnectionEvent( uri : String,
											  proxy : String,
											  encoding : uint ) 
		{
			super( DashboardController.EVENT_START_CONNECTION );
			this.uri = uri;
			this.proxy = proxy;
			this.encoding = encoding;
		}
	}
}
