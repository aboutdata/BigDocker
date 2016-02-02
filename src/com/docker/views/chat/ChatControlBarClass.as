package com.docker.views.chat
{
	import flash.events.*;
	
	import mx.containers.ApplicationControlBar;
	import mx.controls.*;
	import mx.events.*;

	import com.docker.model.*;
	
	public class ChatControlBarClass extends ApplicationControlBar
	{
		/**
		* 
		*/		
		private var model : ModelLocator = ModelLocator.getInstance();	
		
		[Bindable]		
		public var chat : Chat = model.chat;
		
		[Bindable]		
		public var main : Main = model.main;
		
		
		
		public function send():void
		{
			chat.sendMessage(main.sendText);
			main.sendText="";
			
		}
	}
}