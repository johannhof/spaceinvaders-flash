package {
	public class Defender_II extends Defender {
		public function Defender_II(speed:int = 7) {
			this._speed = speed;
			this.maxProjectiles = 3;
			this._lifes = 4;
		}

		override public function shoot():Array {
			shootSound.play();
			var bullet:Bullet = new Bullet();
			bullet.x = this.x + this.width / 5;
			bullet.y = this.y - 20;
			var bullet2:Bullet = new Bullet();
			bullet2.x = this.x + this.width / 2.2;
			bullet2.y = this.y - 20;
			var bullet3:Bullet = new Bullet();
			bullet3.x = this.x + this.width / 1.4;
			bullet3.y = this.y - 20;
			return new Array(bullet,bullet2,bullet3);
		}
	}
}