package
{
    import org.flixel.*;
	
	public class Player extends FlxSprite{
		public var name:String;
        [Embed(source='./assets/player.png')] private var PlayerImage:Class;

		public function Player(X:Number, Y:Number){
			super(X,Y);
            loadGraphic(PlayerImage,true,false,15,20);
            addAnimation("down",[0,1,0,2],6+FlxG.random()*4);
            addAnimation("up",[6,7,6,8],6+FlxG.random()*4);
            addAnimation("left",[3,4,3,5],6+FlxG.random()*4);
            addAnimation("right",[9,10,9,11],6+FlxG.random()*4);
            addAnimation("stopped", [0]);
            maxVelocity.x = 80;
            maxVelocity.y = 80;
            acceleration.y = 0;
            width = 15;
            height = 20;
            drag.x = maxVelocity.x*4;
            drag.y = maxVelocity.y*4;
		}

        override public function update():void
        {
            acceleration.x = 0;
            acceleration.y = 0;

            if(FlxG.keys.LEFT){
                acceleration.x = -maxVelocity.x*4;
                facing = LEFT;
            }
            if(FlxG.keys.RIGHT){
                acceleration.x = maxVelocity.x*4;
                facing = RIGHT
            }
            if(FlxG.keys.UP){
                acceleration.y = -maxVelocity.y*4;
                facing = UP;
            }
            if(FlxG.keys.DOWN){
                acceleration.y = maxVelocity.y*4;
                facing = DOWN;
            }

            if(velocity.y > 0){
                play("down");
            }else if(velocity.y < 0){
                play("up");
            }else if(velocity.x > 0){
                play("right");
            }else if(velocity.x < 0){
                play("left");
            }else{
                play("stopped");
            }

            super.update()
        }
	}
}
