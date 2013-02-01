package  {
	

	public class SmallInvader_IV extends Invader {
		
		private var HP:int;
		
		public function SmallInvader_IV() {
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
			var invaderbullet = new Invader_Bullet_II();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return invaderbullet;
		}
	}
	
}
