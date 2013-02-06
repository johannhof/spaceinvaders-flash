package {

	public class BigInvader_III extends Invader {

		public function BigInvader_III() {
			HP = 100;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet_RED();
			var invaderbullet2 = new Invader_Bullet_RED();
			invaderbullet.x = this.x + 20;
			invaderbullet.y = this.y;
			invaderbullet2.x = this.x + 30;
			invaderbullet2.y = this.y;
			return new Array(invaderbullet, invaderbullet2);

		}
	}

}