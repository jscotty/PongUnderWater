package assets.pickups 
{
	import assets.Pickup;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Special_Pickup extends Pickup
	{
		private var _pickup:SpecPickup;
		
		public function Special_Pickup() 
		{
			_pickup = new SpecPickup();
			addChild(_pickup);
			
			score = 150;
		}
		
	}

}