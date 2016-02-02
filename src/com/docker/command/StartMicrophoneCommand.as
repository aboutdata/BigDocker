package com.docker.command 
{	

	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.*;
	import flash.media.*;
	import flash.net.NetStream;
	
	import com.docker.events.StartMicrophoneEvent;
	import com.docker.model.*;

	/**
	 * Start and monitor the <code>microphone</code> audio device.
	 * 
	 * @see com.docker.model.Media#microphone microphone
	 */
	public class StartMicrophoneCommand implements ICommand 
	{	
				
		private var model : ModelLocator = ModelLocator.getInstance();
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var main : Main = model.main;
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var microphone : Microphone = main.media.microphone;
	 	
	 	
	 	/**
	 	 * 
	 	 * @param cgEvent
	 	 */	 		
	 	public function execute( cgEvent : CairngormEvent ) : void
	    { 
			var event : StartMicrophoneEvent = StartMicrophoneEvent( cgEvent );
//			var selectedMicIndex : int = 	event.selectedMicIndex;
//			var gain : int = 				event.gain;
//			var rate : int = 				event.rate;
//			var level : int = 				event.level;
//			var timeout : int = 			event.timeout;
//			var micIndex : int = 			selectedMicIndex - 1;
			
			var gain : int = 				event.gain;
			var rate : int = 				event.rate;
			var level : int = 				event.level;
			var timeout : int = 			event.timeout;
		
			//升级后的麦克风 
			main.media.microphone = Microphone.getEnhancedMicrophone();
			
			
			var options:MicrophoneEnhancedOptions=new MicrophoneEnhancedOptions();
			options.mode=MicrophoneEnhancedMode.FULL_DUPLEX;
			options.autoGain = true;
			
			microphone.enhancedOptions=options;
			microphone.setLoopBack(false);
			microphone.setSilenceLevel(0, 2000);
			microphone.codec=SoundCodec.SPEEX;
			microphone.enableVAD=true;
			//microphone.gain = 50;
			
			
			microphone = main.media.microphone;
			//
			microphone.addEventListener( ActivityEvent.ACTIVITY, activityEventHandler );
			microphone.addEventListener( StatusEvent.STATUS, statusEventHandler );
			// update audio stream when we're already publishing.
			// 
		}
		
		/**
		 * 
		 * @param event
		 */		
		private function activityEventHandler( event : ActivityEvent ) : void 
		{
			//trace( "activityEventHandler: " + event );
		}
		
		/**
		 * 
		 * @param event
		 */		
		private function statusEventHandler( event : StatusEvent ) : void 
		{
			//trace( "statusEventHandler: " + event );
		}
		
	}
}
