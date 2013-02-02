﻿package 
{

	public class Level_4 extends Level
	{

		public function Level_4()
		{
			// constructor code
		}
		overwrite public var defender:Defender;
		overwrite public var startInvaderSpeed = 1.4;
		overwrite public var invaderSpeedSteps = 0.01;
		overwrite public var invaderVerticalStep = 10;
		overwrite public var flyOverChance = 0.05;

		overwrite public function get flyOverInvaders():Array
		{
			return new Array(new SmallInvader_V());
		}

		overwrite public function createInvaders():Array
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
			var test2:SmallInvader_I = new SmallInvader_I();
			test2.x = 200;
			test2.y = 200;
			return invaders;
		}
	}
}