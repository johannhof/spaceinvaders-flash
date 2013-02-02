package 
{

	public class Level_1 extends Level
	{
		public function Level_1(){
			startInvaderSpeed = 1;
			invaderSpeedSteps = 0.01;
			invaderVerticalStep = 10;
			flyOverChance = 0.05;
		}
		
		override public function get flyOverInvaders():Array
		{
			return new Array(new SmallInvader_IV());
		}

		override public function createInvaders():Array
		{
			var invaders:Array = new Array();
			for (var column = 0; column < 6; column++)
			{
				invaders.push(new Array());
				for (var i = 0; i < 4; i++)
				{
					var invader:SmallInvader_I = new SmallInvader_I();
					invader.x = column * 50 + 100;
					invader.y = i * 50 + 100;
					invaders[column].push(invader);
				}
			}
			var test2:SmallInvader_I = new SmallInvader_I();
			test2.x = 200;
			test2.y = 200;
			return invaders;
		}
	}
}