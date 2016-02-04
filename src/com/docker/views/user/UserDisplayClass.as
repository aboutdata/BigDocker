package com.docker.views.user
{
	import com.docker.events.*;
	import com.docker.model.*;
	
	import flash.net.Responder;
	
	import mx.containers.VBox;
	import mx.controls.Alert;
	
	import mx.utils.ObjectUtil;
	
	public class UserDisplayClass extends VBox
	{ 
		private var model : ModelLocator = ModelLocator.getInstance();
		
		[Bindable]		
		public var chat : Chat = model.chat;
		
		[Bindable]
		public var main : Main= model.main;
		
		private var responder:Responder;
		
		public function getRoomUsers():void{
		
			chat.sendMessage("请求显示当前房间所有用户信息..");
			
			responder = new Responder(getUserListSuccess,getUserListError);
			main.media.nc.call("getUserList",responder);
			
		}
		
		private function getUserListSuccess(users:Array):void
		{
			var uid:String = main.params.uid;
			
			chat.sendMessage("当前用户ID： "+uid);
			//添加到全局变量
			main.roomUsers = users;
			//设定已经登录在线用户的摄像头信息
			/**var videoIndex :int= 1;
			for(var i:int = 0; i < users.length; i++) {
				if(uid === users[i]['id']){
					chat.sendMessage("是当前用户,摄像头关联到本地： "+users[i]['id']);
				}else{
					var bufferTime : int = 0;
					chat.sendMessage("播放远程视频流媒体..");
					chat.sendMessage("不是当前用户,摄像头关联到远程： "+users[i]['id']);
					var playback_streamName : String = "stream_consult_"+users[i]['id'];
					//判断需要连接成功 才执行获取流媒体操作 fixed
					if ( main.netConnected ) 
					{
						var playStreamEvent : PlayStreamEvent = 
							new PlayStreamEvent( bufferTime, playback_streamName,true,true,videoIndex);
						//把视频对应的的用户id存起来,用于切换主画面的视频
						main.videoPairs[""+videoIndex]= users[i]['id'];
						playStreamEvent.dispatch();
					}
					videoIndex++;
				}
			}**/
			
		}
		
		private function getUserListError(info:Object):void
		{
			
		}

	}
}