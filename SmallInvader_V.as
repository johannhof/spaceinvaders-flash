package  {
	
	public class SmallInvader_V extends Invader {
		
		private var HP:int;
		
		public function SmallInvader_V() {
			HP = 3;
		}
		
		override public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		override public function shoot():Projectile{
			var invaderbullet = new Invader_Bullet_II_BLUE();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return invaderbullet;
		}
	}
	
}
