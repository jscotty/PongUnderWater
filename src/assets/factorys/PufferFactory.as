package assets.factorys 
{
	import assets.Puffer;
	import assets.puffers.Big_Puffer;
	import assets.puffers.Normal_Puffer;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PufferFactory
	{
		public static const NORMAL_PUFFER:String = "normal_puffer";
		public static const BIG_PUFFER:String = "big_puffer";
		
		private var _puffer:Puffer
		
		public function createPuffer(pufferType:String) :Puffer
		{
			
			if (pufferType == NORMAL_PUFFER)
			{
				_puffer = new Normal_Puffer;
			}else if (pufferType == BIG_PUFFER)
			{
				_puffer = new Big_Puffer;
			}else{
				_puffer = new Puffer();
			
			}
			
			return _puffer;
		}
		
	}

}