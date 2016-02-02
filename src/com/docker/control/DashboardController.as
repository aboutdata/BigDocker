package com.docker.control
{
	
	import com.adobe.cairngorm.control.FrontController;
	
	import com.docker.command.*;
	
	/**
	 * 重要文件 
	 * 所有flash事件机制 都是通过该文件派发
	 * 
	 * @author 845885222@qq.com
	 */	
	public class DashboardController extends FrontController
	{
		/**
		 *
		 */		
		public function DashboardController()
		{
		
			addCommand( DashboardController.EVENT_SEND_MESSAGE, SendMessageCommand);
			
			addCommand( DashboardController.EVENT_START_CAMERA, StartCameraCommand );
//			addCommand( DashboardController.EVENT_STOP_CAMERA, StopCameraCommand );
			
			addCommand( DashboardController.EVENT_START_MICROPHONE, StartMicrophoneCommand );
			addCommand( DashboardController.EVENT_STOP_MICROPHONE, StopMicrophoneCommand );
			
			addCommand( DashboardController.EVENT_SETUP_CONNECTION, SetupConnectionCommand );
			addCommand( DashboardController.EVENT_START_CONNECTION, StartConnectionCommand );
			
			addCommand( DashboardController.EVENT_SETUP_STREAMS, SetupStreamsCommand );
			addCommand( DashboardController.EVENT_STOP_STREAM, StopStreamCommand );
			addCommand( DashboardController.EVENT_PLAY_STREAM, PlayStreamCommand );
			
			
			
			addCommand( DashboardController.EVENT_PUBLISH_STREAM, PublishStreamCommand );
			addCommand( DashboardController.EVENT_UNPUBLISH_STREAM, UnpublishStreamCommand );
			
			
			addCommand( DashboardController.EVENT_CHANGE_VIDEO, ChangeVideoCommand );
			
		}
		
		
		public static const EVENT_SEND_MESSAGE : String = 		"EVENT_SEND_MESSAGE";
		
		public static const EVENT_START_CAMERA : String = 		"EVENT_START_CAMERA";
		
		public static const EVENT_START_MICROPHONE : String = 		"EVENT_START_MICROPHONE";
		public static const EVENT_STOP_MICROPHONE : String = 		"EVENT_STOP_MICROPHONE";
		
		public static const EVENT_START_CONNECTION : String = 		"EVENT_START_CONNECTION";
		public static const EVENT_SETUP_CONNECTION : String = 		"EVENT_SETUP_CONNECTION";
		
		public static const EVENT_SETUP_STREAMS : String = 			"EVENT_SETUP_STREAMS";
		public static const EVENT_STOP_STREAM : String = 			"EVENT_STOP_STREAM";
		public static const EVENT_PLAY_STREAM : String = 			"EVENT_PLAY_STREAM";
		
		public static const EVENT_PUBLISH_STREAM : String = 		"EVENT_PUBLISH_STREAM";
		public static const EVENT_UNPUBLISH_STREAM : String = 		"EVENT_UNPUBLISH_STREAM";
		
		public static const EVENT_CHANGE_VIDEO : String = 		"EVENT_CHANGE_VIDEO";
		
	}
}
