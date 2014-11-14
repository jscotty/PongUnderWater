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
		private var _pufferFat:FatPuffer;
		
		public function Normal_Puffer() 
		{
			_puffer = new NormalPuffer();
			addChild(_puffer);
			_puffer.visible = true;
			
			
			_pufferFat = new FatPuffer();
			addChild(_pufferFat);
			_pufferFat.visible = false;
		}
		
		
	}

}