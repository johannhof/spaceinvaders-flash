﻿package 
{
	public class Level
	{
		public var defender:Defender;
		public var startInvaderSpeed;
		public var invaderSpeedSteps;
		public var invaderVerticalStep;
		public var flyOverChance;

		public function get flyOverInvaders():Array
		{
			return new Array(new SmallInvader_V());
		}

		public function createInvaders():Array
		{
			var invaders:Array = new Array();
			for (var column = 0; column < 6; column++)
			{
				invaders.push(new Array());
				for (var i = 0; i < 4; i++)
				{
					var test:SmallInvader_I = new SmallInvader_I();
					test.x = column * 50 + 100;
					test.y = i * 50 + 100;
					invaders[column].push(test);
				}
			}
			var test2:SmallInvader_V = new SmallInvader_V();
			var test2column = 2;
			var test2row = 1;
			test2.x = test2column * 50 + 100;
			test2.y = test2row * 50 + 100;
			invaders[test2column][test2row] = test2;
			return invaders;
		}
	}
}