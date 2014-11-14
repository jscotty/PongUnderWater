package assets.puffers 
{
	import assets.Puffer;
	import flash.events.Event;
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
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			if (anim == 0) {
				_puffer.visible = true;
				_pufferFat.visible = false;
			}
			if (anim == 1) {
				_puffer.visible = false;
				_pufferFat.visible = true;
			}
		}
		
		
	}

}