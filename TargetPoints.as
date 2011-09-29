package
{
    import org.flixel.*;
	
	public class TargetPoints extends FlxGroup{
		public var name:String;
		public function TargetPoints(){
			super();
		}
		override public function getRandom():TargetPoint
		{
			return super.getRandom() as TargetPoint;
		}
	}
}
