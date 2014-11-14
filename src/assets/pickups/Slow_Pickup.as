package assets.pickups 
{
	import assets.Pickup;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Slow_Pickup extends Pickup
	{
		private var _pickup:SlowPickup;
		
		public function Slow_Pickup() 
		{
			_pickup = new SlowPickup();
			addChild(_pickup);
			
			score = 10;
		}
		
	}

}