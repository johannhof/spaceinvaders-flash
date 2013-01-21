package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;

	public class main extends MovieClip {
		public function main() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, myKeyDown);
			function myKeyDown(e:KeyboardEvent):void {
				trace("Key Pressed");
			}
		}
	}
}