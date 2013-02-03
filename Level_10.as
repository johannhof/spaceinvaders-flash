package 
{

	public class Level_10 extends Level
	{

		public function Level_10()
		{
			// constructor code
		}

		override public function get flyOverInvaders():Array
		{
			return new Array(new SmallInvader_V());
		}
		override public function createInvaders():Array
		{
			var invaders:Array = new Array();
			for (var column = 0; column < 3; column++)
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

			var test4:SmallInvader_II = new SmallInvader_II();
			var test4column = 0;
			var test4row = 1;
			test4.x = test4column * 50 + 100;
			test4.y = test4row * 50 + 100;
			invaders[test4column][test4row] = test4;

			var test5:SmallInvader_III = new SmallInvader_III();
			var test5column = 0;
			var test5row = 2;
			test5.x = test5column * 50 + 100;
			test5.y = test5row * 50 + 100;
			invaders[test5column][test5row] = test5;

			var test6:SmallInvader_IV = new SmallInvader_IV();
			var test6column = 0;
			var test6row = 3;
			test6.x = test6column * 50 + 100;
			test6.y = test6row * 50 + 100;
			invaders[test6column][test6row] = test6;

			var test7:SmallInvader_V = new SmallInvader_V();
			var test7column = 1;
			var test7row = 3;
			test7.x = test7column * 50 + 100;
			test7.y = test7row * 50 + 100;
			invaders[test7column][test7row] = test7;
			
			var test2:SmallInvader_VII = new SmallInvader_VII();
			var test2column = 2;
			var test2row = 0;
			test2.x = test2column * 50 + 100;
			test2.y = test2row * 50 + 100;
			invaders[test2column][test2row] = test2;
			
			var test3:SmallInvader_VIII = new SmallInvader_VIII();
			var test3column = 2;
			var test3row = 1;
			test3.x = test3column * 50 + 100;
			test3.y = test3row * 50 + 100;
			invaders[test3column][test3row] = test3;
			
			var test10:SmallInvader_IX = new SmallInvader_IX();
			var test10column = 2;
			var test10row = 2;
			test10.x = test10column * 50 + 100;
			test10.y = test10row * 50 + 100;
			invaders[test10column][test10row] = test10;

			var test8:BigInvader_I = new BigInvader_I();
			var test8column = 1;
			var test8row = 0;
			test8.x = test8column * 50 + 100;
			test8.y = test8row * 50 + 100;
			invaders[test8column][test8row] = test8;

			var test9:BigInvader_II = new BigInvader_II();
			var test9column = 1;
			var test9row = 1;
			test9.x = test9column * 50 + 100;
			test9.y = test9row * 50 + 100;
			invaders[test9column][test9row] = test9;

			var test11:BigInvader_III = new BigInvader_III();
			var test11column = 1;
			var test11row = 2;
			test11.x = test11column * 50 + 100;
			test11.y = test11row * 50 + 100;
			invaders[test11column][test11row] = test11;




			return invaders;
		}
	}
}