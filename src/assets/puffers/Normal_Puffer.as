package assets.puffers 
{
	import assets.Puffer;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Normal_Puffer extends Puffer
	{
		private var _puffer:NormalPuffer;
		
		public function Normal_Puffer() 
		{
			_puffer = new NormalPuffer();
			addChild(_puffer);
		}
		
	}

}