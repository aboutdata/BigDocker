package com.docker
{
	[Bindable]
	public class Message
	{
		//发言者
		public var nickname:String;
		
		//发言内容
		public var msg:String;
		
		//发言时间
		public var time:Date;
		
		//是悄悄话
		public var isprivatetalk:Boolean;
		
		//发言的对象
		public var acceptnickname:String;
		
		//粗体
		public var fontWeight:String = "";
		
		//倾斜
		public var fontStyle:String="";
		
		//下划线
		public var fontTextDecoration:String="";
		
		//颜色
		public var fontColor:uint;
	}
}