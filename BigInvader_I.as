package  {
	
	public class BigInvader_I extends Invader {
				
		public function BigInvader_I() {
			HP = 6;
		}
		
		override public function getHit():Boolean{
			HP--;
			if(HP == 0){
				return true;
			}
			return false;
		}
		
		override public function shoot():Array{
			var invaderbullet = new Invader_Bullet_II();
			invaderbullet.x = this.x;
			invaderbullet.y = this.y;
			return new Array(invaderbullet);
		}
	}
	
}
