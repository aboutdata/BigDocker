package com.docker.events
{
	 
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.control.DashboardController;
	
	/**
	 * @copy org.red5.samples.publisher.command.StartCameraCommand
	 * @author Thijs Triemstra
	 */	
	public class StartCameraEvent extends CairngormEvent 
	{
		/**
		* 
		*/		
		public var selectedCamIndex : int;	
		
		/**
		* 
		*/		
		public var keyFrameInterval : int;
		
		/**
		* 
		*/		
		public var cameraWidth : int;
		
		/**
		* 
		*/		
		public var cameraHeight : int;
		
		/**
		* 
		*/		
		public var cameraFPS : int;
		
		/**
		* 
		*/		
		public var cameraBW : int;
		
		/**
		* 
		*/		
		public var cameraQuality : int;	
		
		/**
		 * 
		 * @param selectedCamIndex
		 * @param keyFrameInterval
		 * @param cameraWidth
		 * @param cameraHeight
		 * @param cameraFPS
		 * @param cameraBW
		 * @param cameraQuality
		 */		
		public function StartCameraEvent( 
										 keyFrameInterval : int,
										  cameraWidth : int,
										  cameraHeight : int,
										  cameraFPS : int,
										  cameraBW : int,
										  cameraQuality : int ) 
		{
			super( DashboardController.EVENT_START_CAMERA );
			this.keyFrameInterval = keyFrameInterval;
			this.cameraWidth = cameraWidth;
			this.cameraHeight = cameraHeight;
			this.cameraFPS = cameraFPS;
			this.cameraBW = cameraBW;
			this.cameraQuality = cameraQuality;
		}
		
	}
}
