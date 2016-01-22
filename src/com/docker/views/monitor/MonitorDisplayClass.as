package com.docker.views.monitor
{

	import mx.containers.Box;
	import mx.containers.VBox;
	/**
	 * 
	 * @author Thijs Triemstra
	 */	
	public class MonitorDisplayClass extends VBox
	{
		[Bindable]
		[Embed('images/red5.png')] 
		public var videoImg:Class;
		
		public function add():void{
			var myBox:Box=new Box();
			
			myBox.width=320;
			myBox.height=240;
			myBox.setStyle("backgroundColor","0xFFFFFF");
			myBox.setStyle("borderStyle","solid");
			
			myBox.setStyle("borderColor","0xD0D0D0");
			myBox.setStyle("paddingBottom","0");
			myBox.setStyle("cornerRadius","2");
			myBox.setStyle("backgroundImage",videoImg);
			//myBox.borderColor="0xD0D0D0";
	 		//myBox.paddingBottom="0";
	 	 	//myBox.cornerRadius="2";
	 	  	//myBox.backgroundImage="{ videoImg }";
	 	  	
	 	  	this.addChild(myBox);
		}
	}
}
