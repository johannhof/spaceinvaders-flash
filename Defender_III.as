package {
	public class Defender_III extends Defender_II {
		protected var shield:int;
		
		public function Defender_III() {
			this.shield = 2;
		}

		override public function getHit():Boolean {
			if(shield > 0){
				shield--;
			}else{
				this.gotoAndPlay('hit');
				_lifes--;
			}
			return true;
		}

	}

}