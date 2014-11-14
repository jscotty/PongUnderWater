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
		private var _backGround:BG1;
		
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
			
			_pickupFactory = new PickupFactory();
			_pickup = _pickupFactory.createPickup(PickupFactory.NORMAL_PICKUP);
			addChild(_pickup);
			_pickup.x = -50;
			_pickup.y = 300;
			_pickup.scaleX = 0.1;
			_pickup.scaleY = 0.1;
			_pickup.pickupBehaviour();
			
			var mainScore:Number = Main.score;
			score = mainScore;
			
			_ui = new UI();
			_ui.x = 380;
			_ui.y = 10;
			addChild(_ui);
			
			s.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			s.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, update);
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
			
			if (_pickup.death == true) {
				_pickup.removeEventListener(Event.ENTER_FRAME, _pickup.update);
				_pickup.x = 900;
				_pickup.death = false;
				//_pickup = null;
				score += _pickup.score;
				trace(score);
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
		
	}

}