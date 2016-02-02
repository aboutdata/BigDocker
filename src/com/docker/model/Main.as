package com.docker.model
{
	
	import mx.core.FlexGlobals;
	
	import com.docker.views.general.Images;
	import com.docker.business.*;
	/**
	 * 
	 * 这里指定Main之后 flex文件不能写成Main.mxml 否则你自己调试吧 哼哼
	 * */
	
	public class Main
	{
		[Bindable]
		public var params:Object = FlexGlobals.topLevelApplication.parameters;
		
		[Bindable]
		public var videoPairs:Object= {};
		
		[Bindable]
		public var roomUsers:Array;
		
		[Bindable]
		public var sendText:String="请在此输入聊天内容..";
		
		[Bindable]
		/**
		 * Default server status message.
		 * 
		 * @default Choose your server and press Connect
		 */		
		public var serverStatusMessage : String = "Choose your server and press Connect";
		
		[Bindable]
		/**
		 * Default audio status message.
		 * 
		 * @default Choose your audio device
		 */		
		public var audioStatusMessage : String = "Choose your audio device";
		
		[Bindable]
		/**
		 * Default video status message.
		 * 
		 * @default Choose your video device
		 */		
		public var videoStatusMessage : String = "Choose your video device";
		
		[Bindable]		
		public var netConnected : Boolean;
		
		[Bindable]
		/**
		 * All bitmap and artwork is referenced here.
		 */		
		public var images : Images;
		
		[Bindable]
		/**
		 * 
		 */		
		public var media : Media;
		
		public var nc_delegate : NetConnectionDelegate;
		
		public var ns_delegate : NetStreamDelegate;
		
		
		public function Main()
		{
			media = new Media();
		}
		
	}
}