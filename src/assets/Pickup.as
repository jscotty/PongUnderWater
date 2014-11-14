package assets 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Pickup extends Sprite 
	{
		private var _pickup:String;
		private var _score:Number;
		private var speedBonus:Number;
		
		

		public function get pickup() : String {
			return _pickup;
		}

		public function set pickup(pickup : String) : void {
			_pickup = pickup;
		}
		
		public function get score():Number {
			return _score;
		}

		public function set score(score:Number):void {
			_score = score;
		}
	}

}