package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;

	public class main extends MovieClip {
		private var def:Defender;

		public function main() {
			def = new Defender(7);
			def.x = 250;
			def.y = 400;
			addChild(def);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, def.keyMove);
		}
	}
}