package
{
    import org.flixel.*;
	
	public class Door extends FlxSprite{
		public var teleportPoint:FlxPoint;

		public function Door(X:Number, Y:Number, P:FlxPoint){
            teleportPoint = P;
			super(X,Y);
		}
	}
}
