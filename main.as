﻿package 
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class main extends MovieClip
	{
		private var _def:Defender;
		private var _defProjectiles:Array;
		private var _projectiles:Array;
		private var _invaders:Array;
		private var _flyOverInvaders:Array;
		private var _level;
		private var _invaderSpeed;
		private var _invadersMoveRight:Boolean = true;

		public function main()
		{
			_level = new Level();
			_level.createInvaders();
			_invaders = _level.invaders;
			addInvadersToStage(_invaders);
			_flyOverInvaders = new Array();
			_defProjectiles = new Array();
			_projectiles = new Array();
			_invaderSpeed = _level.startInvaderSpeed;
			var defender:Defender = new Defender_II(7);
			defender.x = 250;
			defender.y = 420;
			_def = defender;
			addChild(_def);
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, invaders_shoot);
			timer.addEventListener(TimerEvent.TIMER, addFlyOver);
			timer.start();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(Event.ENTER_FRAME,moveElements);
		}

		private function addFlyOver(e:Event)
		{
			if (_level.flyOverChance > Math.random())
			{
				var invader:Invader = _level.flyOverInvaders[0];
				invader.x = 0;
				invader.y = 50;
				_flyOverInvaders.push(invader);
				addChild(invader);
			}
		}

		private function invaders_shoot(e:Event)
		{
			for each (var column:Array in _invaders)
			{
				for each (var invader:Invader in column)
				{
					var p:Projectile = invader.shoot();
					if (p != null)
					{
						addChild(p);
						_projectiles.push(p);
					}
				}
			}
		}
		private function addInvadersToStage(rows:Array)
		{
			for each (var column:Array in rows)
			{
				for each (var invader:Invader in column)
				{
					addChild(invader);
				}
			}
		}
		public function keyDownHandler(e:KeyboardEvent)
		{
			var key:uint = e.keyCode;
			if (key == Keyboard.LEFT && _def.x > 50)
			{
				_def.x -=  _def.speed;
			}
			else if (key == Keyboard.RIGHT  && _def.x < stage.stageWidth - 50)
			{
				_def.x +=  _def.speed;
			}
			else if (key == Keyboard.SPACE)
			{
				if (_defProjectiles.length < _def.maxProjectiles)
				{
					var p:Projectile = _def.shoot();
					_defProjectiles.push(p);
					addChild(p);
				}

			}
		}
		public function moveElements(e:Event)
		{
			move_projectiles();
			move_invaders();
			move_flyOver();
		}
		private function move_flyOver()
		{
			for each (var invader:Invader in _flyOverInvaders)
			{
				invader.x +=  _invaderSpeed;
			}

		}
		private function move_invaders()
		{
			for each (var column:Array in _invaders)
			{
				for each (var invader:Invader in column)
				{
					if (_invadersMoveRight)
					{
						invader.x +=  _invaderSpeed;
					}
					else
					{
						invader.x -=  _invaderSpeed;
					}
					if ((invader.x > 450 && _invadersMoveRight) || (invader.x < 50 && !_invadersMoveRight))
					{
						_invadersMoveRight = ! _invadersMoveRight;
						jump_invaders();
					}
				}
			}
			_invaderSpeed +=  _level.invaderSpeedSteps;
		}
		private function jump_invaders()
		{
			for each (var column:Array in _invaders)
			{
				for each (var invader:Invader in column)
				{
					invader.y +=  _level.invaderVerticalStep;
				}
			}
		}
		private function move_projectiles()
		{
			//loop through defender projectiles, move and hit invaders
			for each (var def_projectile:Projectile in _defProjectiles)
			{
				def_projectile.move();
				//if projectile is out of the screen;
				if (def_projectile.y < 0)
				{
					def_projectile.parent.removeChild(def_projectile);
					_defProjectiles.splice(_defProjectiles.indexOf(def_projectile),1);
				}
				else
				{
					//else try to hit something
					//first try to hit each invader
					for each (var column:Array in _invaders)
					{
						for each (var invader:Invader in column)
						{
							if (checkHit(invader,def_projectile) == true)
							{
								if (def_projectile.hit() == true)
								{
									def_projectile.parent.removeChild(def_projectile);
									_defProjectiles.splice(_defProjectiles.indexOf(def_projectile),1);
								}
								if (invader.getHit() == true)
								{
									column.splice(column.indexOf(invader),1);
									invader.parent.removeChild(invader);
								}
							}
						}
					}
					// now try to hit each invader flying over
					for each (var flyInvader:Invader in _flyOverInvaders)
					{
						if (checkHit(flyInvader,def_projectile) == true)
						{
							if (def_projectile.hit() == true)
							{
								def_projectile.parent.removeChild(def_projectile);
								_defProjectiles.splice(_defProjectiles.indexOf(def_projectile),1);
							}
							if (flyInvader.getHit() == true)
							{
								_flyOverInvaders.splice(_flyOverInvaders.indexOf(flyInvader),1);
								flyInvader.parent.removeChild(flyInvader);
							}
						}
					}
				}

			}
			for each (var projectile:Projectile in _projectiles)
			{
				projectile.move();
				if (projectile.y > 450)
				{
					projectile.parent.removeChild(projectile);
					_projectiles.splice(_projectiles.indexOf(projectile),1);
				}
				else
				{
					if (checkHit(_def,projectile) == true)
					{
						if (projectile.hit() == true)
						{
							projectile.parent.removeChild(projectile);
							_projectiles.splice(_projectiles.indexOf(projectile),1);
						}
						if (_def.getHit() == true)
						{
							_def.parent.removeChild(_def);
						}
					}
				}
			}
		}
		private function checkHit(e:MovieClip,p:Projectile):Boolean
		{
			if (e is Hittable)
			{
				if (p.y <= e.y && p.y > e.y - e.height && p.x - p.width < e.x + e.width && p.x + p.width > e.x)
				{
					return true;
				}
			}
			return false;
		}
	}
}