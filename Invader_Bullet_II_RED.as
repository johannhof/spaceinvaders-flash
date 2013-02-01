package  {
	
	
	public class Invader_Bullet_II_RED extends Projectile {
		
		override public function move(){
			this.y += 25;
		}
		
		override public function hit():Boolean{
			return true;
		}
	}
	
}
