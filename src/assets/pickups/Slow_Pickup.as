package assets.pickups 
{
	import assets.Pickup;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Slow_Pickup extends Pickup
	{
		
		public function Slow_Pickup() 
		{
			_pickup = new SlowPickup();
			addChild(_pickup);
			
			score = 10;
		}
		
	}

}