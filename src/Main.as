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
		private var _themeSong:String = "theme.mp3";
		private var _mainMenu:MainMenu;
		private var _game:Game;
		
		private var _sound:Sound;
		private var _channel:SoundChannel;
		private var _soundTransform:SoundTransform;
		private var _startGame:String = "startGame";
		private var _nextLevel:String = "nextLevel";
		private var _replay:String = "replay";
		private var counter:int;
		
		private var replayCount:int;
		
		public static var level2:int;
		public static var level3:int;
		public static var level4:int;
		
		public static var level:int = 1;
		
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
			if(counter == 0){
			removeChild(_mainMenu);
			_mainMenu = null;
			counter ++;
			} else if (counter == 1) {
				removeChild(_game);
				_game = null;
			}
			
			_game = new Game(stage);
			addChild(_game);
			
			if (replayCount == 1) {
				level2 = 2;
				level3 = 3;
				level4 = 4;
			}else if (replayCount == 0) {
				level2 = 3;
				level3 = 4;
				level4 = 5;
			}
			trace("rcount "+level);
			
			
			_game.addEventListener(_nextLevel, nextLevel);
			_game.addEventListener(_replay, replay);
			
		}
		
		private function replay(e:Event):void 
		{
			level = 1;
			
			dispatchEvent(new Event(_startGame));
			addEventListener(_startGame, openGame);
			
			replayCount = 1;
			
			_game.start = true;
		}
		
		private function nextLevel(e:Event):void 
		{
			level += 1;
			dispatchEvent(new Event(_startGame));
			addEventListener(_startGame, openGame);
			trace("level "+level);
			
		}
		
	}
	
}