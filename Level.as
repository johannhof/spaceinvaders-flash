package 
{
	public class Level
	{
		public var defender:Defender;
		public var startInvaderSpeed = 1;
		public var invaderSpeedSteps = 0.01;
		public var invaderVerticalStep = 10;
		public var flyOverChance = 0.05;

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