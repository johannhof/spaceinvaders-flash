package 
{
	import flash.display.MovieClip;

	public class Barrier extends MovieClip
	{
		protected var _elements:Array;

		public function Barrier(offsetX:int)
		{
			_elements = new Array();
			for (var w = 0; w < 25; w++)
			{
				for (var h = 0; h < 15; h++)
				{
					var temp:BarrierElement = new BarrierElement();
					temp.x = 3 * w + offsetX;
					temp.y = 3 * h + 350;
					_elements.push(temp);
					this.addChild(temp);
				}
			}
		}

		public function get elements():Array
		{
			return _elements;
		}
	}

}