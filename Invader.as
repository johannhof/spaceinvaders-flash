package {
	import flash.display.MovieClip;
	public class Invader extends MovieClip implements Hittable {
		protected var _shootingChance = 0.10;
		protected var HP:int;
		protected var killSound:InvaderKilledSound = new InvaderKilledSound;

		public function Invader() {
		}
		public function getHit():Boolean {
			killSound.play();
			HP--;
			if (HP <= 0) {
				return true;
			}
			return false;
		}

		public function shoot():Array {
			return null;
		}

		public function get shootingChance():Number {
			return _shootingChance;
		}
	}
}