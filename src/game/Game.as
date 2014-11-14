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
		
		public function Game(s:Stage) 
		{
			
			st = s;
			_backGround = new BG1();
			addChild(_backGround);
			
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
			var mainScore:Number = Main.score;
			score = mainScore;
			
			_ui = new UI();
			_ui.x = 30;
			_ui.y = 10;
			addChild(_ui);
			
			eventListeners();
			
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
		
		public static function points() {
			score += Pickup._score;
		}
		
	}

}