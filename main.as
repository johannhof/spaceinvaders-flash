package 
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
		private var _barriers:Array;

		public function main()
		{
			_barriers = new Array(new Barrier());
			addBarriers();
			_level = new Level();
			_invaders = _level.createInvaders();;
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

		private function addBarriers()
		{
			for each (var barrier:Barrier in _barriers)
			{
				addChild(barrier);
			}
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
				if (Math.random() < column[column.length - 1].shootingChance)
				{
					var p:Projectile = column[column.length - 1].shoot();
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
		private function check_barrier_hit(projectile:Projectile, container:Array)
		{
			for each (var barrier:Barrier in _barriers)
			{
				for each (var element:BarrierElement in barrier.elements)
				{
					if (checkHit(element,projectile))
					{
						hitProjectile(projectile,container);
						if (element.getHit())
						{
							barrier.elements.splice(barrier.elements.indexOf(element),1);
							barrier.removeChild(element);
						}
					}
				}
			}
		}

		private function check_invader_hit(projectile:Projectile,container:Array)
		{
			for each (var column:Array in _invaders)
			{
				for each (var invader:Invader in column)
				{
					if (checkHit(invader,projectile))
					{
						hitProjectile(projectile,container);
						if (invader.getHit())
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
				if (checkHit(flyInvader,projectile))
				{
					hitProjectile(projectile,container);
					if (flyInvader.getHit())
					{
						_flyOverInvaders.splice(_flyOverInvaders.indexOf(flyInvader),1);
						flyInvader.parent.removeChild(flyInvader);
					}
				}
			}
		}

		private function hitProjectile(projectile:Projectile, container:Array)
		{
			var p:Projectile = projectile.hit();
			if (p == null)
			{
				projectile.parent.removeChild(projectile);
				container.splice(container.indexOf(projectile),1);
			}
			else
			{
				projectile.parent.removeChild(projectile);
				container.splice(container.indexOf(projectile),1);
				addChild(p);
				container.push(p);
			}
		}

		private function move_projectiles()
		{
			//loop through defender projectiles, move and hit invaders
			for each (var def_projectile:Projectile in _defProjectiles)
			{
				for(var i = 0; i < 12; i++){;
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
					check_barrier_hit(def_projectile,_defProjectiles);
					check_invader_hit(def_projectile,_defProjectiles);
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
				if (checkHit(_def,projectile))
				{
					hitProjectile(projectile,_projectiles);
					if (_def.getHit())
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