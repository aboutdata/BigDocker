package com.docker.views.chat
{
	
	import flash.events.Event;
	
	import mx.containers.Box;
	import mx.controls.*;
	import mx.events.ColorPickerEvent;
	
	
	import com.docker.model.*;
	
	public class ChatInputClass extends Box
	{
		/**
		* 
		*/		
		private var model : ModelLocator = ModelLocator.getInstance();	
		
		[Bindable]		
		public var chat : Chat = model.chat;
		
		[Bindable]		
		public var main : Main = model.main;
		
		/**
		 * 
		 */		
		public var status_txt : TextArea;
		
		
		public function updateScroll () : void 
		{
			//
			status_txt.verticalScrollPosition = status_txt.maxVerticalScrollPosition;
		}
		
	

		
	}
}