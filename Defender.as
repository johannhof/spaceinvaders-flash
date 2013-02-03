package 
{
	import flash.display.MovieClip;

	public class Defender extends MovieClip implements Hittable
	{
		protected var _speed:int;
		protected var _maxProjectiles:int;

		public function Defender(speed:int = 7)
		{
			this._speed = speed;
			this.maxProjectiles = 1;
		}
		public function getHit():Boolean
		{
			return true;
		}

		public function get maxProjectiles():int
		{
			return _maxProjectiles;
		}

		public function set maxProjectiles(max:int)
		{
			this._maxProjectiles = max;
		}

		public function set speed(speed:int)
		{
			this._speed = speed;
		}
		public function get speed():int
		{
			return _speed;
		}
		public function shoot():Projectile
		{
			var bullet:Bullet =  new Bullet();
			bullet.x = this.x + this.width / 2;
			bullet.y = this.y - this.height;
			return bullet;
		}
	}
}