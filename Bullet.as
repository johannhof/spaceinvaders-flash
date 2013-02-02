package {
	public class Bullet extends Projectile {
		
		override public function move(){
			this.y -= 2;
		}
		
		override public function hit():Projectile{
			return null;
		}
	}
}