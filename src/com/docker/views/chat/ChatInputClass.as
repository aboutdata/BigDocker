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
		
		
		public var textEditor : TextArea;
		
		[Bindable]
		public var popUpButton_pic:PopUpButton;
		
		//占位符
		private var placeholder:String="[img:{0}]";
		
		//粗体
		[Bindable]
		private var fontWeight:String="normal";

		//倾斜
		[Bindable]
		private var fontStyle:String="normal";

		//下划线
		[Bindable]
		private var fontTextDecoration:String="none";

		//字体颜色
		[Bindable]
		private var fontColor:uint=0x0B333C;
		
		[Bindable]
		public var fontsetup_color:ColorPicker;
		
		
		//设置字体属性
		public function checkBox_fontsetup(evt:Event):void
		{
			var ch:CheckBox=evt.currentTarget as CheckBox;
			var data:String=ch.data.toString();

			if (data == "fontWeight")
			{
				if (ch.selected)
				{
					this.fontWeight="bold";
				}
				else
				{
					this.fontWeight="normal";
				}
			}

			if (data == "fontStyle")
			{
				if (ch.selected)
				{
					this.fontStyle="italic";
				}
				else
				{
					this.fontStyle="normal";
				}
			}

			if (data == "textDecoration")
			{
				if (ch.selected)
				{
					this.fontTextDecoration="underline";
				}
				else
				{
					this.fontTextDecoration="none";
				}
			}
		}

		//设置字体颜色
		public function colorPicker_color(evt:ColorPickerEvent):void
		{
			fontColor=this.fontsetup_color.selectedColor;
		}
		
		//用户选择图片的单击事件
		public function imageclick(evt:Event):void
		{
			var img:Image=evt.currentTarget as Image;
			var idx:int=int(img.data);

			var str:String=placeholder.replace("{0}", idx.toString());

			this.insertString(str);

			//关闭弹出菜单
			this.popUpButton_pic.close();

			setTextFocus();
		}
		
		//把字符串插入到RichTextEditor控件的光标位置
		public function insertString(insertStr:String):void
		{
			if (this.textEditor.selectionBeginIndex == this.textEditor.selectionEndIndex)
			{
				var startPart:String=this.textEditor.text.substring(0, this.textEditor.selectionBeginIndex);
				var endPart:String=this.textEditor.text.substring(this.textEditor.selectionEndIndex, this.textEditor.text.length);
				startPart+=insertStr;
				startPart+=endPart;
				this.textEditor.text=startPart;
			}
			else
			{
				this.textEditor.text=insertStr;
			}
		}
		
		
		//给发言文本框聚焦
		private function setTextFocus():void
		{
			//给文本框聚焦
			//focusManager.setFocus(textEditor);
		}
		
		public function changeSendMessage():void
		{
			main.sendText = this.textEditor.text;
		}

		
	}
}