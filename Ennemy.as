package
{
    import org.flixel.*;
	
	public class Ennemy extends FlxSprite{
		public var name:String;
		public var targetName:String;
        [Embed(source='./assets/girl.png')] private var PlayerImage:Class;

		public function Ennemy(X:Number, Y:Number){
			super(X,Y);
            loadGraphic(PlayerImage,true,false,16,19);
            addAnimation("down",[0,1,0,2],6+FlxG.random()*4);
            addAnimation("up",[6,7,6,8],6+FlxG.random()*4);
            addAnimation("left",[3,4,3,5],6+FlxG.random()*4);
            addAnimation("right",[9,10,9,11],6+FlxG.random()*4);
            addAnimation("stopped", [0]);
            maxVelocity.x = 80;
            maxVelocity.y = 80;
            acceleration.y = 0;
            width = 16;
            height = 19;

		}

        override public function update():void
        {
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

