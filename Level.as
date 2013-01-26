package {
	public class Level {
		public var defender:Defender;
		public function Level() {
		}
		public function createInvaders():Array {
			var test:StandardInvader = new StandardInvader();
			test.x = 100;
			test.y = 200;
			return new Array(new Array(test));
		}
	}
}