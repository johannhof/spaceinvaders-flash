package {
	import flash.display.MovieClip;

	public class Defender extends MovieClip implements Hittable {
		private var _speed:int;
		private var _maxProjectiles:int;

		public function Defender(speed:int) {
			this._speed = speed;
		}
		public function getHit():Boolean {
			return true;
		}
		
		public function get maxProjectiles():int{
			return _maxProjectiles;
		}
		
		public function set maxProjectiles(max:int){
			this._maxProjectiles = max;
		}
		
		public function set speed(speed:int) {
			this._speed = speed;
		}
		public function get speed():int {
			return _speed;
		}
		public function shoot():Projectile {
			var bullet:Bullet =  new Bullet();
			bullet.x = this.x;
			bullet.y = this.y - 20;
			return bullet;
		}
	}
}