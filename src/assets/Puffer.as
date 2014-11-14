package assets 
{
	import assets.puffers.Normal_Puffer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import game.Game;
	import utils.Vector2D;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Puffer extends Sprite
	{
		
		private var _velocity:Vector2D;
		private var _newVelocity:Vector2D;
		private var _rotation:int;
		private var newRot:int;
		
		public static var speedX:Number = 2;
		public static var speedY:Number = 2;
		
		private var counter:int;
		
		private var sound:Sound;
		private var channel:SoundChannel;
		
		public var fat:Boolean = false;
		
		private var tune:String = "bounce.mp3";
		
		public var anim:Number = 0;
		private var animTime:int = 0;
		
		public function Puffer()
		{
			sound = new Sound();
			channel = new SoundChannel();
			
			sound.load(new URLRequest(tune));
			//trace("new Puffer");
			
			_rotation =  Math.random() * 360;
			
			
			addEventListener(Event.ENTER_FRAME, movement);
		}
		
		public function movement(e:Event):void 
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
					channel = sound.play(0, 1);
					anim = 1;
				}
			}else { 
				counter = 0;
				//trace("hallo");
			}
			
			if (anim == 1) {
				animTime ++
				if (animTime >= 40) {
					anim = 0;
					animTime = 0;
				}
			}
					speedX += 0.0004;
					speedY += 0.0004;
			//trace("speed! " + speedX);
		}
	}

}