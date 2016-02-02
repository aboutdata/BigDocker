package com.docker.responders
{
	import com.docker.events.*;
	import com.docker.model.*;
	
	import mx.rpc.IResponder;
	import mx.controls.Alert;
	
	import mx.utils.ObjectUtil;
	
	public class RoomUsersResponder implements IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		private var main : Main = model.main;
		
		
		public function fault(info:Object):void
		{
			Alert.show( "error: " + info.description );
			Alert.show( "error: " + info.code );
			
		}
		
		public function result(data:Object):void
		{
			var users:Array=new Array(data);
			//添加到全局变量
			main.roomUsers = users;
			
		}
		
		
		
	}
}