package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class main extends MovieClip {
		private var def:Defender;

		public function main() {

			def = new Defender();
			def.x = 250;
			def.y = 400;
			addChild(def);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, myKeyDown);
			function myKeyDown(e:KeyboardEvent):void {
				var key:uint = e.keyCode;
				var step:uint = 7;
				if (key == Keyboard.LEFT && def.x > 50) {
					def.x -= step;
				} else if (key == Keyboard.RIGHT  && def.x < stage.stageWidth - 50) {
					def.x += step;
				}
			}
		}
	}
}