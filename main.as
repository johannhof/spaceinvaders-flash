package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	public class main extends MovieClip {
		private var _def:Defender;
		private var _defProjectile:Projectile;
		private var projectiles:Array;

		public function main() {
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
				}
			}
			projectiles.forEach(moveProjectiles);
		}
		private function moveProjectiles(element:Projectile, index:int, arr:Array):void {
			element.move();
		}

	}
}