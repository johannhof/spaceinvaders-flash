package  {
	
	public class SmallInvader_VII extends Invader {
		
		private var HP:int;
		
		public function SmallInvader_VII() {
			HP = 2;
		}
		
		override public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		override public function shoot():Projectile{
			var invaderbullet = new Invader_Bullet();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return invaderbullet;
		}
	}
	
}
