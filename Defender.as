package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Defender extends MovieClip implements Hittable {
		private var _speed:int;

		public function Defender(speed:int) {
			this._speed = speed;
		}
		public function getHit() {
			this.parent.removeChild(this);
		}
		public function keyMove(e:KeyboardEvent):void {
			var key:uint = e.keyCode;
			var step:uint = 7;
			if (key == Keyboard.LEFT && this.x > 50) {
				this.x -= _speed;
			} else if (key == Keyboard.RIGHT  && this.x < stage.stageWidth - 50) {
				this.x += _speed;
			}
		}

		public function set speed(speed:int) {
			this._speed = speed;
		}

	}
}