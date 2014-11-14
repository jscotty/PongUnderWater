package assets.puffers 
{
	import assets.Puffer;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Big_Puffer extends Puffer
	{
		private var _puffer:FatPuffer;
		
		public function Big_Puffer() 
		{
			_puffer = new FatPuffer();
			addChild(_puffer);
		}
		
	}

}