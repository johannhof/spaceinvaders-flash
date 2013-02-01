package  {
	
	import flash.display.MovieClip;
	
	
public class Defender_III extends MovieClip implements Hittable {
		private var _speed:int;

		public function Defender_III(speed:int) {
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
			return null;
		}
		
	}
	
}
