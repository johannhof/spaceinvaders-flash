package 
{
	public class Defender_II extends Defender
	{
		public function Defender_II(speed:int = 7)
		{
			this._speed = speed;
			this.maxProjectiles = 3;
		}

		override public function shoot():Projectile
		{
			var bullet:Bullet_II = new Bullet_II  ;
			bullet.x = this.x;
			bullet.y = this.y - 20;
			return bullet;
		}
	}
}