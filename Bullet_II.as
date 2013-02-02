package  {
	
		public class Bullet_II extends Bullet {
				
		override public function hit():Projectile{
			var b:Bullet = new Bullet();
			b.x = this.x;
			b.y = this.y;
			return b;
		}
	}
	
}
