package {
	import flash.display.MovieClip;
	public class Invader extends MovieClip implements Hittable {
		public function Invader() {

		}
		public function getHit():Boolean {
			return true;
		}
	}
}