package menu 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class MainMenu extends Sprite
	{
		private var _startGame:String = "startGame";
		private var _bg:BackGroundMenu;
		
		private var _startBtn:BtnStart;
		private var _creditsBtn:BtnCredits;
		private var _howToBtn:BtnHowTo;
		private var _exitBtn:BtnExit;
		
		public function MainMenu() 
		{
			
			_bg = new BackGroundMenu()
			addChild(_bg);
			
			_startBtn = new BtnStart();
			_startBtn.x = 400;
			_startBtn.y = 250;
			_startBtn.scaleX = 1.1;
			_startBtn.scaleY = 1.1;
			addChild(_startBtn);
			
			_howToBtn = new BtnHowTo();
			_howToBtn.x = 400;
			_howToBtn.y = 340;
			_howToBtn.scaleX = 0.7;
			_howToBtn.scaleY = 0.7;
			addChild(_howToBtn);
			
			_creditsBtn = new BtnCredits();
			_creditsBtn.x = 100;
			_creditsBtn.y = 580;
			_creditsBtn.scaleX = 0.5;
			_creditsBtn.scaleY = 0.5;
			addChild(_creditsBtn);
			
			_exitBtn = new BtnExit();
			_exitBtn.x = 740;
			_exitBtn.y = 580;
			_exitBtn.scaleX = 0.5;
			_exitBtn.scaleY = 0.5;
			addChild(_exitBtn);
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if(e.target == _startBtn){
				dispatchEvent(new Event(_startGame));
			}
			if(e.target == _exitBtn){
				fscommand("quit");
			}
		}
		
		
	}

}