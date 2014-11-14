package assets.factorys 
{
	import assets.Pickup;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PickupFactory 
	{
		public static const NORMAL_PICKUP :String = "normalPickup";
		public static const SPECIAL_BOOST_PICKUP :String = "specialPickup";
		public static const SLOW_DOWN_PICKUP :String = "slowPickup";
		
		private var _pickup:Pickup;
		
		/*public function PickupFactory(pickupType:String) :Pickup
		{
			if (pickupType == NORMAL_PICKUP) {
				
			}else if (pickupType == SPECIAL_BOOST_PICKUP) {
				
			}else if (pickupType == SLOW_DOWN_PICKUP) {
				
			}else {
				_pickup = new Pickup();
			}
			
			return _pickup;
		}*/
		
	}

}