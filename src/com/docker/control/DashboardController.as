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
			
		}
		
		public static const EVENT_SEND_MESSAGE : String = 		"EVENT_SEND_MESSAGE";
		
	}
}
