package com.docker.views.monitor
{

	import com.docker.events.*;
	import com.docker.events.ChangeVideoEvent;
	import com.docker.model.*;
	import com.docker.ui.*;
	
	import flash.events.*;
	import flash.utils.Timer;
	
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
		
		private var _interval : Timer = null;
		
		
		
		
		//定时刷新
		public function init():void{
			_interval = new Timer( 1000 );
			_interval.addEventListener(TimerEvent.TIMER,refreshData);
			_interval.start();
			
		}
		
		private function refreshData(event:TimerEvent):void{
			var uid:String=main.params.uid;
			
			var users:Array = main.roomUsers;
			
			var currentUserVideos:int = this.getChildren().length;
			//代表用户数据没有变化
			if(currentUserVideos===users.length-1){
				return;
			}
			
			this.removeAllChildren();
			
			var mainView:Boolean=true;//进一步处理 不要包含自己视频
			for(var i:int = 0; i < users.length; i++) {
				var playback_streamName : String = "stream_consult_"+users[i]['id'];
				if(uid === users[i]['id']){
					chat.sendMessage(" refreshData是当前用户,摄像头关联到本地： "+users[i]['id']);
				}else{
					//默认显示第一个到主屏上
					if(mainView){
						chat.sendMessage("refreshData是当前用户,摄像头关联到本地 播放第一个视频");
						var changeVideoEvent:ChangeVideoEvent=new ChangeVideoEvent(playback_streamName);
						changeVideoEvent.dispatch();
						mainView =false;
					}
					
					chat.sendMessage(" refreshData是当前用户,摄像头关远程： i= "+i+"   uid "+users[i]['id']);
					
					var myBox:Box=new Box();
					myBox.name=""+users[i]['id'];
					myBox.width=200;
					myBox.height=140;
					myBox.setStyle("backgroundColor", "0xFFFFFF");  
					myBox.setStyle("borderStyle","solid");
					myBox.setStyle("borderColor","0xD0D0D0");
					//myBox.setStyle("paddingBottom","0");
					myBox.setStyle("cornerRadius","2");
					myBox.addEventListener(MouseEvent.CLICK,changeVideoHandler);
					
					var	playVideoContainer:PlayVideoContainer=new PlayVideoContainer(playback_streamName);
					playVideoContainer.percentWidth=100;
					playVideoContainer.percentHeight=100;
					
					myBox.addChild(playVideoContainer);
					this.addChild(myBox);
				}
			}//for end
		}
		
		//切换主屏事件
		public function changeVideoHandler(event:MouseEvent):void{
			
			var playback_streamName : String = "stream_consult_"+event.currentTarget.name;
			var changeVideoEvent:ChangeVideoEvent=new ChangeVideoEvent(playback_streamName);
			changeVideoEvent.dispatch();
		}
		
	}
}
