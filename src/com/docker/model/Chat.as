package com.docker.model
{
	
	import flash.system.Capabilities;
	
	public class Chat
	{
		
		[Bindable]
		private var main : Main;
		
		[Bindable]
		public var flashVersion : String;
		
		[Bindable]
		public var messageText : String = "";

		public function Chat( env:Main )
		{
			var platformVersion : String = Capabilities.version.substr( String( Capabilities.version ).lastIndexOf(" ") + 1 );
			var manufacturer : String = Capabilities.manufacturer;
			// Get Flash Player version info.
			flashVersion = "Using " + manufacturer + " Flash Player " + platformVersion;
			//
			if ( Capabilities.isDebugger ) 
			{
				// Add debugger info.
				flashVersion += " (Debugger)";
			}
			
			main = env;
			// Display Flash Player version.
			sendMessage( flashVersion );
		}
		
		public function sendMessage( msg : String): void 
		{
			var statusMessage : String = iso( new Date() ) + " \n " + msg;
			messageText += statusMessage + "\n";
		}
		
		/**
		 * 
		 * @param value
		 * @return 
		 */		
		private function doubleDigits( value : Number ) : String 
		{
			if ( value > 9 ) 
			{
				return String( value );
			} 
			else 
			{ 
				return "0" + value;
			}
		}
		
		/**
		 * 
		 * @param value
		 * @return 
		 */		
		private function tripleDigits( value : Number ) : String 
		{
			var newStr : String = "";
			if ( value > 9 && value < 100 ) 
			{
				newStr = String( value ) + "0";
			} 
			else 
			{ 
				newStr = String( value ) + "00";
			}
			return newStr.substr( 0, 3 );
		}
		
		/**
		 * 
		 * @param date
		 * @return 
		 */	
		private function iso( date : Date ) : String 
		{
			return  doubleDigits( date.getHours() )
					+ ":"
					+ doubleDigits( date.getMinutes() )
					+ ":"
					+ doubleDigits( date.getSeconds() )
					+ ":"
					+ tripleDigits( date.getMilliseconds() );
		}
			
	}
}