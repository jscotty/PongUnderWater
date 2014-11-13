package assets 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PlayerFence extends Sprite
	{
		private var _fence:String;
		
		public function get fence():String
		{
			return _fence;
		}
		
		public function set fence(_fence:String):void
		{
			_fence = fence;
		}
		
	}

}