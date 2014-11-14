package assets.buttons 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class FullScreen extends Sprite
	{
		private var _full:FullScreenBtn;
		private var _fullHover:FullScreenOnHover;
		
		public function FullScreen() 
		{
			_full = new FullScreenBtn();
			addChild(_full);
			_full.visible = true;
			
			_fullHover = new FullScreenOnHover();
			addChild(_fullHover);
			_fullHover.visible = false;
			
			addEventListener(MouseEvent.MOUSE_OVER, onOver);
			addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
		private function onOut(e:MouseEvent):void 
		{
			if(e.target == _full){
				_full.visible = true;
				_fullHover.visible = false;
			}
			if(e.target == _fullHover){
				_full.visible = true;
				_fullHover.visible = false;
			}
		}
		
		private function onOver(e:MouseEvent):void 
		{
			if(e.target == _full){
				_full.visible = false;
				_fullHover.visible = true;
			}
			if(e.target == _fullHover){
				_full.visible = false;
				_fullHover.visible = true;
			}
		}
		
	}

}