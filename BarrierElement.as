package 
{
		import flash.display.MovieClip;

	public class BarrierElement extends MovieClip implements Hittable
	{

		public function BarrierElement()
		{
		}
		
		public function getHit():Boolean{
			return true;
		}
	}

}