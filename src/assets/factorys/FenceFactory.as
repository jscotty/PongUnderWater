package assets.factorys 
{
	import assets.fences.Normal_Fence;
	import assets.PlayerFence;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class FenceFactory
	{
		public static const NORMAL_FENCE:String = "normal";
		private var _fence:PlayerFence;
		
		public function createFence(fenceType:String) :PlayerFence
		{
			
			if (fenceType == NORMAL_FENCE) {
				_fence = new Normal_Fence();
			}else {
				_fence = new PlayerFence();
			}
			
			return _fence;
		}
		
	}

}