package com.docker.views.monitor
{

	import com.docker.events.ChangeVideoEvent;
	import com.docker.model.*;
	import com.docker.ui.*;
	
	import mx.containers.Box;
	import mx.containers.VBox;
	import mx.controls.Label;
	
	import spark.components.*;

	/**
	 * 
	 * 
	 * @author Thijs Triemstra
	 */	
	public class MonitorDisplayClass extends VBox
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		[Bindable]
		public var main : Main;
		
		public var chat : Chat = model.chat;
		
		public function changeVideo(index:int):void{
			
			var uid:String=main.videoPairs["vid_"+index];
			chat.sendMessage("选择了用户的视频1... uid ="+uid);
			if(uid!=null){
				var playback_streamName : String = "stream_consult_"+uid;
				var changeVideoEvent:ChangeVideoEvent=new ChangeVideoEvent(playback_streamName);
				
				changeVideoEvent.dispatch();
			}
			
//			switch(index){
//				case 1:
//					
//					chat.sendMessage("选择了用户的视频1...");
//					var uid:String=main.videoPairs["vid_1"];
//					var playback_streamName : String = "stream_consult_"+uid;
//					var changeVideoEvent:ChangeVideoEvent=new ChangeVideoEvent(playback_streamName);
//					
//					changeVideoEvent.dispatch();
//					break;
//				case 2:
//					chat.sendMessage("选择了用户的视频2...");
//					main.media.videoMain = main.media.videoRemote1;
//					break;
//				case 3:
//					chat.sendMessage("选择了用户的视频3...");
//					main.media.videoMain = main.media.videoRemote1;
//					break;
//				default:
//			}
			
			
		}
		
		
	}
}
