package {
	import flash.display.MovieClip;

	public class Barrier extends MovieClip {
		protected var _elements:Array;

		public function Barrier(offsetX:int) {
			_elements = new Array();
			for (var h = 0; h < 5; h++) {
				for (var w = 0; w < 30; w++) {
					var temp:BarrierElement = new BarrierElement();
					temp.x = 3 * w + offsetX;
					temp.y = 3 * h + 370;
					_elements.push(temp);
					this.addChild(temp);
				}
			}
			for (h = 5; h < 15; h++) {
				for (w = 0; w < 5; w++) {
					temp = new BarrierElement();
					temp.x = 3 * w + offsetX;
					temp.y = 3 * h + 370;
					_elements.push(temp);
					this.addChild(temp);
				}
			}
			
			for (h = 5; h < 15; h++) {
				for (w = 25; w < 30; w++) {
					temp = new BarrierElement();
					temp.x = 3 * w + offsetX;
					temp.y = 3 * h + 370;
					_elements.push(temp);
					this.addChild(temp);
				}
			}
			
			var tempArray:Array = _elements.slice();
		}

		public function get elements():Array {
			return _elements;
		}
	}

}