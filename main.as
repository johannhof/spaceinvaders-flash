package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	public class main extends MovieClip {
		private var _def:Defender;
		private var _defProjectile:Projectile;
		private var projectiles:Array;
		private var invaders:Array;

		public function main() {
			invaders = new Array();
			var test:StandardInvader = new StandardInvader();
			test.x = 100;
			test.y = 200;
			invaders.push(test);
			invaders.forEach(addInvaders);
			projectiles = new Array();
			_def = new Defender(7);
			_def.x = 250;
			_def.y = 420;
			addChild(_def);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, clickHandler);
			stage.addEventListener(Event.ENTER_FRAME,moveElements);
		}
		public function clickHandler(e:KeyboardEvent) {
			var key:uint = e.keyCode;
			if (key == Keyboard.LEFT && _def.x > 50) {
				_def.x -= _def.speed;
			} else if (key == Keyboard.RIGHT  && _def.x < stage.stageWidth - 50) {
				_def.x += _def.speed;
			} else if (key == Keyboard.SPACE) {
				if (_defProjectile == null) {
					_defProjectile = _def.shoot();
					addChild(_defProjectile);
				}
			}
		}
		public function moveElements(e:Event) {
			if (_defProjectile != null) {
				_defProjectile.move();
				if (_defProjectile.y < 0) {
					_defProjectile = null;
				} else {
					for each (var invader:Invader in invaders) {
						if (checkHit(invader,_defProjectile) == true) {
							if (_defProjectile.hit() == true) {
								_defProjectile.parent.removeChild(_defProjectile);
								_defProjectile = null;
							}
							if (invader.getHit() == true) {
								invaders.splice(invaders.indexOf(invader),1);
								invader.parent.removeChild(invader);
							}
						}
					}
				}
			}
			projectiles.forEach(moveProjectiles);
		}
		private function moveProjectiles(element:Projectile, index:int, arr:Array) {
			element.move();
		}
		private function addInvaders(element:Invader, index:int, arr:Array) {
			addChild(element);
		}
		private function checkHit(e:MovieClip,p:Projectile):Boolean {
			if (e is Hittable) {
				if (p.y < e.y && p.y > e.y - e.height && p.x - p.width < e.x + e.width && p.x + p.width > e.x) {
					return true;
				}
			}
			return false;
		}
	}
}