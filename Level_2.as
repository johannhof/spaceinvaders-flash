package {
	public class Level_2 extends Level {

		public function Level_2() {
			this.id = "Level_2";
		}

		override public function get flyOverInvaders():Array {
			return new Array(new SmallInvader_V());
		}

		override public function createInvaders():Array {
			var invaders:Array = new Array();
			for (var column = 0; column < 6; column++) {
				invaders.push(new Array());
				for (var i = 0; i < 4; i++) {
					var invader:SmallInvader_II = new SmallInvader_II();
					invader.x = column * 50 + 100;
					invader.y = i * 50 + 100;
					invaders[column].push(invader);
				}
			}
			var test2:SmallInvader_I = new SmallInvader_I();
			var test2column = 1;
			var test2row = 1;
			test2.x = test2column * 50 + 100;
			test2.y = test2row * 50 + 100;
			invaders[test2column][test2row] = test2;

			var test3:SmallInvader_I = new SmallInvader_I();
			var test3column = 4;
			var test3row = 1;
			test3.x = test3column * 50 + 100;
			test3.y = test3row * 50 + 100;
			invaders[test3column][test3row] = test3;

			var test4:SmallInvader_I = new SmallInvader_I();
			var test4column = 1;
			var test4row = 2;
			test4.x = test4column * 50 + 100;
			test4.y = test4row * 50 + 100;
			invaders[test4column][test4row] = test4;

			var test5:SmallInvader_I = new SmallInvader_I();
			var test5column = 4;
			var test5row = 2;
			test5.x = test5column * 50 + 100;
			test5.y = test5row * 50 + 100;
			invaders[test5column][test5row] = test5;



			return invaders;
		}
	}
}