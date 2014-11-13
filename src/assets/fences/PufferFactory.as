package assets.fences 
{
	import assets.Puffer;
	import assets.puffers.Normal_Puffer;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PufferFactory
	{
		public static const NORMAL_PUFFER:String = "normal_puffer";
		
		private var _puffer:Puffer
		
		public function createPuffer(pufferType:String) :Puffer
		{
			
			if (pufferType == NORMAL_PUFFER)
			{
				_puffer = new Normal_Puffer;
			}else
			{
				_puffer = new Puffer();
			
			}
			
			return _puffer;
		}
		
	}

}