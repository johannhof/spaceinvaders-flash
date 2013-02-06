package {
	public class SmallInvader_IX extends Invader {

		public function SmallInvader_IX() {
			HP = 2;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet_RED();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return new Array(invaderbullet);
		}
	}

}