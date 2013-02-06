package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.FileReference;
	import flash.errors.IOError;

	public class main extends MovieClip {
		private var gameContainer:Sprite;
		private var _def;
		private var _defProjectiles:Array;
		private var _projectiles:Array;
		private var _invaders:Array;
		private var _flyOverInvaders:Array;
		private var _currentLevel;
		private var _invaderSpeed;
		private var _invadersMoveRight:Boolean = true;
		private var _barriers:Array;
		private var _timer:Timer;
		private var _defLifeSymbols:Sprite;
		private var _levels;
		private var _defenders;

		public function main() {
		}

		public function showLevelChoice() {
			_levels = new Array(new Level_1(),new Level_2(),new Level_3(),new Level_4(),new Level_5(),new Level_6(),new Level_7(),new Level_8(),new Level_9(),new Level_10());
			for each (var level:Level in _levels) {
				level.x = 40 * _levels.indexOf(level) + 75;
				level.y = 50 * (_levels.indexOf(level) % 2) + 100;
				level.addEventListener(MouseEvent.CLICK, onLevelClick);
				addChild(level);
			}
			_levels[0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}

		public function hideLevelChoice() {
			for each (var level:Level in _levels) {
				removeChild(level);
			}
		}

		public function showDefenderChoice() {
			_defenders = new Array(new Defender(), new Defender_II(), new Defender_III());
			for each (var defender:Defender in _defenders) {
				defender.x = 120 * _defenders.indexOf(defender) + 130;
				defender.y = 370;
				defender.addEventListener(MouseEvent.CLICK, onDefenderClick);
				addChild(defender);
			}
			_defenders[0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}

		public function hideDefenderChoice() {
			for each (var defender:Defender in _defenders) {
				removeChild(defender);
			}
		}

		private function onDefenderClick(e:MouseEvent) {
			for each (var defender:Defender in _defenders) {
				defender.gotoAndStop(1);
			}
			if (e.currentTarget is Defender) {
				e.currentTarget.gotoAndStop('selected');
				_def = e.currentTarget;
			}
		}

		private function onLevelClick(e:MouseEvent) {
			for each (var level:Level in _levels) {
				level.gotoAndStop(1);
			}
			if (e.currentTarget is Level) {
				e.currentTarget.gotoAndStop('selected');
				_currentLevel = e.currentTarget;
			}
		}

		public function init() {
			hideLevelChoice();
			hideDefenderChoice();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.focus = this;
			gameContainer = new Sprite();
			addChild(gameContainer);
			setup_level();
			setup_barriers();
			setup_timer();
			setup_defender();
			_defProjectiles = new Array();
			_projectiles = new Array();
			addEventListener(Event.ENTER_FRAME,moveElements);
		}

		private function tick(e:Event) {
			time.text = _timer.currentCount.toString();
		}

		private function setup_defender() {
			_def.gotoAndStop(1);
			_def.x = 250;
			_def.y = 450;
			gameContainer.addChild(_def);
			update_lifes();
		}

		private function update_lifes() {
			_defLifeSymbols = new Sprite();
			for (var i = 0; i < _def.lifes; i++) {
				var temp:Defender_Model = new Defender_Model();
				temp.x = i * 50 + 25;
				temp.y = 490;
				_defLifeSymbols.addChild(temp);
			}
			gameContainer.addChild(_defLifeSymbols);
		}

		private function setup_barriers() {
			_barriers = new Array(new Barrier(90),new Barrier(225),new Barrier(360));
			for each (var barrier:Barrier in _barriers) {
				gameContainer.addChild(barrier);
			}
		}

		private function setup_timer() {
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, tick);
			_timer.addEventListener(TimerEvent.TIMER, invaders_shoot);
			_timer.addEventListener(TimerEvent.TIMER, addFlyOver);
			_timer.start();
		}

		public function setup_level() {
			_invaderSpeed = _currentLevel.startInvaderSpeed;
			_invaders = _currentLevel.createInvaders();
			if (_flyOverInvaders == null) {
				_flyOverInvaders = new Array();
			}
			for each (var column:Array in _invaders) {
				for each (var invader:Invader in column) {
					gameContainer.addChild(invader);
				}
			}
		}

		private function addFlyOver(e:Event) {
			if (_currentLevel.flyOverChance > Math.random()) {
				var invader:Invader = _currentLevel.flyOverInvaders[0];
				invader.x = 0;
				invader.y = 50;
				_flyOverInvaders.push(invader);
				gameContainer.addChild(invader);
			}
		}

		private function invaders_shoot(e:Event) {
			for each (var column:Array in _invaders) {
				if (column.length > 0 && Math.random() < column[column.length - 1].shootingChance) {
					var projectiles:Array = column[column.length - 1].shoot();
					for each (var p:Projectile in projectiles) {
						gameContainer.addChild(p);
						_projectiles.push(p);
					}
				}
			}
		}
		public function keyDownHandler(e:KeyboardEvent) {
			var key:uint = e.keyCode;
			if (key == Keyboard.LEFT && _def.x > 50) {
				_def.x -=  _def.speed;
			} else if (key == Keyboard.RIGHT  && _def.x < stage.width - 50) {
				_def.x +=  _def.speed;
			} else if (key == Keyboard.SPACE) {
				if (_defProjectiles.length < _def.maxProjectiles) {
					var projectiles:Array = _def.shoot();
					for each (var p:Projectile in projectiles) {
						_defProjectiles.push(p);
						gameContainer.addChild(p);
					}
				}

			}
		}
		public function moveElements(e:Event) {
			move_projectiles();
			move_invaders();
			move_flyOver();
		}
		private function move_flyOver() {
			for each (var invader:Invader in _flyOverInvaders) {
				invader.x +=  _invaderSpeed;
			}

		}

		private function move_invaders() {
			var invader:Invader;
			for each (var column:Array in _invaders) {
				if (_invadersMoveRight) {
					for each (invader in column) {
						invader.x +=  _invaderSpeed;
					}
				} else {
					for each (invader in column) {

						invader.x -=  _invaderSpeed;
					}
				}
				if (column.length > 0 && ((column[column.length - 1].x >= 475 && _invadersMoveRight) || (column[column.length - 1].x <= 50 && !_invadersMoveRight))) {
					_invadersMoveRight = ! _invadersMoveRight;
					jump_invaders();
				}
				if (column[column.length - 1].y >= 370) {
					game_over();
				}
			}
			_invaderSpeed +=  _currentLevel.invaderSpeedSteps;
		}
		private function jump_invaders() {
			for each (var column:Array in _invaders) {
				for each (var invader:Invader in column) {
					invader.y +=  _currentLevel.invaderVerticalStep;
				}
			}
		}
		private function check_barrier_hit(projectile:Projectile, container:Array):Boolean {
			for each (var barrier:Barrier in _barriers) {
				for each (var element:BarrierElement in barrier.elements) {
					if (checkHit(element,projectile)) {
						hitProjectile(projectile,container);
						if (element.getHit()) {
							remove_element(element,barrier.elements);
						}
						return true;
					}
				}
			}
			return false;
		}

		private function check_invader_hit(projectile:Projectile,container:Array):Boolean {
			for each (var column:Array in _invaders) {
				for each (var invader:Invader in column) {
					if (checkHit(invader,projectile)) {
						hitProjectile(projectile,container);
						if (invader.getHit()) {
							remove_element(invader,column);
							if (column.length <= 0) {
								_invaders.splice(_invaders.indexOf(column),1);
								if (_invaders.length <= 0) {
									setup_level();
								}
							}
						}
						return true;
					}
				}
			}
			// now try to hit each invader flying over
			for each (var flyInvader:Invader in _flyOverInvaders) {
				if (checkHit(flyInvader,projectile)) {
					hitProjectile(projectile,container);
					if (flyInvader.getHit()) {
						remove_element(flyInvader,_flyOverInvaders);
						_def.lifes = _def.lifes + 1;
						update_lifes();
					}
					return true;
				}
			}
			return true;
		}

		private function hitProjectile(projectile:Projectile, container:Array) {
			if (projectile != null) {
				var p:Projectile = projectile.hit();
				if (p == null) {
					container.splice(container.indexOf(projectile),1);
					projectile.parent.removeChild(projectile);
				} else {
					projectile.parent.removeChild(projectile);
					container.splice(container.indexOf(projectile),1);
					gameContainer.addChild(p);
					container.push(p);
				}
			}
		}

		private function move_projectiles() {
			for (var i = 0; i < 12; i++) {
				for each (var def_projectile:Projectile in _defProjectiles) {
					def_projectile.move();
					//if projectile is out of the screen;
					if (def_projectile.y < 0) {
						remove_element(def_projectile,_defProjectiles);
					} else {
						//else try to hit something
						if (! check_barrier_hit(def_projectile,_defProjectiles)) {
							check_invader_hit(def_projectile,_defProjectiles);
						}
					}

				}
				// now loop through invader projectiles
				for each (var projectile:Projectile in _projectiles) {
					projectile.move();
					if (projectile.y > 450) {
						remove_element(projectile,_projectiles);
					} else {
						if (! check_barrier_hit(projectile,_projectiles)) {
							if (checkHit(_def,projectile)) {
								hitProjectile(projectile,_projectiles);
								if (_def.getHit()) {
									gameContainer.removeChild(_defLifeSymbols);
									update_lifes();
									if (_def.lifes <= 0) {
										game_over();
									}
								}
							}
						}
					}
				}
			}
		}
		private function checkHit(e:MovieClip,p:Projectile):Boolean {
			if (e is Hittable) {
				if (p.y <= e.y && p.y > e.y - e.height && p.x - p.width < e.x + e.width && p.x + p.width > e.x) {
					return true;
				}
			}
			return false;
		}

		private function game_over() {
			removeEventListener(Event.ENTER_FRAME,moveElements);
			gotoAndStop('gameover');
			_timer.stop();
			var myXML:XML  = <HIGHSCORE>
			<LEVEL ID="Level_1">
			</LEVEL>
			<LEVEL ID="Level_2">
			</LEVEL>
			<LEVEL ID="Level_3">
			</LEVEL>
			<LEVEL ID="Level_4">
			</LEVEL>
			<LEVEL ID="Level_5">
			</LEVEL>
			<LEVEL ID="Level_6">
			</LEVEL>
			<LEVEL ID="Level_7">
			</LEVEL>
			<LEVEL ID="Level_8">
			</LEVEL>
			<LEVEL ID="Level_9">
			</LEVEL>
			<LEVEL ID="Level_10">
			</LEVEL>
			</HIGHSCORE>;
			try {
				var myLoader:URLLoader = new URLLoader();
				myLoader.load(new URLRequest("highscores.xml"));
				myLoader.addEventListener(Event.COMPLETE, processXML);
			} catch (e:Error) {
				trace("File does not exist");
			}
			function processXML(e:Event):void {
				myXML = new XML(e.target.data);
			}
			saveButton.addEventListener(MouseEvent.CLICK,saveScore);
			function saveScore(e:Event):void {
				var scores = myXML.LEVEL.(@ID == _currentLevel.id)[0].SCORE;
				var lowestScore:int = 1000000;
				if (scores.POINTS.length < 5) {
					trace(scores.POINTS.length);
					myXML.LEVEL.(@ID == _currentLevel.id)[0].prependChild(<SCORE><NAME> {nameText.text} </NAME><POINTS> {_timer.currentCount} </POINTS></SCORE>);
				} else {
					for each (var score:int in scores.POINTS) {
						if (score < lowestScore) {
							lowestScore = score;
						}
					}
					if (_timer.currentCount > lowestScore) {
						myXML.LEVEL.(@ID == _currentLevel.id)[0].SCORE.(POINTS == lowestScore)[0].replace(0,<NAME> {nameText.text} </NAME>);
						myXML.LEVEL.(@ID == _currentLevel.id)[0].SCORE.(POINTS == lowestScore)[0].replace(1,<POINTS> {_timer.currentCount} </POINTS>);
					}
				}
				var f:FileReference = new FileReference  ;
				f.save( myXML, "highscores.xml" );
			}
		removeChild(gameContainer);
		score.text = "Score: " + _timer.currentCount.toString();
		highscoreButton.addEventListener(MouseEvent.CLICK,showHighscore);
		function showHighscore(e:Event) {
			gotoAndStop('highscores');
			levelText.text = _currentLevel.id;
			var scores = myXML.LEVEL.(@ID == _currentLevel.id)[0].SCORE;
			for each (var score in scores) {
				highscoreText.appendText(score.NAME + " " + score.POINTS + "\n");
			}
		}
	}
		private function remove_element(element:Sprite, container:Array) {
		element.parent.removeChild(element);
		container.splice(container.indexOf(element),1);
	}

	public function set level(newlevel:Level) {
		_currentLevel = newlevel;
	}
}
}