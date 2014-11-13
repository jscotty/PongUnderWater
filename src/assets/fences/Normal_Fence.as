package assets.fences 
{
	import assets.PlayerFence;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Normal_Fence extends PlayerFence
	{
		private var player:Fence;
		
		public function Normal_Fence() 
		{
			player = new Fence();
			addChild(player);
		}
		
	}

}