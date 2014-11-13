package assets 
{
	import assets.fences.Normal_Fence;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class FenceFactory extends PlayerFence
	{
		public static const NORMAL_FENCE:String = "normal";
		private var _fence:PlayerFence;
		
		public function createFence(fenceType:String) 
		{
			_fence = new PlayerFence();
			
			if (fenceType == NORMAL_FENCE) {
				_fence = new Normal_Fence();
			}
			
			return _fence;
		}
		
	}

}