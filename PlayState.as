package
{
    import org.flixel.*;
 
    public class PlayState extends FlxState
    {
        public var level:FlxTilemap;
        public var player:Player;
		public var ennemy:Ennemy;
		public var targetPoints:FlxGroup;
		public var doors:FlxGroup;
		public var status:FlxText;
		public var status2:FlxText;
        [Embed(source='./assets/truetile.png')] private var TileImage:Class;

        override public function create():void
        {
            FlxG.bgColor = 0xffaaaaaa;
            var data:Array = new Array(
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
        );
            level = new FlxTilemap();
            level.loadMap(FlxTilemap.arrayToCSV(data,40),TileImage , 50, 50, FlxTilemap.OFF, 0, 0, 2); /*FlxTilemap.ImgAuto*/
            add(level);

			status = new FlxText(FlxG.width-160-2,2,160);
			status.shadow = 0xff000000;
			status.alignment = "right";
			status.text = "On commence";
            status.scrollFactor.x = status.scrollFactor.y = 0;
			add(status);            
            status2 = new FlxText(FlxG.width-160-2,30,160);
			status2.shadow = 0xff000000;
			status2.alignment = "right";
			status2.text = "On commence";
            status2.scrollFactor.x = status2.scrollFactor.y = 0;
			add(status2);            


            //Create player (a boy)
            player = new Player(70,70);
            add(player);
            FlxG.camera.follow(player)

			//create ennemy (a girl)
			
			ennemy = new Ennemy(70,140);
			ennemy.maxVelocity.x = 60;
            ennemy.maxVelocity.y = 60;
			add(ennemy);
			
			//create checkpoint of pathfinding
			targetPoints = new FlxGroup();
			var firstPoint:TargetPoint = createTargetPoint(3,3,"NW");
			createTargetPoint(13,3,"NE");
			createTargetPoint(3,27,"SW");
			createTargetPoint(13,27,"SE");
			add(targetPoints);
			
            //doors
            doors = new FlxGroup();
            createDoor(5,5,new FlxPoint(50*20,50*10)); 
            createDoor(20,11,new FlxPoint(50*5,50*6)); 
            add(doors);

			ennemy.targetName = "AA";
			redirectEnnemy(firstPoint,ennemy,true);
			
        }

		public function createTargetPoint(X:uint,Y:uint, name:String):TargetPoint
		{
			var targetPoint:TargetPoint = new TargetPoint(X*50+24,Y*50+24);
						targetPoint.makeGraphic(2,2,0xffffff00);
						targetPoint.name = name;
						targetPoints.add(targetPoint);
			return targetPoint;
		}

        public function createDoor(X:uint,Y:uint, P:FlxPoint):FlxSprite
        {
            var door:Door = new Door(X*50+15,Y*50+15,P);
                door.makeGraphic(20,20,0xff003366);
                doors.add(door);
            return door;
        }

        override public function update():void
        {
		    ennemy.acceleration.x = 0;	
		    ennemy.acceleration.y = 0;	
            var isVisible:Boolean = level.ray(new FlxPoint(ennemy.x, ennemy.y), new FlxPoint(player.x, player.y));
            if(isVisible){
                status2.text = "Ennemy sees you";
            }else{
                status2.text = "You are hidden";
            }

 
            super.update();

//            FlxG.overlap(doors,player,doorTeleport);
         
//			FlxG.overlap(targetPoints,player,touchAlarm);
//			FlxG.overlap(targetPoints,ennemy,redirectEnnemy);
//			FlxG.overlap(ennemy,player,captured);

            FlxG.collide(level,player);
		   	FlxG.collide(player,ennemy);
        }
		//Called whenever the player touches a targetpoint
		public function touchAlarm(targetPoint:TargetPoint,Player:FlxSprite):void
		{
			status.text = "Alarm "+targetPoint.name+" touched";
		}
		public function captured(ennemy:Ennemy,Player:FlxSprite):void
		{
			status.text = "Ennemy touched you !";
		}

        public function doorTeleport(door:Door,person:FlxSprite):void
        {
            status.text = "About to teleport";
			//status.text = "Teleport to "+door.teleportPoint.x+":"+door.teleportPoint.y +" !";
            person.x = door.teleportPoint.x;
            person.y = door.teleportPoint.y;
        }
		
		public function redirectEnnemy(targetPoint:TargetPoint, ennemy:Ennemy, force:Boolean=false):void
		{
			if(force || targetPoint.name == ennemy.targetName){
				var newTarget:TargetPoint = targetPoints.getRandom() as TargetPoint;
				ennemy.stopFollowingPath(true);
				ennemy.velocity.x = ennemy.velocity.y = 0;
				ennemy.targetName = newTarget.name;
				status.text = "Ennemy going to "+newTarget.name+" !";
				var path:FlxPath = level.findPath(new FlxPoint(ennemy.x + ennemy.width / 2, ennemy.y + ennemy.height / 2), new FlxPoint(newTarget.x + newTarget.width / 2, newTarget.y + newTarget.height / 2));
                path.ignoreDrawDebug = true;
				path.drawDebug();
				ennemy.followPath(path,24);
			}
		}
    }
}
