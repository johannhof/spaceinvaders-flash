﻿package {
	public class SmallInvader_V extends Invader {

		public function SmallInvader_V() {
			HP = 1;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet();
			var invaderbullet2 = new Invader_Bullet();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			invaderbullet2.x = this.x - 1;
			invaderbullet2.y = this.y;
			return new Array(invaderbullet, invaderbullet2);

		}
	}

}