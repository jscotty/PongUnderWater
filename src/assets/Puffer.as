package assets 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import utils.Vector2D;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Puffer extends Sprite
	{
		private var _puffer:String;
		
		private var _velocity:Vector2D;
		private var _newVelocity:Vector2D;
		private var _rotation:int;
		private var newRot:int;
		
		public static var speedX:int = 3;
		public static var speedY:int = 3;
		
		private var counter:int;
		
		public function Puffer()
		{
			
			trace("new Puffer");
			
			_rotation =  Math.random() * 360;
			
			addEventListener(Event.ENTER_FRAME, movement);
		}
		
		private function movement(e:Event):void 
		{
			this.rotation = _rotation;
			//_velocity.length = speed;
			_velocity = new Vector2D(speedX, speedY);
			_newVelocity = new Vector2D(speedX, speedY);
			
			_velocity.angle = (this.rotation) * Math.PI / 180;
			_newVelocity.angle = Math.atan2(_velocity.y, _velocity.x) - Math.atan2(_newVelocity.y, _newVelocity.x);
			
			//trace(_velocity.angle + "< current || new >" + _newVelocity.angle);
			
			//var atan:int = Math.atan2(_velocity.y, _velocity.x);
			
			this.x += _velocity.x;
			this.y += _velocity.y;
			
				
			newRot = (_newVelocity.angle/Math.PI) * 180 + 180;//- (_rotation * 2);
			
				//trace("r", _rotation, " : new rot" , newRot);
				
				var fence:PlayerFence = Game.fence;
			if (fence.hitTestPoint(this.x, this.y, true)) {
				counter ++;
				if(counter == 1){
					_rotation = newRot;
				}
			}else { 
				counter = 0;
				//trace("hallo");
			}
			
			//trace(counter);
			speedX += 0.1;
			speedY += 0.1;
		}
		
		public function get puffer():String
		{
			return _puffer;
		}
		
		public function set puffer(_fence:String):void
		{
			_puffer = puffer;
		}
	}

}