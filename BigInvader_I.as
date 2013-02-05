package  {
	
	public class BigInvader_I extends Invader {
				
		public function BigInvader_I() {
			HP = 3;
		}
		
		override public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		override public function shoot():Array{
			var invaderbullet = new Invader_Bullet();
			var invaderbullet2 = new Invader_Bullet();
			invaderbullet.x = this.x + 20;
			invaderbullet.y = this.y;
			invaderbullet2.x = this.x + 30;
			invaderbullet2.y = this.y;
			return new Array(invaderbullet, invaderbullet2);
		}
	}
	
}
