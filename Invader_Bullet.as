package  {
	
	public class Invader_Bullet extends Projectile {
		
		override public function move(){
			this.y += 2;
		}
		
		override public function hit():Projectile{
			return null;
		}
	}
	
}
