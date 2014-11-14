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
		private var tf:TextFormat;
		
		private var font:String = "Gretoon";
		
		
		public function UI() 
		{
			
			tf = new TextFormat(font, 30, 0xfce556, false);
			text = new TextField();
			text.text = "";
			text.selectable = false;
			addChild(text);
			
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		
		private function update(e:Event):void 
		{
			var score:int = Game.score;
			text.text = "" + score;
			text.setTextFormat(tf);
			text.embedFonts;
		}
		
	}

}