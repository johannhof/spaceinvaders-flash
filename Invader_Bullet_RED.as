package  {
	
	public class Invader_Bullet_RED extends Projectile {
		
		override public function move(){
			this.y += 25;
		}
		
		override public function hit():Boolean{
			return true;
		}
	}
}
