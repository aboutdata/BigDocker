package com.docker.business
{

	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flash.events.*;
	import flash.net.*;
	
	import mx.rpc.IResponder;
	
	import com.docker.model.*;
	import com.docker.views.general.Images;			
	//import com.docker.vo.BandWidthClient;
	
	public class NetConnectionDelegate
	{	
		/**
		* 
		*/
		private var model : ModelLocator = ModelLocator.getInstance();
		
		/**
		* 
		*/		
		private var responder : IResponder;
		
		/**
		* 
		*/		
		private var service : Object;
		
		/**
		* 
		*/		
		private var main : Main = model.main;
		
		/**
		*  
		*/		
		private var netConnection : NetConnection = main.media.nc;
		
		/**
		* 
		*/		
		private var images : Images = main.images;
		
		/**
		* 
		*/	
		private var logger : Logger = model.logger;
		
		/**
		 * 
		 * @param res
		 */		
		public function NetConnectionDelegate( res : IResponder )
		{
			//
			main.media.nc = new NetConnection();
			// Listen and capture the NetConnection info and error events.
			responder = res;
		}
		
		/**
		 * 
		 * @param uri
		 * @param proxy
		 * @param encoding
		 */		
		public function connect( uri : String, proxy : String, encoding : uint ) : void
		{
			// Initialize the NetConnection in the model.
			netConnection = main.media.nc;
			//
			netConnection.client = responder;
			// 
			netConnection.objectEncoding = encoding;
			netConnection.proxyType = proxy;
			// Setup the NetConnection and listen for NetStatusEvent and SecurityErrorEvent events.
			netConnection.addEventListener( NetStatusEvent.NET_STATUS, netStatus );
			netConnection.addEventListener( AsyncErrorEvent.ASYNC_ERROR, netASyncError );
			netConnection.addEventListener( SecurityErrorEvent.SECURITY_ERROR, netSecurityError );
			netConnection.addEventListener( IOErrorEvent.IO_ERROR, netIOError );
			// connect to server
			try {
				//
				logger.logMessage("class NetConnectionDelegate :"+ "Connecting to <b>" + uri + "</b>", logger.serverMessage );
				//设置带宽检测回调Client
				//netConnection.connect(uri,main.params.uid,"admin","roomid");
				netConnection.connect(uri,main.params.uid,"admin","1");
			}
			catch( e : ArgumentError ) 
			{
				// Invalid parameters.
				switch ( e.errorID ) 
				{
					case 2004 :
						//
						logger.logMessage( "Invalid server location: <b>" + uri + "</b>", logger.serverMessage);
						//					   
						//logger.monitorMessage( 	"Invalid server location!", 
						//						images.warnServer_img, 
						//						serverMessage );
						break;
						
					default :
					   //
					   break;
				}
			}	
		}
		
		/**
		 * 
		 * 
		 */		
		public function close() : void
		{
			// Close the NetConnection.
			netConnection.close();
		}
			
		/**
		 * 
		 * @param event
		 */		
		protected function netStatus( event : NetStatusEvent ) : void 
		{
			// Pass NetStatusEvent to SetupConnectionCommand.
			this.responder.result( event );
		}
		
		/**
		 * 
		 * @param event
		 */		
		protected function netSecurityError( event : SecurityErrorEvent ) : void 
		{
			// Pass SecurityErrorEvent to SetupConnectionCommand.
		    responder.fault( new SecurityErrorEvent ( SecurityErrorEvent.SECURITY_ERROR, false, true,
		    										  "Security error - " + event.text ) );
		}
		
		/**
		 * 
		 * @param event
		 */		
		protected function netIOError( event : IOErrorEvent ) : void 
		{
			// Pass IOErrorEvent to SetupConnectionCommand.
			responder.fault( new IOErrorEvent ( IOErrorEvent.IO_ERROR, false, true, 
							 "Input/output error - " + event.text ) );
		}
		
		/**
		 * 
		 * @param event
		 */		
		protected function netASyncError( event : AsyncErrorEvent ) : void 
		{
			// Pass AsyncErrorEvent to SetupConnectionCommand.
			responder.fault( new AsyncErrorEvent ( AsyncErrorEvent.ASYNC_ERROR, false, true,
							 "Asynchronous code error - <i>" + event.error + "</i>" ) );
		}

    }
}
