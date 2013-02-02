﻿package  {
	
	public class BigInvader_III extends Invader {
		
		private var HP:int;
		
		public function BigInvader_III() {
			HP = 100;
		}
		
		override public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		override public function shoot():Projectile{
			var invaderbullet = new Invader_Bullet_II_RED();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return invaderbullet;
		}
	}
	
}