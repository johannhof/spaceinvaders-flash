package {
	public class SmallInvader_III extends Invader {

		public function SmallInvader_III() {
			HP = 1;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet_RED();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return new Array(invaderbullet);
		}
	}

}