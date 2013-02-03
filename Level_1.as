package 
{

	public class Level_1 extends Level
	{

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
			var test2:SmallInvader_II = new SmallInvader_II();
			var test2column = 0;
			var test2row = 0;
			test2.x = test2column * 50 + 100;
			test2.y = test2row * 50 + 100;
			invaders[test2column][test2row] = test2;

			var test3:SmallInvader_II = new SmallInvader_II();
			var test3column = 5;
			var test3row = 0;
			test3.x = test3column * 50 + 100;
			test3.y = test3row * 50 + 100;
			invaders[test3column][test3row] = test3;

			var test4:SmallInvader_II = new SmallInvader_II();
			var test4column = 0;
			var test4row = 3;
			test4.x = test4column * 50 + 100;
			test4.y = test4row * 50 + 100;
			invaders[test4column][test4row] = test4;

			var test5:SmallInvader_II = new SmallInvader_II();
			var test5column = 5;
			var test5row = 3;
			test5.x = test5column * 50 + 100;
			test5.y = test5row * 50 + 100;
			invaders[test5column][test5row] = test5;



			return invaders;
		}
	}
}