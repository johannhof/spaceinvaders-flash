﻿package  {
	
		public class Bullet_II extends Projectile {
		
		override public function move(){
			this.y -= 25;
		}
		
		override public function hit():Boolean{
			return true;
		}
	}
	
}