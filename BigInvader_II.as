﻿package {	public class BigInvader_II extends Invader	{		public function BigInvader_II()		{			HP = 8;		}		override public function getHit():Boolean		{			HP--;			if (HP == 0)			{				return true;			}			return false;		}		override public function shoot():Array		{			var invaderbullet = new Invader_Bullet();			var invaderbullet2 = new Invader_Bullet();			invaderbullet.x = this.x;			invaderbullet.y = this.y;			invaderbullet2.x = this.x -1;			invaderbullet2.y = this.y;			return new Array(invaderbullet, invaderbullet2);		}	}}