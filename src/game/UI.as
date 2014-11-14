package game 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class UI extends Sprite 
	{
		private var text:TextField;
		private var textTime:TextField;
		private var tf:TextFormat;
		
		private var font:String = "Gretoon";
		private var levelDone:String = "levelDone";
		
		public static var time:int = 10;
		public static var count:int;
		
		
		public function UI() 
		{
			
			tf = new TextFormat(font, 25, 0xf15822, false);
			text = new TextField();
			text.text = "";
			text.selectable = false;
			text.width = 700;
			addChild(text);
			
			textTime = new TextField();
			textTime.text = "";
			textTime.selectable = false;
			textTime.x = 350;
			addChild(textTime);
			
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function update(e:Event):void 
		{
			var score:int = Game.score;
			text.text = "score: " + score;
			text.setTextFormat(tf);
			text.embedFonts;
			
			count ++;
			if (count >= 25) {
				time --;
				count = 0;
			}
			textTime.text = "" + time;
			textTime.setTextFormat(tf);
			textTime.embedFonts;
			
			if (time <= 0) {
				time = 0;
				dispatchEvent(new Event(levelDone));
				removeEventListener(Event.ENTER_FRAME, update);
			}
		}
		
	}

}