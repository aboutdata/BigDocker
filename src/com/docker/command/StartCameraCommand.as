package com.docker.command
{	
 
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.*;
	import flash.media.*;
	import flash.net.NetStream;
	
	import com.docker.events.StartCameraEvent;
	import com.docker.model.*;
	
	/**
	 * Start and monitor the <code>camera</code> video device.
	 * 
	 * @see org.red5.samples.publisher.model.Media#camera camera
	 * @author Thijs Triemstra
	 */	
	public class StartCameraCommand implements ICommand 
	{
		/**
		* 
		*/			
		private var model : ModelLocator = ModelLocator.getInstance();
	 	
	 	[Bindable]
	 	/**
	 	* 
	 	*/	 	
	 	public var main : Main = model.main;
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var logger : Logger = model.logger;
	 	
		
		
		[Bindable]		
		public var chat : Chat = model.chat;
	 	/**
	 	* 
	 	*/	 	
	 	private var camera : Camera = main.media.camera;
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var nsPublish : NetStream = main.media.nsPublish;
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var videoLocal : Video = main.media.videoLocal;
	 	
	 	/**
	 	 * 
	 	 * @param cgEvent
	 	 */	 	
	 	public function execute( cgEvent : CairngormEvent ) : void
	    { 
			
			var event : StartCameraEvent = StartCameraEvent( cgEvent );
			//
			//var selectedCamIndex : int = 	event.selectedCamIndex;
			var keyFrameInterval : int = 	event.keyFrameInterval;
			var cameraWidth : int = 		event.cameraWidth;
			var cameraHeight : int = 		event.cameraHeight;
			var cameraFPS : int = 			event.cameraFPS;
			var cameraBandwidth : int = 	event.cameraBW;
			var cameraQuality : int = 		event.cameraQuality;
			//var cameraIndex : String =		String( selectedCamIndex - 1 );
			//
			main.media.camera = Camera.getCamera();
			
			//main.media.camera = Camera.getCamera( cameraIndex );
			camera = main.media.camera;
			//
			camera.setKeyFrameInterval( keyFrameInterval );
			camera.setMode( cameraWidth, cameraHeight, cameraFPS );
			camera.setQuality( cameraBandwidth, cameraQuality );
			//
			camera.addEventListener( ActivityEvent.ACTIVITY, activityEventHandler );
			camera.addEventListener( StatusEvent.STATUS, statusEventHandler );
			// update video stream when publishing
			if ( nsPublish != null ) 
			{
				nsPublish.attachCamera( camera );
			}
			//
			main.media.videoLocal = new Video( 320, 240 );
			
			main.media.videoLocal.attachCamera( camera );
			// show video container for preview.
			//main.previewState = true;
		}
		
		/**
		 * 
		 * @param event
		 */		
		private function activityEventHandler( event : ActivityEvent ) : void 
		{
			//trace( "activityEventHandler: " + event );
		}
		
		/**
		 * 
		 * @param event
		 */		
		private function statusEventHandler( event : StatusEvent ) : void 
		{
			//trace( "statusEventHandler: " + event );
		}
		
	}
}
