﻿package {
	public class SmallInvader_IV extends Invader {

		public function SmallInvader_IV() {
			HP = 3;
		}

		override public function getHit():Boolean {
			HP--;
			if (HP == 0) {
				return true;
			}
			return false;
		}

		override public function shoot():Array {
			var invaderbullet = new Invader_Bullet_II();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return new Array(invaderbullet);
		}
	}

}