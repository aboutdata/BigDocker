package com.docker.model
{
	
	import com.adobe.cairngorm.*;
	import com.adobe.cairngorm.model.IModelLocator;
	
 	[Bindable]
	/**
	 * 
	 * @author Thijs Triemstra
	 */ 	
	public class ModelLocator implements IModelLocator
	{
		/**
		* 
		*/		
		private static var instance : ModelLocator;
		
		/**
		* 
		*/		
		public var main : Main;
		
		/**
		* 
		*/		
		public var chat : Chat;
		
		/**
	   	 * @throws CairngormError Only one ModelLocator instance should be instantiated.
	   	 */	   	
	   	public function ModelLocator() 
	   	{
	   		if ( instance != null )
					throw new CairngormError(
					   CairngormMessageCodes.SINGLETON_EXCEPTION, "ModelLocator" );
					
				initialize();
	   	}
	   	
		/**
		 * 
		 * @return ModelLocator
		 */		
		public static function getInstance() : ModelLocator
		{
			if ( instance == null )
				instance = new ModelLocator();
				
			return instance;
	   	}
	   	
	   	/**
	   	 * 
	   	 */	   	
	   	private function initialize() : void
	   	{
			main = new Main();
			
			chat = new Chat( main );
			
	   	}
	   	
	}
}
