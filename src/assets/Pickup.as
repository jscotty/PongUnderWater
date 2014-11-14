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
	public class Pickup extends Sprite 
	{
		private var _pickup:String;
		public var _score:Number;
		private var speedBonus:Number;
		
		private var _velocity:Vector2D;
		private var speedX:Number = 2;
		private var speedY:Number = 2;
		private var _rotation:int = 0;
		
		private var rot:int = 1;
		
		private var counter:int = 0;
		public var death:Boolean;
		
		public function pickupBehaviour()
		{
			trace(score);
			
			_velocity = new Vector2D(speedX, speedY);
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e:Event):void 
		{
			this.rotation = _rotation;
			
			_velocity.angle = (this.rotation) * Math.PI / 180;
			this.x += _velocity.x;
			this.y += _velocity.y;
			
			_rotation += rot;
			//trace(_rotation);
			
			if (_rotation >= 35) {
				rot = -1;
			}
			if (_rotation <= -45) {
				rot = 1;
			}
			
			var puffer:Puffer = Game.puffer;
			
			if (puffer.hitTestPoint(this.x , this.y, true)) {
				counter ++;
				if (counter == 1) {
					done();
				}
				
			}else { 
				counter = 0;
				death = false;
			}
			
		}
		
		private function done():void 
		{
			var GameScore:int = Game.score;
					GameScore += score;
					death = true;
		}
		
		public function get score():Number {
			return _score;
		}

		public function set score(score:Number):void {
			_score = score;
			trace("score : " +score);
		}
	}

}