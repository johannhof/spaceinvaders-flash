package {
	public class SmallInvader_VIII extends Invader {
		public function SmallInvader_VIII() {
			HP = 2;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return new Array(invaderbullet);
		}
	}

}