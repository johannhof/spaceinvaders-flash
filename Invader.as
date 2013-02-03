package {
	import flash.display.MovieClip;
	public class Invader extends MovieClip implements Hittable {
		protected var _shootingChance = 0.10;
		
		public function Invader() {

		}
		public function getHit():Boolean {
			return true;
		}
		
		public function shoot():Projectile{
			return null;
		}
		
		public function get shootingChance():Number{
			return _shootingChance;
		}
	}
}