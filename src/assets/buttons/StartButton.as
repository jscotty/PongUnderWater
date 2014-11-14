package assets.buttons 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class StartButton extends Sprite
	{
		private var sound:Sound;
		private var channel:SoundChannel;
		private var tune:String = "startButton.mp3";
		private var _startGame:String = "startGame";
		
		private var btn:BtnStart;
		
		public function StartButton() 
		{
			sound = new Sound();
			channel = new SoundChannel();
			
			sound.load(new URLRequest(tune));
			
			btn = new BtnStart();
			btn.scaleX = 1.1;
			btn.scaleY = 1.1;
			addChild(btn);
			
			btn.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			channel = sound.play(0, 1);
			
			dispatchEvent(new Event(_startGame));
		}
		
	}

}