package
{
    import org.flixel.*;
    [SWF(width="640", height="480", backgroundColor="#000000")]
 
    public class Furtivity extends FlxGame
    {
        public function Furtivity()
        {
            super(320,240,PlayState,2);
			FlxG.debug=true;
        }
    }
}
