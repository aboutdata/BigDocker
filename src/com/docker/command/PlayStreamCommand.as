package com.docker.command 
{	

	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.docker.business.NetStreamDelegate;
	import com.docker.events.PlayStreamEvent;
	import com.docker.model.*;
	
	/**
	 * Setup the <code>nsPlay</code> NetStream for playback.
	 * <p>The NetStream is stored in the Model.</p>
	 * 
	 * @see com.docker.model.Media#nsPlay nsPlay
	 */	
	public class PlayStreamCommand implements ICommand 
	{
		/**
		* 
		*/			
		private var model : ModelLocator = ModelLocator.getInstance();
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var main : Main = model.main;
	 	
	 	/**
	 	* 
	 	*/	 	
	 	private var netStreamDelegate : NetStreamDelegate = main.ns_delegate;
	 	
	 	/**
	 	 * 
	 	 * @param cgEvent
	 	 */	 	 	
	 	public function execute( cgEvent : CairngormEvent ) : void
	    { 
	    	var event : PlayStreamEvent = PlayStreamEvent( cgEvent );
	    	var bufferTime : int = event.bufferTime;
	    	var streamName : String = event.streamName;
	    	var enableVideo : Boolean = event.enableVideo;
	    	var enableAudio : Boolean = event.enableAudio;
			var videoIndex : int = event.videoIndex;
			// Use Delegate to playback the NetStream.
	      	//netStreamDelegate.startPlayback( bufferTime, streamName, enableVideo, enableAudio,videoIndex);
		}
				
	}
}
