package com.docker.views
{
	import mx.containers.Box;
	
	import com.docker.model.*;
	public class BootstrapClass extends Box
	{
			
		private var model : ModelLocator = ModelLocator.getInstance();
							
		[Bindable]
		public var main : Main = model.main;
		
		
		public function setupApp():void
		{
			
		}
		
		public function start():void
		{
			
		}

	}
}