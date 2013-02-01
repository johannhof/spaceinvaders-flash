package  {
	
	import flash.display.MovieClip;
	
	
	public class Defender_II extends MovieClip implements Hittable {
		private var _speed:int;

		public function Defender_II(speed:int) {
			this._speed = speed;
		}
		public function getHit():Boolean {
			return true;
		}
		public function set speed(speed:int) {
			this._speed = speed;
		}
		public function get speed():int {
			return _speed;
		}
		public function shoot():Projectile {
			var bullet:Bullet_II =  new Bullet_II();
			bullet.x = this.x;
			bullet.y = this.y - 20;
			return bullet;
		}
	}
}
