package {
	public class SmallInvader_II extends Invader {

		public function SmallInvader_II() {
			HP = 1;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return new Array(invaderbullet);
		}
	}

}