package  {
	public class SmallInvader_II extends Invader {
		
		
		private var HP:int;
		
		public function SmallInvader_II() {
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
			var proj = new Bullet();
			proj.x = this.x;
			proj.y = this.y;
			return proj;
		}
	}
		
}
