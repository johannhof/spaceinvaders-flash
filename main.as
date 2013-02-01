package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	public class main extends MovieClip {
		private var _def:Defender;
		private var _defProjectile:Projectile;
		private var _projectiles:Array;
		private var _invaders:Array;
		private var _level;
		private var _invaderSpeed;
		private var _invaderSpeedSteps;
		private var _invadersMoveRight:Boolean = true;
		private var _invaderVerticalStep;

		public function main() {
			_level = new Level();
			_level.createInvaders();
			_level.createDefender();
			_invaders = _level.invaders;
			addInvadersToStage(_invaders);
			_projectiles = new Array();
			_invaderSpeed = _level.startInvaderSpeed;
			_invaderSpeedSteps = _level.invaderSpeedSteps;
			_invaderVerticalStep = _level.invaderVerticalStep;
			_def = _level.defender;
			addChild(_def);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(Event.ENTER_FRAME,moveElements);
		}
		private function addInvadersToStage(rows:Array) {
			for each (var column:Array in rows) {
				for each (var invader:Invader in column){
					addChild(invader);
				}
			}
		}
		public function keyDownHandler(e:KeyboardEvent) {
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
			move_projectiles();
			move_invaders();
		}
		private function move_invaders() {
			for each (var column:Array in _invaders) {
				for each (var invader:Invader in column) {
					if (_invadersMoveRight) {
						invader.x += _invaderSpeed;
					} else {
						invader.x -= _invaderSpeed;
					}
					if ((invader.x > 450 && _invadersMoveRight) || (invader.x < 50 && !_invadersMoveRight)) {
						_invadersMoveRight = !_invadersMoveRight;
						jump_invaders();
					}
				}
			}
			_invaderSpeed += _invaderSpeedSteps;
		}
		private function jump_invaders() {
			for each (var column:Array in _invaders) {
				for each (var invader:Invader in column) {
					invader.y += _invaderVerticalStep;
				}
			}
		}
		private function move_projectiles() {
			if (_defProjectile != null) {
				_defProjectile.move();
				if (_defProjectile.y < 0) {
					_defProjectile = null;
				} else {
					for each (var column:Array in _invaders) {
						for each (var invader:Invader in column) {
							if (checkHit(invader,_defProjectile) == true) {
								if (_defProjectile.hit() == true) {
									_defProjectile.parent.removeChild(_defProjectile);
									_defProjectile = null;
								}
								if (invader.getHit() == true) {
									_invaders.splice(_invaders.indexOf(invader),1);
									invader.parent.removeChild(invader);
								}
							}
						}
					}
				}
			}
			for each (var projectile:Projectile in _projectiles) {
				projectile.move();
			}
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