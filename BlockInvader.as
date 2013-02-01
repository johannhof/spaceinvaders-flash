package  {		
	public class BlockInvader extends Invader {
		
		private var HP:int;
		
		public function BlockInvader() {
			HP = 2;
		}
		
		public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		public function shoot():Projectile{
			var proj = new Bullet();
			proj.x = this.x;
			proj.y = this.y;
			return proj;
		}
	}
	
}
