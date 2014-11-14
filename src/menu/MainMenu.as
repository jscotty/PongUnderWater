package menu 
{
	import assets.buttons.StartButton;
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
		private var _bg:BGMenu;
		private var _bgHow:BGHowTo;
		private var _bgCredits:BGCred;
		
		public var startBtn:StartButton;
		private var _creditsBtn:BtnCredits;
		private var _howToBtn:BtnHowTo;
		private var _exitBtn:BtnExit;
		private var _optionsBtn:BtnOptions;
		
		public function MainMenu() 
		{
			
			_bg = new BGMenu()
			addChild(_bg);
			_bg.visible = true;
			
			_bgHow = new BGHowTo()
			addChild(_bgHow)
			_bgHow.visible = false;
			
			_bgCredits = new BGCred()
			addChild(_bgCredits)
			_bgHow = false;
			
			startBtn = new StartButton();
			startBtn.x = 200;
			startBtn.y = 210;
			addChild(startBtn);
			
			_howToBtn = new BtnHowTo();
			_howToBtn.x = 190;
			_howToBtn.y = 325;
			_howToBtn.scaleX = 0.4;
			_howToBtn.scaleY = 0.4;
			_howToBtn.rotation = -15;
			addChild(_howToBtn);
			
			_optionsBtn = new BtnOptions();
			_optionsBtn.x = 200;
			_optionsBtn.y = 40;
			_optionsBtn.scaleX = 0.7;
			_optionsBtn.scaleY = 0.7;
			_optionsBtn.rotation = 15;
			addChild(_optionsBtn);
			
			_creditsBtn = new BtnCredits();
			_creditsBtn.x = 100;
			_creditsBtn.y = 580;
			_creditsBtn.scaleX = 0.5;
			_creditsBtn.scaleY = 0.5;
			addChild(_creditsBtn);
			
			_exitBtn = new BtnExit();
			_exitBtn.x = 750;
			_exitBtn.y = 25;
			_exitBtn.scaleX = 0.5;
			_exitBtn.scaleY = 0.5;
			addChild(_exitBtn);
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if(e.target == _exitBtn){
				fscommand("quit");
			}
		}
		
		
	}

}