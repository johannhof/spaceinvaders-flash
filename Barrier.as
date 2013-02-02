package 
{
	import flash.display.MovieClip;

	public class Barrier extends MovieClip implements Hittable
	{
		protected var _elements:Array;

		public function Barrier()
		{
		}
		
		public function get elements():Array{
			return _elements;
		}
		
		public function getHit():Boolean{
			return true;
		}
	}

}