package game 
{
	import assets.factorys.FenceFactory;
	import assets.factorys.PickupFactory;
	import assets.factorys.PufferFactory;
	import assets.Pickup;
	import assets.PlayerFence;
	import assets.Puffer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Game extends Sprite 
	{
		private var st:Stage;
		
		private var _rotatingLeft:Boolean = false;
		private var _rotatingRight:Boolean = false;
		private var _force:Number = 0;
		private var _rotating:Boolean;
		
		private var _fenceFactory:FenceFactory;
		public static var fence:PlayerFence;
		
		private var _pufferFactory:PufferFactory;
		public static var puffer:Puffer;
		
		private var _pickupFactory:PickupFactory;
		private var _pickup:Pickup;
		private var pickup:Array;
		private var _backGround:BG1;
		
		private var _pauzed:Boolean = true;
		
		public static var score:Number;
		
		private var _ui:UI;
		private var _backGround2:BG2;
		private var _backGround3:BG3;
		private var _endscreen:BGEnd;
		
		private var _levelDone:String = "levelDone";
		private var _nextLevel:String = "nextLevel";
		private var _replay:String = "replay";
		
		private var _fade:Fade;
		private var congrBtn:BtnCongr;
		
		public var start:Boolean;
		
		
		private var mainScore:Number = Main.score;
		private var replayBtn:BtnReplay;
		
		private var _start:BtnStart;
		
		public var level2:int = Main.level2;
		public var level3:int = Main.level3;
		public var level4:int = Main.level4;
		
		public function Game(s:Stage) 
		{
			
			if (Main.level == level4) {
				_endscreen = new BGEnd();
				addChild(_endscreen);
			}else {
			
				
			
			level2 = Main.level2;
			level3 = Main.level3;
			level4 = Main.level4;
			
			st = s;
			if (Main.level == 1){
			_backGround = new BG1();
			addChild(_backGround);
			}
			if (Main.level == level2){
			_backGround2 = new BG2();
			addChild(_backGround2);
			}
			if (Main.level == level3){
			_backGround3 = new BG3();
			addChild(_backGround3);
			}
			
			
			_fenceFactory = new FenceFactory();
			fence = _fenceFactory.createFence(FenceFactory.NORMAL_FENCE);
			addChild(fence);
			fence.x = 400;
			fence.y = 300;
			
			_pufferFactory = new PufferFactory();
			puffer = _pufferFactory.createPuffer(PufferFactory.NORMAL_PUFFER);
			addChild(puffer);
			puffer.x = 400;
			puffer.y = 300;
			puffer.scaleX = 0.7;
			puffer.scaleY = 0.7;
			
			pickup = new Array();
			for (var i:int = 0; i < 10; i++){
			_pickupFactory = new PickupFactory();
			_pickup = _pickupFactory.createPickup(PickupFactory.NORMAL_PICKUP);
			pickup.push(_pickup);
			addChild(_pickup);
			pickup[i].x = -50 + i * -500 + Math.random() * -2000 ;
			pickup[i].y = Math.random() * 400 + 100;
			pickup[i].scaleX = 0.1;
			pickup[i].scaleY = 0.1;
			pickup[i].pickupBehaviour();
			}
			score = mainScore;
			trace(mainScore);
			
			_ui = new UI();
			_ui.x = 30;
			_ui.y = 10;
			addChild(_ui);
			
			if (Main.level == 1) {
				_ui.time = 20;
			}
			if (Main.level == level2) {
				_ui.time = 120;
			}
			
			if (Main.level == level3) {
				_ui.time = 180;
			}
			
			eventListeners();
			
			_fade = new Fade();
			addChild(_fade);
			_fade.alpha = 0;
			
			trace( "level2: " + level2);
			trace("level3 "+level3);
			
			}
			
		}
		
		
		private function eventListeners():void 
		{
			
			addEventListener(Event.ENTER_FRAME, update);
			st.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			st.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		private function update(e:Event):void 
		{
			fence.rotation += _force;
			
			score = mainScore;
			
			
			if (_rotatingLeft && !_rotating) {
				_rotating = true;
				_force = 3;
			}
			else if (_force > 0) {
				_force -= 0.6;
				_rotating = false;
				if (_force < 0.5) {
					_force = 0;
				}
			}
			
			if (_rotatingRight && !_rotating) {
				_rotating = true;
				_force = -3;
			}
			else if (_force < 0) {
				_force += 0.6;
				_rotating = false;
			}
			else if (_rotatingRight && _rotatingLeft) {
				_rotating = false;
				_force = 0;
			}
			
			if (puffer.x <= -100 || puffer.x >= 900 || puffer.y <= -100 || puffer.y >= 700) {
				death();
			}
			
			_ui.addEventListener(_levelDone, done);
		}
		
		private function death():void 
		{	
			var length:int = pickup.length;
			
			for (var i:int = 0; i < length; i++) {
				pickup[i].removeEventListener(Event.ENTER_FRAME, pickup[i].update);
			}
			
			removeEventListener(Event.ENTER_FRAME, update);
			st.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			st.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			_ui.removeEventListener(Event.ENTER_FRAME, _ui.update);
			
			puffer.removeEventListener(Event.ENTER_FRAME, puffer.movement);
			trace("death!");
			
			replay();
			addEventListener(Event.ENTER_FRAME, deathFade);
		}
		
		private function deathFade(e:Event):void 
		{
			_fade.alpha += 0.01;
			replayBtn.alpha += 0.02;
			if (_fade.alpha >= 0.5) {
				_fade.alpha = 0.5;
			}
			if (replayBtn.alpha >= 1) {
				replayBtn.alpha = 1;
			}
		}
		
		private function replay():void 
		{
			replayBtn = new BtnReplay();
			replayBtn.x = 400;
			replayBtn.y = 200;
			replayBtn.scaleX = 0.8;
			replayBtn.scaleY = 0.8;
			replayBtn.alpha = 0;
			addChild(replayBtn);
			
			
			replayBtn.addEventListener(MouseEvent.CLICK, replayClick);
		}
		
		private function replayClick(e:MouseEvent):void 
		{
			
			removeEventListener(Event.ENTER_FRAME, deathFade);
			dispatchEvent(new Event(_replay));
		}
		
		private function done(e:Event):void 
		{
			var length:int = pickup.length;
			
			for (var i:int = 0; i < length; i++) {
				pickup[i].removeEventListener(Event.ENTER_FRAME, pickup[i].update);
			}
			
			removeEventListener(Event.ENTER_FRAME, update);
			st.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			st.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			_ui.removeEventListener(Event.ENTER_FRAME, _ui.update);
			
			puffer.removeEventListener(Event.ENTER_FRAME, puffer.movement);
			trace("done");
			
			congratz();
			addEventListener(Event.ENTER_FRAME, doneFade);
			
			 
			
		}
		
		private function congratz():void 
		{
			congrBtn = new BtnCongr();
			congrBtn.x = 400;
			congrBtn.y = 200;
			congrBtn.scaleX = 0.8;
			congrBtn.scaleY = 0.8;
			congrBtn.alpha = 0;
			addChild(congrBtn);
			
			
			congrBtn.addEventListener(MouseEvent.CLICK, doneClick);
			
		}
		
		private function doneClick(e:MouseEvent):void 
		{
			removeEventListener(Event.ENTER_FRAME, doneFade);
			dispatchEvent(new Event(_nextLevel));
		}
		
		private function doneFade(e:Event):void 
		{
			_fade.alpha += 0.01;
			congrBtn.alpha += 0.02;
			if (_fade.alpha >= 0.5) {
				_fade.alpha = 0.5;
			}
			if (congrBtn.alpha >= 1) {
				congrBtn.alpha = 1;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			
			if (e.keyCode == 39) {
				_rotatingLeft = false;
			}
			if (e.keyCode == 37) {
				_rotatingRight = false;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == 39) {
				_rotatingLeft = true;
			}
			if (e.keyCode == 37) {
				_rotatingRight = true;
			}
		}
		
		public static function points():void {
			Main.score += Pickup._score;
		}
		
	}

}