package {
	public class Bullet extends Projectile {
		
		override public function move(){
			this.y -= 25;
		}
	}
}