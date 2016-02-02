package com.docker.vo
{
	
	public class User
	{
		
		public var id:String;
		public var name:String; 
		public var room:String; 

		
		public function User(id,name,room)
		{
			
			this.id = id; 
			this.name=name;
			this.room = room;
		}
	}
}