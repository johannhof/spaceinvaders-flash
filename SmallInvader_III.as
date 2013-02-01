package  {
	
	
	public class SmallInvader_III extends Invader {
		
		private var HP:int;
		
		public function SmallInvader_III() {
			HP = 1;
		}
		
		override public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		override public function shoot():Projectile{
			var invaderbullet = new Invader_Bullet_RED();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return invaderbullet;
		}
	}
	
}
