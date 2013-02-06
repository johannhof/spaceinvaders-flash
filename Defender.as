package {
	import flash.display.MovieClip;

	public class Defender extends MovieClip implements Hittable {
		protected var _speed:int;
		protected var _maxProjectiles:int;
		protected var _lifes;
		protected var shootSound:ShootSound = new ShootSound();
		protected var explosionSound:ExplosionSound = new ExplosionSound();

		public function Defender(speed:int = 7) {
			this._speed = speed;
			this._lifes = 2;
			this.maxProjectiles = 1;
		}
		public function getHit():Boolean {
			explosionSound.play();
			this.gotoAndPlay('hit');
			_lifes--;
			return true;
		}

		public function get maxProjectiles():int {
			return _maxProjectiles;
		}

		public function set maxProjectiles(max:int) {
			this._maxProjectiles = max;
		}

		public function get lifes():int {
			return _lifes;
		}
		
		public function set lifes(life:int){
			this._lifes = life;
		}

		public function set speed(speed:int) {
			this._speed = speed;
		}
		public function get speed():int {
			return _speed;
		}
		public function shoot():Array {
			shootSound.play();
			var bullet:Bullet =  new Bullet();
			bullet.x = this.x + this.width / 2;
			bullet.y = this.y - this.height;
			return new Array(bullet);
		}
	}
}