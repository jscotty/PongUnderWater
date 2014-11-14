package 
{
	import assets.buttons.StartButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import game.Game;
	import menu.MainMenu;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Main extends Sprite 
	{
		private var _startGame:String = "startGame";
		private var _themeSong:String = "theme.mp3";
		private var _mainMenu:MainMenu;
		private var _game:Game;
		
		private var _sound:Sound;
		private var _channel:SoundChannel;
		private var _soundTransform:SoundTransform;
		
		public static var score:Number = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			_sound = new Sound();
			_channel = new SoundChannel();
			_soundTransform = new SoundTransform(0.2, 0);
			
			_sound.load(new URLRequest(_themeSong));
			_channel = _sound.play(1, 9999999,_soundTransform);
			_soundTransform.volume = 0.1;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_mainMenu = new MainMenu();
			addChild(_mainMenu);
			
			var btnStart:StartButton = _mainMenu.startBtn;
			btnStart.addEventListener(_startGame, openGame);
		}
		
		private function openGame(e:Event):void 
		{
			removeChild(_mainMenu);
			_mainMenu = null;
			
			_game = new Game(stage);
			addChild(_game);
			
		}
		
	}
	
}