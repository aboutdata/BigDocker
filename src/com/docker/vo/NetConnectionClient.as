package com.docker.vo
{
	import com.docker.events.*;
	import com.docker.model.*;
	
	import flash.net.Responder;
	
	import mx.rpc.IResponder;
	import mx.utils.ObjectUtil;
	/**
	 * 
	 * 重要文件，跟服务器通信回调.包含用户加入房间。发布本地视频信息回调，和离开房间，语音等
	 * */
	
	public class NetConnectionClient implements IResponder 
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		private var main : Main = model.main;
		public var chat : Chat = model.chat;
		
		
		/**
		 * joinRoom
		 * See @link Application.java roomConnect 方法
		 * 当有第三方会诊用户加入时，服务器会调用该方法
		 * 
		 * */
		public function joinRoom(id:String,name:String,room:String):void {
			var uid:String = main.params.uid;
			
			chat.sendMessage("ID:"+id+"用户名:"+name+"房间号:"+room+"进入会会诊室..");
			
			//修改flex 中datagrid 控件绑定数组，当数组执行push方法时不刷新表格内容
			var users:Array =new Array();
			for(var i:int=0;i<main.roomUsers.length;i++)
			{
				users.push({id:main.roomUsers[i]["id"], name:main.roomUsers[i]["name"], room:main.roomUsers[i]["room"]});
			}
			//新用户登录后，添加到用户列表
			users.push({id:id, name:name, room:room});
			
			main.roomUsers = users;
			
			//TODO 判断users的大小 选择远程视频 进行关联
			var bufferTime : int = 0;
			chat.sendMessage("播放远程视频流媒体..");
			var playback_streamName : String = "stream_consult_"+id;
			//把视频对应的的用户id存起来,用于切换主画面的视频 
			main.videoPairs["vid_"+(users.length-1)]= id;
			//判断需要连接成功 才执行获取流媒体操作 fixed
			if ( main.netConnected ) 
			{
				var playStreamEvent : PlayStreamEvent = 
					new PlayStreamEvent( bufferTime, playback_streamName,true,true,users.length-1);
				
				playStreamEvent.dispatch();
			}
			
		}
		
		/**
		 * 用户离开房间调用
		 * 
		 * */
		public function leaveRoom(id:String,name:String,room:String):void {
			
			chat.sendMessage("ID:"+id+"用户名:"+name+"房间号:"+room+"离开会诊室..");
			//修改flex 中datagrid 控件绑定数组，当数组执行push方法时不刷新表格内容
			var users:Array =new Array();
			for(var i:int=0;i<main.roomUsers.length;i++)
			{
				if(main.roomUsers[i]["id"] != id){
					users.push({id:main.roomUsers[i]["id"], name:main.roomUsers[i]["name"], room:main.roomUsers[i]["room"]});
				}else{
					//该用户离开房间 则不加如用户列表				
				}
			}
			main.roomUsers = users;
			
			//TODO ...停止播放改用户的流数据
			
		}
		
		
		/**
		 * 
		 * The result method is called when the delegate receives 
		 * a result from the service
		 * 
		 * 当服务器端返回结果时 调用 通常检测是否连接成功
		 * @param event
		 */		
		public function result(  event : Object  ) : void {
			var info : Object = event.info;
			var statusCode : String = info.code;
			main.netConnected = false;
			switch ( statusCode ) 
			{
				case "NetConnection.Connect.Success" :
					main.netConnected = true;
					chat.sendMessage("服务器连接成功..");
					break;
				
				case "NetConnection.Connect.Failed" :
					serverDisconnect();
					chat.sendMessage("服务器连接失败..");
					break;
				
				case "NetConnection.Connect.Closed" :
					chat.sendMessage("服务器已关闭..");
					serverDisconnect();
					break;
				
				case "NetConnection.Connect.InvalidApp" :
					chat.sendMessage("NetConnection.Connect.InvalidApp..");
					break;
				
				case "NetConnection.Connect.AppShutDown" :
					chat.sendMessage("NetConnection.Connect.AppShutDown..");
					break;
				
				case "NetConnection.Connect.Rejected" :
					chat.sendMessage("NetConnection.Connect.Rejected..");
					break;
				
				default :
					// statements
					break;
			}
		}
		
		/**
		 * The fault method is called when the delegate receives a fault from the service
		 * 
		 * @param event
		 */		
		public function fault(  event : Object  ) : void {
			//
			//logger.logMessage ( event.text, serverMessage );
		}
		
		/**
		 * 如果连接失败 则重置相关状态
		 * 
		 */		
		private function serverDisconnect() : void 
		{
			// Reset button states
			//main.videoSettings.playButtonLabel = main.videoSettings.btnPlay;
			//main.videoSettings.playbackState = main.videoSettings.stopState;
			//main.videoSettings.publishButtonLabel = main.videoSettings.btnPublish;
			//main.videoSettings.publishState = false;
		}				
				
	}
}