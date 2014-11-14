package assets.factorys 
{
	import assets.Pickup;
	import assets.pickups.Normal_Pickup;
	import assets.pickups.Slow_Pickup;
	import assets.pickups.Special_Pickup;
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
		
		public function createPickup(pickupType:String) :Pickup
		{
			if (pickupType == NORMAL_PICKUP) {
				_pickup = new Normal_Pickup();
				
			}else if (pickupType == SPECIAL_BOOST_PICKUP) {
				_pickup = new Special_Pickup();
				
			}else if (pickupType == SLOW_DOWN_PICKUP) {
				_pickup = new Slow_Pickup();
				
			}else {
				_pickup = new Pickup();
			}
			
			return _pickup;
		}
		
	}

}