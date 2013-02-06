package {

	public class Level_5 extends Level {

		public function Level_5() {
			this.id = "Level_5";
		}

		override public function get flyOverInvaders():Array {
			return new Array(new SmallInvader_VI());
		}


		override public function createInvaders():Array {
			var invaders:Array = new Array();
			for (var column = 0; column < 7; column++) {
				invaders.push(new Array());
				for (var i = 0; i < 4; i++) {
					var invader:SmallInvader_I = new SmallInvader_I();
					invader.x = column * 50 + 100;
					invader.y = i * 50 + 100;
					invaders[column].push(invader);
				}
			}
			var test2:SmallInvader_VII = new SmallInvader_VII();
			var test2column = 3;
			var test2row = 1;
			test2.y = test2row * 50 + 100;
			test2.x = test2column * 50 + 100;
			invaders[test2column][test2row] = test2;

			var test3:SmallInvader_VII = new SmallInvader_VII();
			var test3column = 3;
			var test3row = 2;
			test3.x = test3column * 50 + 100;
			test3.y = test3row * 50 + 100;
			invaders[test3column][test3row] = test3;

			var test4:SmallInvader_III = new SmallInvader_III();
			var test4column = 0;
			var test4row = 0;
			test4.x = test4column * 50 + 100;
			test4.y = test4row * 50 + 100;
			invaders[test4column][test4row] = test4;

			var test5:SmallInvader_III = new SmallInvader_III();
			var test5column = 0;
			var test5row = 3;
			test5.x = test5column * 50 + 100;
			test5.y = test5row * 50 + 100;
			invaders[test5column][test5row] = test5;

			var test6:SmallInvader_III = new SmallInvader_III();
			var test6column = 6;
			var test6row = 0;
			test6.x = test6column * 50 + 100;
			test6.y = test6row * 50 + 100;
			invaders[test6column][test6row] = test6;

			var test7:SmallInvader_III = new SmallInvader_III();
			var test7column = 6;
			var test7row = 3;
			test7.x = test7column * 50 + 100;
			test7.y = test7row * 50 + 100;
			invaders[test7column][test7row] = test7;




			return invaders;
		}
	}
}