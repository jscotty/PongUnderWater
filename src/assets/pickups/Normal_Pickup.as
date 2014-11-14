package assets.pickups 
{
	import assets.Pickup;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Normal_Pickup extends Pickup 
	{
		private var _pickup:NormPickup;
		
		public function Normal_Pickup() 
		{
			_pickup = new NormPickup();
			addChild(_pickup);
			
			score = 25;
		}
		
	}

}