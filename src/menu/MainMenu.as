package menu 
{
	import assets.buttons.FullScreen;
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
		private var _bgOptions:BGOptions;
		
		public var startBtn:StartButton;
		private var _creditsBtn:BtnCredits;
		private var _howToBtn:BtnHowTo;
		private var _exitBtn:BtnExit;
		private var _optionsBtn:BtnOptions;
		private var _backBtn:BtnBack;
		
		private var _full:FullScreen;
		
		public function MainMenu() 
		{
			
			_bgHow = new BGHowTo()
			addChild(_bgHow)
			_bgHow.visible = false;
			
			_bgCredits = new BGCred()
			addChild(_bgCredits)
			_bgHow.visible = false;
			
			_bgOptions = new BGOptions()
			addChild(_bgOptions)
			_bgOptions.visible = false;
			
			_bg = new BGMenu()
			addChild(_bg);
			_bg.visible = true;
			
			startBtn = new StartButton();
			startBtn.x = 200;
			startBtn.y = 210;
			addChild(startBtn);
			startBtn.visible = true;
			
			_howToBtn = new BtnHowTo();
			_howToBtn.x = 190;
			_howToBtn.y = 325;
			_howToBtn.scaleX = 0.4;
			_howToBtn.scaleY = 0.4;
			_howToBtn.rotation = -15;
			addChild(_howToBtn);
			_howToBtn.visible = true;
			
			_optionsBtn = new BtnOptions();
			_optionsBtn.x = 200;
			_optionsBtn.y = 40;
			_optionsBtn.scaleX = 0.7;
			_optionsBtn.scaleY = 0.7;
			_optionsBtn.rotation = 15;
			addChild(_optionsBtn);
			_optionsBtn.visible = true;
			
				_full = new FullScreen();
				_full.x = 390;
				_full.y = 310;
				_full.scaleX = 0.6;
				_full.scaleY = 0.6;
				_full.rotation = 25;
				addChild(_full);
				_full.visible = false;
			
			_creditsBtn = new BtnCredits();
			_creditsBtn.x = 100;
			_creditsBtn.y = 580;
			_creditsBtn.scaleX = 0.5;
			_creditsBtn.scaleY = 0.5;
			addChild(_creditsBtn);
			_creditsBtn.visible = true;
			
			_backBtn = new BtnBack();
			_backBtn.x = 80;
			_backBtn.y = 580;
			_backBtn.scaleX = 0.5;
			_backBtn.scaleY = 0.5;
			addChild(_backBtn);
			_backBtn.visible = false;
			
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
			}else if(e.target == _creditsBtn){
				_bgCredits.visible = true;
				_bg.visible = false;
				_bgHow.visible = false;
				_bgOptions.visible = false;
				
				_backBtn.visible = true;
				_creditsBtn.visible = false;
				startBtn.visible = false;
				_optionsBtn.visible = false;
				_howToBtn.visible = false;
				_full.visible = false;
				
			}else if(e.target == _howToBtn){
				_bgCredits.visible = false;
				_bg.visible = false;
				_bgHow.visible = true;
				_bgOptions.visible = false;
				
				_backBtn.visible = true;
				_creditsBtn.visible = false;
				startBtn.visible = false;
				_optionsBtn.visible = false;
				_howToBtn.visible = false;
				_full.visible = false;
				
			}else if(e.target == _optionsBtn){
				_bgCredits.visible = false;
				_bg.visible = false;
				_bgHow.visible = false;
				_bgOptions.visible = true;
				
				_backBtn.visible = true;
				_creditsBtn.visible = false;
				startBtn.visible = false;
				_optionsBtn.visible = false;
				_howToBtn.visible = false;
				_full.visible = true;
				
			}else if(e.target == _backBtn){
				_bgCredits.visible = false;
				_bg.visible = true;
				_bgHow.visible = false;
				_bgOptions.visible = false;
				
				_backBtn.visible = false;
				_creditsBtn.visible = true;
				startBtn.visible = true;
				_optionsBtn.visible = true;
				_howToBtn.visible = true;
				_full.visible = false;
				
			}
		}
		
		
	}

}