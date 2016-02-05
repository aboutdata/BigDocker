package com.docker.model
{
	import flash.media.*;
	import flash.net.*;
	
	/**
	 * Devices and remote connections.
	 * 
	 * @author Thijs Triemstra
	 */	
	public class Media
	{
		/**
		* <code>NetStream</code> for outgoing audio/video.
		*/		
		public var nsPublish : NetStream;                      
		
		/**
		* <code>NetStream</code> for incoming audio/video.
		*/
		public var nsPlay : NetStream;
		
		/**
		* One <code>NetConnection</code> used in the application.
		*/		
		public var nc : NetConnection;
		
		/**
		* Audio device.
		*/		
		public var microphone : Microphone;
		
		/**
		* Video device.
		*/		
		public var camera : Camera;
		
		
		
		[Bindable]
		/**
		* Display output of video device.
		*/		
		public var videoLocal : Video;
		
		
		[Bindable]
		public var videoRemote : Video;	
		
		[Bindable]
		/**
		 * Display output of video device.
		 */		
		public var videoMain : Video;
		
		[Bindable]
		/**
		* Current video width.
		*/		
		public var videoWidth : int;
		
		[Bindable]
		/**
		* Current video height.
		*/		
		public var videoHeight : int;
	}
}
