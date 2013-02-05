package 
{

	public class Level_9 extends Level
	{

		public function Level_9()
		{
			// constructor code
		}
		override public function get flyOverInvaders():Array
		{
			return new Array(new SmallInvader_IV());
		}
		override public function createInvaders():Array
		{
			var invaders:Array = new Array();
			for (var column = 0; column < 7; column++)
			{
				invaders.push(new Array());
				for (var i = 0; i < 4; i++)
				{
					var invader:SmallInvader_VIII = new SmallInvader_VIII();
					invader.x = column * 50 + 100;
					invader.y = i * 50 + 100;
					invaders[column].push(invader);
				}
			}
			var test2:BigInvader_I = new BigInvader_I();
			var test2column = 3;
			var test2row = 1;
			test2.y = test2row * 50 + 110;
			test2.x = test2column * 50 + 85;
			invaders[test2column][test2row] = test2;

			var test3:BigInvader_I = new BigInvader_I();
			var test3column = 3;
			var test3row = 2;
			test3.x = test3column * 50 + 85;
			test3.y = test3row * 50 + 110;
			invaders[test3column][test3row] = test3;

			var test4:SmallInvader_IX = new SmallInvader_IX();
			var test4column = 0;
			var test4row = 0;
			test4.x = test4column * 50 + 100;
			test4.y = test4row * 50 + 100;
			invaders[test4column][test4row] = test4;

			var test5:SmallInvader_IX = new SmallInvader_IX();
			var test5column = 0;
			var test5row = 3;
			test5.x = test5column * 50 + 100;
			test5.y = test5row * 50 + 100;
			invaders[test5column][test5row] = test5;

			var test6:SmallInvader_VII = new SmallInvader_VII();
			var test6column = 6;
			var test6row = 0;
			test6.x = test6column * 50 + 100;
			test6.y = test6row * 50 + 100;
			invaders[test6column][test6row] = test6;

			var test7:SmallInvader_VII = new SmallInvader_VII();
			var test7column = 6;
			var test7row = 3;
			test7.x = test7column * 50 + 100;
			test7.y = test7row * 50 + 100;
			invaders[test7column][test7row] = test7;

			var test8:BigInvader_II = new BigInvader_II();
			var test8column = 2;
			var test8row = 0;
			test8.x = test8column * 50 + 85;
			test8.y = test8row * 50 + 110;
			invaders[test8column][test8row] = test8;

			var test9:BigInvader_II = new BigInvader_II();
			var test9column = 2;
			var test9row = 3;
			test9.x = test9column * 50 + 85;
			test9.y = test9row * 50 + 110;
			invaders[test9column][test9row] = test9;

			var test10:BigInvader_II = new BigInvader_II();
			var test10column = 4;
			var test10row = 0;
			test10.x = test10column * 50 + 85;
			test10.y = test10row * 50 + 110;
			invaders[test10column][test10row] = test10;

			var test11:BigInvader_II = new BigInvader_II();
			var test11column = 4;
			var test11row = 3;
			test11.x = test11column * 50 + 85;
			test11.y = test11row * 50 + 110;
			invaders[test11column][test11row] = test11;




			return invaders;
		}
	}
}