package assets.fences 
{
	import assets.PlayerFence;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Normal_Fence extends PlayerFence
	{
		private var player:FenceLvl1;
		
		public function Normal_Fence() 
		{
			player = new FenceLvl1();
			addChild(player);
		}
		
	}

}