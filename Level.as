package {
	public class Level {
		public var defender:Defender;
		public var invaders:Array;
		public var startInvaderSpeed = 1;
		public var invaderSpeedSteps = 0.01;
		public var invaderVerticalStep = 10;
		public function Level() {
		}
		public function createDefender():Defender {
			defender = new Defender(7);
			defender.x = 250;
			defender.y = 420;
			return defender;
		}
		public function createInvaders():Array {
			var test:SmallInvader_I = new SmallInvader_I();
			test.x = 100;
			test.y = 200;
			var test2:SmallInvader_I = new SmallInvader_I();
			test2.x = 200;
			test2.y = 200;
			invaders = new Array(new Array(test),new Array(test2));
			return invaders;
		}
	}
}