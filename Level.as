package {
	public class Level {
		public var defender:Defender;
		public var invaders:Array;
		public var startInvaderSpeed = 1;
		public var invaderSpeedSteps = 0.01;
		public function Level() {
		}
		public function createInvaders():Array {
			var test:StandardInvader = new StandardInvader();
			test.x = 100;
			test.y = 200;
						var test2:StandardInvader = new StandardInvader();
			test2.x = 200;
			test2.y = 200;
			invaders = new Array(new Array(test),new Array(test2));
			return invaders;
		}
	}
}