/******************************************************************************
*                          Soooo 'Wasted' Cod4 Patch                          *
*******************************************************************************
*                                 Version 7.2                                 *
*******************************************************************************
*                        Patch Created by: IELIITEMODZX                       *
*******************************************************************************
*								  <3 Mikeeeyy								  *
*                  Please Leave This Header Untouched/Intact                  *
******************************************************************************/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include wasted\IELIITEMODZX;
#include wasted\_load;
#include maps\mp\gametypes\_rank;

createBase()
{
	//my skyBase can be smaller but it fits good in this .gsc
	if(!level.spawningObject)
	{
		if(!level.skyBaseSpawn)
		{
			thread deleteAllModels();
			level.spawningObject = true;
			level.skyBaseSpawn = true;
			if(isMap("mp_countdown"))
			{
				level.skyBase["origin"] = (1765,860,520);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_slieghtofhand";
				thread skyBaseLights();
				thread telePort((2331,514,-12),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(2331,514,-7),false);
			}
			if(isMap("mp_vacant"))
			{
				level.skyBase["origin"] = (174,604,180);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_juggernaut";
				thread telePort((-1803,1738,-104),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(-1803,1738,-104),false);
			}
			if(isMap("mp_convoy"))
			{
				level.skyBase["origin"] = (2561,56,600);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_slieghtofhand";
				thread skyBaseBars();
				thread telePort((1138,1289,-55),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(1138,1289,-55),false);
			}
			if(isMap("mp_crossfire"))
			{
				level.skyBase["origin"] = (5439,-901,535);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_martyrdom";
				thread skyBaseLights();
				thread telePort((4164, -1894, 23),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(4164,-1894,23),false);
			}
			if(isMap("mp_citystreets"))
			{
				level.skyBase["origin"] = (5340,-175,1285);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_martyrdom";
				thread skyBaseLights();
				thread telePort((2373,-874,-95),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(2373,-874,-95),false);
			}
			if(isMap("mp_crash"))
			{
				level.skyBase["origin"] = (1868,-1443,791);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_stoppingpower";
				thread telePort((1411,-1701,226),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(1411,-1701,226),false);
			}
			if(isMap("mp_overgrown"))
			{
				level.skyBase["origin"] = (2662,-2839,967);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_slieghtofhand";
				thread telePort((-1007,-3696,-107),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(-1007,-3696,-107),false);
			}
			if(isMap("mp_farm"))
			{
				level.skyBase["origin"] = (1663,3262,806);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_stoppingpower";
				thread telePort((317,1036,217),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(317,1036,217),false);
			}
			if(isMap("mp_shipment"))
			{
				level.skyBase["origin"] = (-4890,4813,168);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "";
				thread telePort((680,13,201),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(680,13,201),false);
			}
			if(isMap("mp_showdown"))
			{
				level.skyBase["origin"] = (1219,631,367);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_last_stand";
				thread telePort((859,511,16),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(859,511,16),false);
			}
			if(isMap("mp_strike"))
			{
				level.skyBase["origin"] = (959,-173,447);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_stoppingpower";
				thread skyBaseLights();
				thread telePort((343,412,16),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(343,412,16),false);
			}
			if(isMap("mp_broadcast"))
			{
				level.skyBase["origin"] = (512,2,662);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_slieghtofhand";
				thread skyBaseBars();
				thread telePort((-2233,3275,-64),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(-2233,3275,-64),false);
			}
			if(isMap("mp_backlot"))
			{
				level.skyBase["origin"] = (1493,-589,325);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_slieghtofhand";
				thread skyBaseBars();
				thread telePort((1437,288,240),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(1437,288,240),false);
			}
			if(isMap("mp_bog"))
			{
				level.skyBase["origin"] = (5895,2904,312);
				pos = level.skyBase["origin"];
				level.box["top_Icon"] = "perc_doubletap";
				thread skyBaseLights();
				thread telePort((4385,102,9),((pos[0]+186),(pos[1]-21),(pos[2]+30)),true);
				thread telePort(((pos[0]+186),(pos[1]-21),(pos[2]+19)),(4385,102,9),false);
			}
			if(isMap("mp_pipeline") || isMap("mp_creek") || isMap("mp_carentan") || isMap("mp_killhouse") || isMap("mp_cargoship") || isMap("mp_bloc"))
				self iPrintln("^1Sorry You Cant Spawn It On This Map");//these maps are not used alot, plus i got bored making this. :D
				
			else
			{
				s = [];
				s[0] = ::window;
				s[1] = ::constructBase;
				s[2] = ::mystery_box;
				for(k = 0; k < s.size; k++)
					thread [[s[k]]]();
					
				self iPrintln("skyBase Spawned");
				level.spawningObject = false;
			}
		}
		else
		{
			self iPrintln("skyBase Deleted");
			for(k = 0; k < level.modelEnt.size; k++)
				level.modelEnt[k] delete();
				
			for(k = 0; k < level.players.size; k++)
			{
				level.players[k] allowJump(true);
				level.players[k].randumWeapon = false;
			}
			level.sbOpen = false;
			level.skyBaseSpawn = false;
			objective_Delete(level.objective);
		}
	}
	else
		self iPrintln("^1Please Wait There Is Something Else Spawning!");
}
deleteAllModels()
{
	objective_Delete(level.objective);
	if(isDefined(level.modelEnt))
		for(k = 0; k < level.modelEnt.size; k++)
			level.modelEnt[k] delete();
			
	if(level.merryGoRound)
	{
		for(k = 0; k < level.players.size; k++)
		{
			level.players[k] unlink();
			level.players[k].Occ = false;
		}
		level.merryGoRound = false;
	}
	if(level.skyBaseSpawn)
	{
		for(k = 0; k < level.players.size; k++)
		{
			level.players[k] allowJump(true);
			level.players[k].randumWeapon = false;
		}
		level.sbOpen = false;
		level.skyBaseSpawn = false;
	}
	if(level.artilleryGunSpawn)
	{
		level notify("cannon_delete");
		level.controlPannel delete();
		level.spin delete();
		level.tilt delete();
		for(k = 0; k < 2; k++)
			level.artilleryShoot[k] delete();
			
		level.isUseingGun = false;
		level.artilleryGunSpawn = false;
		for(k = 0; k < level.players.size; k++)
			if(level.players[k].useingCannon)
				level.players[k] thread exitCannonFunctions(level.players[k].artillery);
	}
}
constructBase()
{
	for(z = 0; z < 2; z++)
		for(x = 0; x < 8; x++)
			for(y = 0; y < 8; y++)
				skyBase = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(x*30),(y*-50),(z*125),(0,90,0),false);
				
	for(k = 0; k < 5; k++)
		for(r = 0; r < 5; r++)
			skyBase = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(r*50),(28),((k*26)+10),(0,0,0),true,55);
			
	wait .05;
	for(k = 0; k < 5; k++)
		for(r = 0; r < 5; r++)
			skyBase = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(r*50),(-377),((k*26)+10),(0,0,0),true,55);
			
	for(k = 0; k < 5; k++)
		for(r = 0; r < 8; r++)
			skyBase = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(235),((r*-50)-5),((k*26)+10),(0,90,0),true,55);
			
	wait .05;
	for(k = 0; k < 2; k++)
		for(r = 0; r < 8; r++)
			skyBase = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(-29),((r*-50)-10),((k*26)+10),(0,90,0),true,55);
			
	for(k = 0; k < 8; k++)
		skyBase = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(-29),((k*-50)+10),(110),(0,90,0),true,55);
}
skyBaseBars()
{
	for(k = 0; k < 9; k++)
		skyBase = spawnModel(level.skyBase["origin"],"me_window_bars_05",(-29),((k*-43)-4),(35),(0,0,0),false);
}
skyBaseLights()
{
	for(k = 0; k < 4; k++)
		skyBase = spawnModel(level.skyBase["origin"],"com_lightbox_on",((k*63)+11),(15),(110),(0,0,0),false);
		
	wait .05;
	for(k = 0; k < 6; k++)
		skyBase = spawnModel(level.skyBase["origin"],"com_lightbox_on",(225),((k*63)-336),(110),(0,-90,0),false);
		
	wait .05;
	for(k = 0; k < 4; k++)
		skyBase = spawnModel(level.skyBase["origin"],"com_lightbox_on",((k*63)+11),(-365),(110),(0,180,0),false);
}
window()
{
	window = [];
	for(k = 0; k < 2; k++)
		for(r = 0; r < 9; r++)
			window[window.size] = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(-29),((r*-45)+10),((k*25)+11),(0,90,0),false);
			
	thread windowTrigger(window);
}
spawnModel(origin,model,xPos,yPos,zPos,angle,argument,solid)
{
	ent = spawn("script_model",(origin[0]+xPos,origin[1]+yPos,origin[2]+zPos));
	ent setModel(model);
	ent.angles = angle;
	destroyArray(ent);
	if(isSubStr(argument,true))
	{
		entSolid = spawn("trigger_radius",(origin[0]+xPos,origin[1]+yPos,origin[2]+zPos),0,solid,solid);
		entSolid setContents(1);
		entSolid.targetname = "script_collision";
		destroyArray(entSolid);
	}
	return ent;
}
destroyArray(ent)
{
	if(!isDefined(level.modelEnt))
		level.modelEnt = [];
		
	level.modelEnt[level.modelEnt.size] = ent;
}
windowTrigger(ent)
{
	controlPanel = spawnModel(level.skyBase["origin"],"com_laptop_2_open",(20),(-350),(65),(0,90,0),false);
	controlStand = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(20),(-370),(37),(-90,180,90),true,50);
	while(level.skyBaseSpawn)
	{
		for(k = 0; k < get_players().size; k++)
		{
			player = get_players()[k];
			if(distance(player.origin,(level.skyBase["origin"][0]+20,level.skyBase["origin"][1]-360,level.skyBase["origin"][2]+15)) < 40)
			{
				player.hint = "Press [{+activate}] To Open/Close Window";
				if(player useButtonPressed())
				{
					if(!level.sbOpen)
					{
						level.sbOpen = true;
						for(k = 0; k < ent.size; k++)
							ent[k] moveTo(ent[k].origin+(0,0,50),1.5);
							
						ent[ent.size-1] waittill("movedone");
					}
					else
					{
						level.sbOpen = false;
						for(k = 0; k < ent.size; k++)
							ent[k] moveTo(ent[k].origin-(0,0,50),1.5);
							
						ent[ent.size-1] waittill("movedone");
					}
				}
			}
		}
		wait .05;
	}
}
telePort(enter,exit,argument)
{
	telePort = spawnModel(enter,"prop_flag_american",(0),(0),(0),(0,170,0),false);
	if(isSubStr(argument,true))
		telePort showIconOnMap("compass_waypoint_panic");
		
	while(level.skyBaseSpawn)
	{
		for(k = 0; k < get_players().size; k++)
		{
			player = get_players()[k];
			if(distance(player.origin,enter) < 20 && !player.teleported)
			{
				player.teleported = true;
				if(isSubStr(argument,true))
					player allowJump(false);
				else
					player allowJump(true);
					
				player setOrigin(exit);
				wait 1.5;
				player.teleported = false;
			}
		}
		wait .05;
	}
}
mystery_box()
{
	level.weaponBox = spawnModel(level.skyBase["origin"],"com_plasticcase_beige_big",(200),(-255),(24),(0,-90,0),true,50);
	level.weaponIcon = spawnModel(level.skyBase["origin"],level.box["top_Icon"],(215),(-255),(74),(0,-90,0),false);
	wait 2;
	while(level.skyBaseSpawn)
	{
		for(k = 0; k < get_players().size; k++)
		{
			guy = get_players()[k];
			if(distance(guy.origin,level.weaponBox.origin ) < 50)
			{
				guy.hint = "Press [{+activate}] To Use Random Box";
				if(guy useButtonPressed() && !guy gotAllWeapons())
				{
					level.boxUser = guy;
					break;
				}
			}
		}
		if(isDefined(level.boxUser))
			break;
			
		wait .05;
	}
	user = level.boxUser;
	gun = user treasure_chest_weapon_spawn(level.weaponBox.origin);
	thread boxTimeout(user,gun);
	while(level.skyBaseSpawn)
	{
		if(distance(user.origin,level.weaponBox.origin) < 50)
		{
			user.hint = "Press [{+activate}] To Take Weapon";
			if(user useButtonPressed())
			{
				user giveWeapon(gun.weap,0,false);
				user switchToWeapon(gun.weap,0,false);
				user giveMaxAmmo(gun.weap,0,false);
				user playSound("oldschool_pickup");
				user notify("weapon_collected");
				break;
			}
		}
		if(isDefined(user.timedOut))
			break;
			
		wait .05;
	}
	gun delete();
	level.weaponBox delete();
	level.boxUser = undefined;
	if(level.skyBaseSpawn)
		level thread mystery_box();
}
boxTimeout(guy,gun)
{
	guy endon("weapon_collected");
	gun moveTo(gun.origin-(0,0,30),12,(12*.5));
	wait 12;
	guy.timedOut = true;
	wait 0.2;
	guy.timedOut = undefined;
}
treasure_chest_weapon_spawn(loc)
{
	gun = spawn("script_model",loc+(0,0,25));
	gun setModel("");
	gun.angles = level.weaponBox.angles;
	gun moveTo(gun.origin+(0,0,30),3,1.5,1.4);
	weaponArray = [];
	for(k = 0; k < level.weaponlist.size; k++)
	{
		if(!self hasWeapon(level.weaponlist[k]))
			weaponArray[weaponArray.size] = level.weaponlist[k];
	}
	randy = 0;
	for(k = 0; k < 40; k++)
	{
		if(k < 20) wait .05;
		else if(k < 30) wait .1;
		else if(k < 35) wait .2;
		else if(k < 38) wait .3;
		randy = weaponArray[randomInt(weaponArray.size)];
		gun setModel(getWeaponModel(randy));
		gun.weap = randy;
	}
	return gun;
}
gotAllWeapons()
{
	for(k = 0; k < level.weaponlist.size; k++)
		if(!self hasWeapon(level.weaponlist[k]))
			return false;
			
	return true;
}
showIconOnMap(shader)
{
	level.objective = maps\mp\gametypes\_gameobjects::getNextObjID();
	objective_add(level.objective,"invisible",(0,0,0));
	objective_position(level.objective,self.origin);
	objective_state(level.objective,"active");
	objective_team(level.objective,self.team);
	objective_icon(level.objective,shader);
}
hintTxt()
{
	self endon("disconnect");
	self endon("death");
	hintText = createText("default",1.4,"","",0,100,1,100,"");
	for(;;)
	{
		hintText setText(self.hint);
		self.hint = "";
		wait .1;
	}
}
build()
{
	if(!level.spawningObject)
	{
		if(!level.merryGoRound)
		{
			thread deleteAllModels();
			level.spawningObject = true;
			level.merryGoRound = true;
			thread buildMerry();
			self iPrintln("Merry Go Round Spawned!!");
		}
		else
		{
			thread deleteAllModels();
			level.merryGoRound = false;
			self iPrintln("Merry Go Round Deleted!!");
		}
	}
	else
		self iPrintln("^1Please Wait There Is Something Else Spawning!");
}
buildMerry()
{
	center = self.origin;
	level.crates = [];
	sizeArray = strTok("21;12;9",";");
	for(z = 0; z < 160; z += 155)
	{
		num = 0;
		for(k = 55; k < 200; k += 55)
		{
			for(r = 0; r < 360; r += int(sizeArray[num]))
			{
				size = level.crates.size;
				x = center[0]+(k*cos(r));
				y = center[1]+(k*sin(r));
				level.crates[size] = spawn("script_model",(x,y,center[2]+z));
				level.crates[size] setModel("com_plasticcase_beige_big");
				angle = vectorToAngles(level.crates[size].origin - (center[0],center[1],center[2]+z));
				level.crates[size].angles = (angle[0],angle[1],0);
				destroyArray(level.crates[size]);
				wait .05;
			}
			num ++;
		}
	}
	for(z = 28; z < 168; z +=28)
	{
		for(k = 0; k < 7; k++)
		{
			size = level.centerCrates.size;
			level.centerCrates[size] = spawn("script_model",(center[0],center[1],center[2]+z-10));
			level.centerCrates[size] setModel("com_plasticcase_beige_big");
			level.centerCrates[size].angles = (0,22*k,0);
			destroyArray(level.centerCrates[size]);
		}
		wait .05;
	}
	thread spawnSeat(center+(-123,101,40),(90,45,0));
	thread spawnSeat(center+(-23,-101,40),(90,0,0));
	thread spawnSeat(center+(-23,101,40),(90,0,0));
	thread spawnSeat(center+(-101,-123,40),(90,135,0));
	thread spawnSeat(center+(101,-23,40),(90,90,0));
	thread spawnSeat(center+(123,-101,40),(90,-135,0));
	thread spawnSeat(center+(101,123,40),(90,-45,0));
	thread spawnSeat(center+(-101,-23,40),(90,90,0));
	for(k = 0; k < level.merrySeat.size; k++)
	{
		level.seatCenter[k] = spawn("script_origin",center);
		destroyArray(level.seatCenter[k]);
		level.merrySeat[k] linkTo(level.seatCenter[k]);
		level.seatCenter[k] thread moveSeat();
	}
	center = spawn("script_origin",center);
	for(k = 0; k < level.crates.size; k++)
		level.crates[k] linkTo(center);
		
	center thread monitorPlayers();
	level.spawningObject = false;
	center showIconOnMap("compass_waypoint_panic");
	while(level.merryGoRound)
	{
		center rotateYaw(-360,4);
		for(k = 0; k < level.seatCenter.size; k++)
			level.seatCenter[k] rotateYaw(-360,4);
			
		wait 4;
	}
}
monitorPlayers()
{
	while(level.merryGoRound)
	{
		for(k = 0; k < level.players.size; k++)
		{
			player = level.players[k];
			if(distance(self.origin,player.origin) < 210)
			{
				closest = getClosest(player.origin,level.merrySeat);
				if(!closest.inUse && !player.Occ)
				{
					player.oldOrigin = player getOrigin();
					player playerLinkTo(closest);
					closest.inUse = true;
					player.Occ = true;
				}
				else if(player useButtonPressed() && closest.inUse && player.Occ)
				{
					player unlink();
					player setOrigin(player.oldOrigin);
					closest.inUse = false;
					wait 2;
					player.Occ = false;
				}
			}
		}
		wait .05;
	}
}
spawnSeat(arg,angles)
{
	if(!isDefined(level.merrySeat))
		level.merrySeat = [];
		
	size = level.merrySeat.size;
	level.merrySeat[size] = spawnStruct();
	level.merrySeat[size] = spawn("script_model",arg);
	level.merrySeat[size] setModel("com_barrel_blue_rust");
	level.merrySeat[size].angles = angles;
	level.merrySeat[size].inUse = false;
	destroyArray(level.merrySeat[size]);
}
moveSeat()
{
	while(level.merryGoRound)
	{
		rand = randomFloatRange(1,2);
		self moveTo((self.origin[0],self.origin[1],self.origin[2]+85),rand);
		wait rand;
		Rand = randomFloatRange(1,2);
		self moveTo((self.origin[0],self.origin[1],self.origin[2]-85),rand);
		wait rand;
	}
}
petChopper()
{
	if(!self.petHelicopterChopper)
	{
		self.petHelicopterChopper = true;
		thread spawnPetChopper();
		self iPrintln("Pet Chopper [^2ON^7]");
	}
	else
	{
		self.petHelicopter delete();
		self iPrintln("Pet Chopper [^1OFF^7]");
		self.petHelicopterChopper = false;
	}
}
spawnPetChopper()
{
	self endon("death");
	self endon("disconnect");
	thread petChopperDeath();
	self.petHelicopter = spawnHelicopter(self,self.origin+(0,0,1000),self.angles,"cobra_mp","vehicle_cobra_helicopter_fly");
	self.petHelicopter playLoopSound("mp_cobra_helicopter");
	self.petHelicopter setDamageStage(3);
	self.petHelicopter thread petShoot(self);
	self.petHelicopter chopperSettings(290,30,150,140,5,30,.5);
	while(self.petHelicopterChopper)
	{
		self.petHelicopter setSpeed(30+randomInt(20),15+randomInt(15));
		self.petHelicopter setVehGoalPos(self.origin+(self getVelocity())*2+(0,0,1000),1);
		wait .05;
	}
}
petShoot(owner)
{
	self endon("death");
	self endon("disconnect");
	while(self.petHelicopterChopper)
	{
		closest = distance(self.origin,(0,0,9999999));
		entityNum = 0;
		for(k = 0; k < level.players.size; k++)
		{
			dest = distance(self.origin,level.players[k].origin);
			if(dest < closest && isAlive(level.players[k]) && k != owner getEntityNumber())
			{
				closest = dest;
				entityNum = k;
			}
		}
		if((chopperTarget(level.players[entityNum]) >= 0) && ((level.teamBased && level.players[entityNum].team != owner.team) || (!level.teamBased && owner != level.players[entityNum])))
		{
			self setTurretTargetVec(level.players[entityNum] getTagOrigin(level.misc[7][randomInt(level.misc[7].size-1)]));
			self fireWeapon();
		}
		wait .05;
	}
}
petChopperDeath()
{
	self waittill("death");
	if(isDefined(self.petHelicopter))
		self.petHelicopter delete();
		
	self.petHelicopterChopper = false;
}
carePackage()
{
	if(!level.carePack && !self.careOnGround)
	{
		level.carePack = true;
		self.careOnGround = true;
		self iPrintln("Press [{+activate}] To Call In The Care Package At Position");
		menuAction("close");
		wait .5;
		pos = getCursorPos();
		locModel = spawn("script_model",pos);
		locModel setModel("prop_flag_american");
		for(;;)
		{
			pos = getCursorPos();
			locModel.origin = pos;
			if(self useButtonPressed())
				break;
				
			wait .05;
		}
		start = getEntArray("heli_start","targetname")[randomInt(getEntArray("heli_start","targetname").size-1)];
		self.care["helicopter"] = spawnHelicopter(self,((start.origin)+(0,0,150)),self.angles,"cobra_mp","vehicle_cobra_helicopter_fly");
		self.care["helicopter"] playLoopSound("mp_hind_helicopter");
		self.care["helicopter"] setDamageStage(3);
		self.care["box"] = spawn("script_model",self.care["helicopter"].origin);
		self.care["box"] setModel("com_plasticcase_beige_big");
		self.care["box"] linkTo(self.care["helicopter"],"tag_ground",(0,32,20),(0,0,0));
		self.care["helicopter"] chopperSettings(100,50,200,200,10,20,.1);//speed,accel,yawSpeed,yawAccel,pitch,roll,turning
		self.care["helicopter"] setVehGoalPos((pos)+(0,0,1650),1);
		self.care["helicopter"] waittill("goal");
		self.care["box"] unlink();
		self.care["box"] moveTo(pos,1.5,1);
		self.care["box"] waittill("movedone");
		self.care["icon"] = createShaderPos(self.care["box"],15);
		self.care["helicopter"] setVehGoalPos(start.origin,1);
		locModel delete();
		thread chopperEnd();
		thread careTrigger();
	}
}
createShaderPos(origin,size)
{
	point = newHudElem();
	point.x = origin.origin[0];
	point.y = origin.origin[1];
	point.z = origin.origin[2]+30;
	point setShader("waypoint_bombsquad",size,size);
	point setWayPoint(true);
	return point;
}
careTrigger()
{
	self.careGot = false;
	killSreaks = strTok("airstrike;helicopter;radar",";");
	self.progress["bar"] = createProBar((1,1,1),110,7,"","",0,60);
	self.progress["bar"] hideElem();
	progress["care"] = 0;
	thread deleteBoxOverTime();
	while(!self.careGot)
	{
		if(distance(self.origin,(self.care["box"].origin)) < 35)
		{
			self.Hint = "Press & Hold [{+activate}] For CarePackage";
			if(self useButtonPressed())
			{
				self freezeControls(true);
				progress["care"] += 3;
				if(progress["care"] > 100)
				{
					thread maps\mp\gametypes\_hardpoints::giveHardpointItem(killSreaks[randomInt(killSreaks.size-1)]+"_mp",0);
					self.care["box"] delete();
					self.progress["bar"] destroyElem();
					self freezeControls(false);
					if(isDefined(self.care["helicopter"]))
						self.care["helicopter"] delete();
						
					self.care["icon"] destroy();
					level.carePack = false;
					self.careOnGround = false;
					self.careGot = true;
				}
				self.progress["bar"] showElem();
			}
			else
			{
				self freezeControls(false);
				progress["care"] = 0;
				self.progress["bar"] hideElem();
			}
		}
		self.progress["bar"] updateBar(progress["care"]/100);
		wait .05;
	}
}
chopperEnd()
{
	self.care["helicopter"] waittill("goal");
	if(isDefined(self.care["helicopter"]))
		self.care["helicopter"] delete();
		
	level.carePack = false;
}
deleteBoxOverTime()
{
	wait 30;
	self freezeControls(false);
	if(isDefined(self.care["box"]))
		self.care["box"] delete();
		
	if(isDefined(self.progress["bar"]))
		self.progress["bar"] destroyElem();
		
	if(isDefined(self.care["icon"]))
		self.care["icon"] destroy();
		
	level.carePack = false;
	self.careOnGround = false;
	self.careGot = true;
}
modDvars()
{
	setDvars("g_teamcolor_axis,0 .4 .8;g_teamcolor_allies,1 .4 0;g_teamcolor_myteam,0 1 1 0;scr_forcerankedmatch,1;onlinegame,0");
	if(!level.moabInbound)
	{
		self setClientDvars("scr_player_maxhealth","100","clanName","DG x","hud_enable","1","cg_deadHearAllLiving","1","party_connectToOthers","0","matchmaking_debug","1","session_immediateDeleteTinySessions","0","g_speed","300");
		self setClientDvars("ui_allow_classchange","0","motd","^1www.youtube.com/IELIITEMODZX","ping_searches_per","0","party_searchResultsMin","9990","party_searchResultsLifetime","9990","party_searchPauseTime","9078");
		self setClientDvars("ui_allow_teamchange","0","lobby_partySearchWaitTime","9078","player_burstFireCooldown","0","player_sustainAmmo","1","testClients_doMove","1","testClients_doAttack","1","jump_height","1000");
		self setClientDvars("testClients_doReload","1","testClients_doCrouch","1","testClients_watchKillcam","1","PartyConnectToOthers","0","bg_fallDamageMinHeight","9999","bg_fallDamageMinHeight","9998");
	}
}
ac130()
{
	self notify("enter_ac130");
	self.noclip = false;
	menuAction("lock");
	if(isMap("mp_bloc"))
		self.ac130Loc = (1100,-5836,2000);
	else if(isMap("mp_crossfire"))
		self.ac130Loc = (4566,-3162,1800);
	else if(isMap("mp_citystreets"))
		self.ac130Loc = (4384,-469,1600);
	else if(isMap("mp_creek"))
		self.ac130Loc = (-1595,6528,2000);
	else if(isMap("mp_bog"))
		self.ac130Loc = (3767,1332,1800);
	else if(isMap("mp_overgrown"))
		self.ac130Loc = (267,-2799,2100);
	else
		self.ac130Loc = (0,0,2000);
		
	self.ac130Use = true;
	thread ac130_Spectre();
	self iPrintln("Press [{+frag}] To Exit Ac130","\n","Press [{+melee}] To Switch Weapons");
}
ac130_Spectre()
{
	setHealth(99999999999);
	level.ac["105mm"] = loadFx("explosions/aerial_explosion_large");
	level.ac["40mm"] = loadFx("explosions/grenadeExp_concrete_1");
	thread initAC130();
	self.oldOrigin = self getOrigin();
	thread linkAc130();
	self setClientDvars("cg_fov","80","scr_weapon_allowfrags","0","cg_drawcrosshair","0","cg_drawGun","0","r_colormap","1","r_fullbright","0","r_specularmap","0","r_debugShader","0","r_filmTweakEnable","1","r_filmUseTweaks","1","cg_gun_x","0","r_filmTweakInvert","1","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
	self disableWeapons();
	thread runAc130Weapon();
	thread ac130Exit();
	thread ac130Waittill();
}
linkAc130()
{
	self.ac130["model"] = spawn("script_model",(self.ac130Loc[0]+(1150*cos(0)),self.ac130Loc[1]+(1150*sin(0)),self.ac130Loc[2]));
	self.ac130["model"] setModel("vehicle_mi24p_hind_desert");
	thread ac130Move();
	self linkTo(self.ac130["model"],"tag_player",(0,100,-120),(0,0,0));
	self hide();
}
ac130Move()
{
	self endon("death");
	self endon("disconnect");
	while(self.ac130Use)
	{
		for(k = 0; k < 360; k++)
		{
			if(!self.ac130Use)
				break;
				
			x = self.ac130Loc[0]+(1150*cos(k));
			y = self.ac130Loc[1]+(1150*sin(k));
			angles = vectorToAngles((x,y,self.ac130Loc[2]) - self.ac130["model"].origin);
			self.ac130["model"] moveTo((x,y,self.ac130Loc[2]),.1);
			self.ac130["model"].angles = (angles[0],angles[1],angles[2]-40);
			wait .1;
		}
	}
}
initAC130()
{
	self.initAC130[0] = ::weapon105mm;
	self.initAC130[1] = ::weapon40mm;
	self.initAC130[2] = ::weapon25mm;
}
runAc130Weapon()
{
	self endon("death");
	self endon("disconnect");
	self.hudNum = 0;
	thread [[self.initAC130[self.hudNum]]]();
	while(self.ac130Use)
	{
		if(self meleeButtonPressed())
		{
			clearPrint();
			self notify("WeaponChange");
			for( k = 0; k < self.acHud[self.hudNum].size; k++ )
				self.acHud[self.hudNum][k] destroyElem();
				
			self.hudNum ++;
			if( self.hudNum >= self.initAC130.size )
				self.hudNum = 0;
				
			thread [[self.initAC130[self.hudNum]]]();
			thread runZoom();
			wait 0.5;
		}
		wait 0.05;
	}
}
runZoom()
{
	if(self.hudNum == 0)
		self setClientDvar("cg_fov",80);
		
	if(self.hudNum == 1)
		self setClientDvar("cg_fov",73);
		
	if(self.hudNum == 2)
		self setClientDvar("cg_fov",65);
}
initAcWeapons(time,hud,num,model,scale,radius,effect,sound)
{
	self endon("disconnect");
	self endon("WeaponChange");
	self endon("death");
	if(!isDefined(self.bulletCount[hud]))
		self.bulletCount[hud] = 0;
		
	resetBullet(hud,num);
	for(;;)
	{
		if(self attackButtonPressed())
		{
			self.ac130["model"] playSound(sound);
			thread createAc130Bullet(model,radius,effect);
			self.bulletCount[hud] ++;
			if(self.bulletCount[hud] <= num)
				earthQuake(scale,.2,self.origin,200);
				
			resetBullet(hud,num);
			wait time;
		}
		wait .05;
	}
}
weapon105mm()
{
	coord = strTok("21,0,2,24;-20,0,2,24;0,-11,40,2;0,11,40,2;0,-39,2,57;0,39,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.acHud[0][k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread initAcWeapons(1,0,1,"projectile_cbu97_clusterbomb",0.4,350,level.ac["105mm"],"weap_hind_missile_fire");
}
weapon40mm()
{
	coord = strTok("0,-70,2,115;0,70,2,115;-70,0,115,2;70,0,115,2;0,-128,14,2;0,128,14,2;-128,0,2,14;128,0,2,14;0,-35,8,2;0,35,8,2;-29,0,2,8;29,0,2,8;-64,0,2,9;64,0,2,9;0,-85,10,2;0,85,10,2;-99,0,2,10;99,0,2,10",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.acHud[1][k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread initAcWeapons(0.2,1,5,"projectile_hellfire_missile",0.3,80,level.ac["40mm"],"weap_deserteagle_fire_plr");
}
weapon25mm()
{
	coord = strTok("21,0,35,2;-21,0,35,2;0,25,2,46;-60,-57,2,22;-60,57,2,22;60,57,2,22;60,-57,2,22;-50,68,22,2;50,-68,22,2;-50,-68,22,2;50,68,22,2;6,9,1,7;9,6,7,1;11,14,1,7;14,11,7,1;16,19,1,7;19,16,7,1;21,24,1,7;24,21,7,1;26,29,1,7;29,26,7,1;36,33,6,1",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.acHud[2][k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread initAcWeapons(0.08,2,30,"projectile_m203grenade",0.2,25,level.ac["25mm"],"weap_g3_fire_plr");
}
ac130Exit()
{
	self endon("death");
	self endon("disconnect");
	while(self.ac130Use)
	{
		angles = self getPlayerAngles();
		if(angles[0] <= 20)
			self setPlayerAngles((20,angles[1],angles[2]));
			
		if(self fragButtonPressed())
		{
			thread ac130ExitFunctions();
			enterMenu("VIP");
			wait .2;
		}
		wait .05;
	}
}
ac130Waittill()
{
	self endon("enter_ac130");
	self waittill("death");
	if(self.ac130Use)
		thread ac130ExitFunctions();
}
ac130ExitFunctions()
{
	clearPrint();
	for(k = 0; k < 3; k++)
		self.bulletCount[k] = undefined;
		
	for(k = 0; k < self.acHud[self.hudNum].size; k++)
		self.acHud[self.hudNum][k] destroyElem();
		
	self unlink();
	self notify("WeaponChange");
	self show();
	self setClientDvars("cg_fov","65","scr_weapon_allowfrags","1","cg_drawcrosshair","1","cg_drawGun","1","r_colormap","1","r_fullbright","0","r_specularmap","0","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
	self.ac130["model"] delete();
	self setOrigin(self.oldOrigin);
	self enableWeapons();
	self.lockMenu = false;
	self.ac130Use = false;
}
resetBullet(hud,num)
{
	if(self.bulletCount[hud] >= num)
	{
		self iPrintln("Reloading");
		for(k = 0; k < self.acHud[self.hudNum].size; k++)
			self.acHud[self.hudNum][k] thread flash();
			
		wait 2;
		self.bulletCount[hud] = 0;
		if(isDefined(self.acHud[hud][0]))
			clearPrint();
	}
}
flash()
{
	for(k = 0; k < 2; k++)
	{
		self fadeOverTime(.5);
		self.alpha = 0;
		wait .5;
		self fadeOverTime(.5);
		self.alpha = 1;
		wait .5;
	}
}
createAc130Bullet(model,radius,effect)
{
	bullet = spawn("script_model",self getTagOrigin("tag_weapon_right"));
	bullet setModel(model);
	pos = getCursorPos();
	bullet.angles = self getPlayerAngles();
	bullet moveTo(pos,.5);
	wait .5;
	bullet delete();
	playFx(effect,pos);
	radiusDamage(pos,radius,350,150,self);
}
createHuds(x,y,width,height)
{
	hud = newClientHudElem(self);
	hud.width = width;
	hud.height = height;
	hud.align = "CENTER";
	hud.relative = "MIDDLE";
	hud.children = [];
	hud.sort = 3;
	hud.alpha = 1;
	hud setParent(level.uiParent);
	hud setShader("white",width,height);
	hud.hidden = false;
	hud setPoint("CENTER","",x,y);
	hud thread destroyAc130Huds(self);
	return hud;
}
destroyAc130Huds(player)
{
	player waittill("death");
	if(isDefined(self))
		self destroyElem();
}
clearPrint()
{
	for(k = 0; k < 4; k++)
		self iPrintln(" ");
}
kamikazeBomber()
{
	self beginLocationSelection("rank_prestige10",level.artilleryDangerMaxRadius);
	self.selectingLocation = true;
	self waittill("confirm_location",location);
	newLocation = bulletTrace(location+(0,0,1000),(location+(0,0,-100000)),0,self)["position"];
	self endLocationSelection();
	self.selectingLocation = undefined;
	kamikaze = spawnPlane(self,"script_model",newLocation+(0,0,25000));
	kamikaze setModel("vehicle_mig29_desert");
	kamikaze.angles = vectorToAngles(newLocation - kamikaze.origin);
	kamikaze thread spinKamikaze();
	kamikaze moveTo(newLocation,2.5);
	wait 2.6;
	kamikaze playSound("exp_suitcase_bomb_main");
	pos = kamikaze.origin;
	for(k = 0; k < 360; k+=40)
		playFX(level.chopper_fx["explode"]["large"],(pos[0]+(250*cos(k)),pos[1]+(250*sin(k)),pos[2]+100));
		
	earthquake(.4,4,kamikaze.origin,800);
	radiusDamage(kamikaze.origin,900,700,1,self);
	kamikaze delete();
	self.kamikazeSpin = true;
}
spinKamikaze()
{
	self.kamikazeSpin = false;
	while(!self.kamikazeSpin)
	{
		self rotateRoll(360,1.3);
		wait 1.3;
	}
}
doTeleport()
{
	self beginLocationselection("rank_prestige10",level.artilleryDangerMaxRadius);
	self.selectingLocation = true;
	self waittill("confirm_location",location);
	newLocation = bulletTrace(location+(0,0,1000),(location+(0,0,-100000)),0,self)["position"];
	self setOrigin(newLocation);
	self endLocationSelection();
	self.selectingLocation = undefined;
	self iPrintln("Teleported");
}
doNoclip()
{
	if(!self.noclip)
	{
		self.noclip = true;
		thread noclipActivate();
		menuAction("lock");
		self iPrintln("NoClip [^2ON^7]");
	}
}
noclipActivate()
{
	self endon("disconnect");
	self endon("death");
	clipModel = spawn("script_origin",self.origin);
	self linkTo(clipModel);
	thread clipDeath(clipModel);
	while(self.noclip)
	{
		if(self useButtonPressed())
			clipModel.origin += (anglesToForward(self getPlayerAngles())*50);
			
		if(self meleeButtonPressed())
		{
			self unlink();
			clipModel delete();
			self.lockMenu = false;
			self.noclip = false;
			self iPrintln("NoClip [^1OFF^7]");
		}
		wait .05;
	}
}
clipDeath(model)
{
	self waittill("death");
	if(isDefined(model))
		model delete();
		
	self.noclip = false;
}
spawnJetPlane()
{
	if(!self.jetOneTime)
	{
		menuAction("close");
		self.jetOneTime = true;
		self.jet["model"] = spawnPlane(self,"script_model",bulletTrace(self getEye(),self getEye()+vectorScale(anglesToForward(self getPlayerAngles()),250),false,self)["position"]);
		self.jet["model"] setModel("vehicle_mig29_desert");
		self.fxJet = undefined;
		self.fxWingtip = undefined;
		wait .2;
		thread waitForOccupantIn();
		thread waittillDeathJet();
	}
	else
		self iPrintln("^1You Can Only Spawn One Jet At A Time");
}
waitForOccupantIn()
{
	self endon("disconnect");
	self endon("lobby_choose");
	self.jet["in"] = false;
	self.playerOccupant = true;
	while(self.playerOccupant)
	{
		if(distance(self.origin,self.jet["model"].origin) < 150)
		{
			if(self useButtonPressed() && !self.jet["in"])
			{
				self iPrintln("Press [{+attack}] To Fly Jet","\n","Press [{+melee}] To Exit Jet");
				menuAction("lock");
				self.oldPos = self getOrigin();
				self.jet["in"] = true;
				self disableWeapons();
				self detachAll();
				self setmodel("");
				thread runPlane();
				wait 2;
			}
			if(self meleeButtonPressed() && self.jet["in"])
				thread exitJet();
		}
		wait .05;
	}
}
waittillDeathJet()
{
	self endon("end_jet");
	self waittill("lobby_choose");
	if(self.playerOccupant)
		thread exitJet();
	else
		self.jet["model"] delete();
		
	wait .2;
	self suicide();
}
exitJet()
{
	self.jetOneTime = false;
	self unlink();
	if(isDefined(self.speed["bar"]))
		self.speed["bar"] destroyElem();
		
	self enableWeapons();
	self.lockMenu = false;
	self setClientDvar("cg_thirdperson","0");
	self.jet["model"] stopLoopSound();
	self.jet["speed"] = 0;
	self.jet["model"] delete();
	self.playerOccupant = false;
	self setOrigin(self.oldPos);
	[[game[self.pers["team"]+"_model"]["SPECOPS"]]]();
	wait .3;
	self notify("end_jet");
}
runPlane()
{
	if(!isDefined(self.fxWingtip))
	{
		playFxOnTag(level.fx_airstrike_contrail,self.jet["model"],"tag_left_wingtip");
		playFxOnTag(level.fx_airstrike_contrail,self.jet["model"],"tag_right_wingtip");
		self.fxWingtip = true;
	}
	self.jet["model"] playLoopSound("veh_mig29_mid_loop");
	self.jet["speed"] = 2;
	self setOrigin(self.jet["model"].origin+(0,0,-40));
	self linkTo(self.jet["model"]);
	self setClientDvars("cg_thirdperson","1","cg_thirdpersonrange","800");
	thread planePhysics();
	thread planeRotate();
	thread contrailsPlane();
}
planePhysics()
{
	self endon("disconnect");
	self.speed["bar"] = createProBar((1,1,1),100,7,"","",0,170);
	while(self.jet["in"])
	{
		if(self attackButtonPressed())
		{
			self.jet["forwards"] = self.jet["model"].origin+vector_scale(anglesToForward(self.jet["model"].angles),5*self.jet["speed"]);
			if(self.jet["speed"] < 25)
				self.jet["speed"] += .3;
				
			self.jet["model"] moveTo(self.jet["forwards"],.05);
		}
		else
		{
			if(self.jet["speed"] > 0)
			{
				self.jet["speed"] -= .8;
				self.jet["slowdown"] = self.jet["model"].origin+vector_scale(anglestoforward(self.jet["model"].angles),5*self.jet["speed"]);
				self.jet["model"] moveTo(self.jet["slowdown"],.05);
			}
		}
		self.speed["bar"] updateBar(self.jet["speed"]/25);
		wait .05;
	}
}
planeRotate()
{
	self endon("disconnect");
	jet["turn"] = undefined;
	jet["leanAngle"] = 0;
	while(self.jet["in"])
	{
		jet["playerAngles"] = self getPlayerAngles();
		jet["angles"] = self.jet["model"].angles;
		jet["lean"] = jet["angles"][1] - jet["playerAngles"][1];
		jet["tilt"] = jet["playerAngles"][1] - jet["angles"][1];
		if(self.jet["speed"] < 1)
			jet["leanAngle"] = 0;
			
		else if(jet["lean"] > 0 && self.jet["speed"] > 5)
			jet["leanAngle"] = (jet["lean"]);
			
		else if(jet["tilt"] > 0 && self.jet["speed"] > 5)
			jet["leanAngle"] = (jet["tilt"]*-1);
			
		if(jet["playerAngles"][0] < -45 || jet["playerAngles"][0] > 45)
			jet["leanAngle"] = 0;
			
		if(self.jet["speed"] < 3)
			jet["turn"] = 1;
		else
			jet["turn"] = .4;
			
		self.jet["model"] rotateTo((jet["playerAngles"][0],jet["playerAngles"][1],jet["leanAngle"]),jet["turn"]);
		wait .05;
	}
}
contrailsPlane()
{
	self endon("disconnect");
	while(self.jet["in"])
	{
		if(self.jet["speed"] > 5 && !isDefined(self.fxJet))
		{
			self.jet["flames"][0] = playFxOnTag(level.fx_airstrike_afterburner,self.jet["model"],"tag_engine_right");
			self.jet["flames"][1] = playFxOnTag(level.fx_airstrike_afterburner,self.jet["model"],"tag_engine_left");
			self.jet["flames"][2] = playFxOnTag(level.fx_airstrike_afterburner,self.jet["model"],"tag_engine_right");
			self.jet["flames"][3] = playFxOnTag(level.fx_airstrike_afterburner,self.jet["model"],"tag_engine_left");
			self.fxJet = true;
		}
		wait .05;
	}
}
menuAction(action)
{
	if(isMenuOpen())
	{
		if(isDefined(self.wastedUI["label"]))
			self.wastedUI["label"] destroy();
			
		destroyMenuElements();
		self setClientDvar("r_blur","0","cg_drawCrosshair","1");
		self freezeControls(false);
		self setHealth(100);
		refreshInstructions();
		self.wastedUI["enter"] = false;
		self enableWeapons();
	}
	if(action != "lock")
		self.lockMenu = false;
	else
		self.lockMenu = true;
}
destroyMenuElements()
{
	if(isSub("statpick"))
	{
		for(k = 0; (k < self.wastedUI["value"].size) && (isDefined(self.wastedUI["value"][k])); k++)
			self.wastedUI["value"][k] destroy();
			
		self.wastedUI["case"] destroy();
	}
	if(isSub("prestige") || isSub("rank"))
	{
		for(k = 0; k < self.wastedUI[getData()][getType()].size; k++)
			if(isDefined(self.wastedUI[getData()][getType()][k]))
				self.wastedUI[getData()][getType()][k] destroy();
				
		if(isDefined(self.wastedUI[getType()]["number"]))
			self.wastedUI[getType()]["number"] destroy();
	}
	if(isSub("scale"))
	{
		for(k = 0; k < self.wastedUI["slider"].size; k++)
		{
			self.wastedUI["slider"][k] destroy();
			self.wastedUI["bars"][k] destroy();
			self.wastedUI["value"][k] destroy();
		}
		if(isDefined(self.wastedUI["preview"]))
			self.wastedUI["preview"] destroy();
	}
	for(k = 0; k < self.wastedUI["scrollbar"].size; k++)
	{
		self.wastedUI["scrollbar"][k] destroy();
		if(isDefined(self.wastedUI["foreground"][k]))
			self.wastedUI["foreground"][k] destroy();
	}
}
refreshInstructions()
{
	if(isAdmin())
		createInstruction(172,"Press G to open Menu;Press [{+smoke}] to switch GameType","Press [{+frag}] to open Menu;Press [{+smoke}] to switch GameType");
	else
		createInstruction(140,"Press G to open Menu","Press [{+frag}] to open Menu");
}
isButtonPressed(required)
{
	button = "";
	if(isSubStr(toLower(required),"+attack"))
		button = self attackButtonPressed();
		
	if(isSubStr(toLower(required),"+activate"))
		button = self useButtonPressed();
		
	if(isSubStr(toLower(required),"+speed_throw"))
		button = self adsButtonPressed();
		
	if(isSubStr(toLower(required),"+melee"))
		button = self meleeButtonPressed();
		
	if(isSubStr(toLower(required),"+frag"))
		button = self fragButtonPressed();
		
	if(isSubStr(toLower(required),"+smoke"))
		button = self secondaryOffHandButtonPressed();
		
	return button;
}
getGameType(coord,array)
{
	tempCoord = getSubStr(coord,0,coord.size);
	for(k = 0; k < tempCoord.size; k++)
		if(tempCoord[k] == "]")
			break;
			
	tempCoord = getSubStr(tempCoord,1,k);
	for(k = 0; k < level.misc[8].size; k++)
		if(level.misc[8][k] == tempCoord)
			break;
			
	return array[k];
}
colorMenu(menuOption)
{
	temp = menuOption;
	if(isSub("gametypes"))
	{
		self.tempColor = [];
		for(k = 0; k < 2; k++)
			self.tempColor[k] = false;
			
		temp = "";
		if(getDvar("g_gametype") == getGameType(menuOption,level.misc[10]))
			for(k = 0; k < menuOption.size; k++)
				temp += getHexColor("^2",k,menuOption)+menuOption[k];
				
		else for(k = 0; k < menuOption.size; k++)
				temp += getHexColor("^1",k,menuOption)+menuOption[k];
	}
	return temp;
}
getHexColor(color,number,option)
{
	temp = "";
	for(r = 0; r < option.size; r++)
		if(option[r] == "]")
			break;
			
	if(number < r && number > 0 && !self.tempColor[0])
	{
		temp = color;
		self.tempColor[0] = true;
	}
	else if(number >= r && !self.tempColor[1])
	{
		temp = "^7";
		self.tempColor[1] = true;
	}
	return temp;
}
setPermission(permission)
{
	self.status = permission;
}
colorPlayerList(playerList)
{
	temp = [];
	for(k = 0; k < playerList.size; k++)
	{
		if(level.players[k].status == "Un-Verified")
			temp[k] = (1,0,0);
			
		if(level.players[k].status == "Player")
			temp[k] = (0,1,0);
			
		if(level.players[k].status == "VIP")
			temp[k] = (231/255,126/255,8/255);
			
		if(level.players[k].status == "Co-Host" || level.players[k].status == "Host")
			temp[k] = (1,1,1);
	}
	return temp;
}
wideScreenMode()
{
	if(!self.wideScreen)
		self iPrintln("wideScreen Mode [^2ON^7]");
	else
		self iPrintln("wideScreen Mode [^1OFF^7]");
		
	menuAction("close");
	self.wideScreen = !self.wideScreen;
	enterMenu("main");
}
isMenuOpen()
{
	return self.wastedUI["enter"];
}
isMenuLocked()
{
	return self.lockMenu;
}
getColor()
{
	return (randomIntRange(10,255)/255, randomIntRange(10,255)/255, randomIntRange(10,255)/255);
}
isSub(required)
{
	if(isSubStr(self.wastedUI["selection"]["sub"],required))
		return true;
		
	return false;
}
getSlider()
{
	return self.wasted[getBack()][getData()].child;
}
isMap(map)
{
	if(map == getDvar("mapname"))
		return true;
		
	return false;
}
getTrueName()
{
	nameTemp = getSubStr(self.name,0,self.name.size);
	for(k = 0; k < nameTemp.size; k++)
		if(nameTemp[k] == "]")
			break;
			
	if(nameTemp.size != k)
		nameTemp = getSubStr(nameTemp,k+1,nameTemp.size);
		
	return nameTemp;
}
get_players()
{
	return level.players;
}
random(array)
{
	return array[randomint(array.size)];
}
deleteOffHand()
{
	self endon("death");
	self endon("disconnect");
	self waittill("grenade_fire",grenade);
	grenade delete();
}
isEven(Num)
{
	for(k = 0; k < 51; k +=2)
		if(isSubStr(Num,k))
			return true;
			
	return false;
}
getPlayerList()
{
	array = [];
	for(k = 0; k < level.players.size; k++)
	{
		name = getSubStr(level.players[k].name,0,90);
		for(r = 0; r < name.size; r++)
			if(name[r] == "]")
				break;
				
		if(name.size != r)
			name = getSubStr(name,r+1,name.size);
			
		array[k] = name;
	}
	return array;
}
replaceBreak(string,input,height)
{
	array = [];
	array = strTok(string,";");
	tempStr = "";
	for(k = 0; k < array.size; k++)
		tempStr += array[k]+input;
		
	if(isDefined(height))
		self.insHeight = int(array.size);
		
	return tempStr;
}
valueToArray(value)
{
	array = [];
	temp = makeString(value);
	for(k = 0; k < temp.size; k++)
		array[k] = temp[k];
		
	return array;
}
updateDvar(dvarType)
{
	value = ((self.wastedUI[getSlider()][getData()][getCurs()])*(self.wasted[getBack()][getData()].max/100));
	setDvar(dvarType,value);
	self iPrintln(self.wastedUI["option"][getBack()][getData()]," Set To ",value);
}
resampleColor(ui)
{
	if(isDefined(self.wastedUI[ui][0]))
		for(k = 0; k < 2; k++)
			self.wastedUI[ui][k].color = self.wastedUI["preview"].color;
	else
		self.wastedUI[ui].color = self.wastedUI["preview"].color;
		
	self.color[ui] = self.wastedUI["preview"].color;
	if(ui == "scrollbar")
		self.wastedUI["instructBG"].color = self.wastedUI["preview"].color;
}
menuTheme(theme)
{
	self.colorful = undefined;
	switch(theme)
	{
		case "default":
			thread themeColor((0,0,0),(0,0,0));
		break;
		case "nextgenupdate":
			thread themeColor((140/255,188/255,253/255),(22/255,46/255,80/255));
		break;
		case "se7ensins":
			thread themeColor((8/255,166/255,21/255),(212/255,212/255,212/255));
		break;
		case "youtube":
			thread themeColor((178/255,25/255,25/255),(242/255,242/255,242/255));
		break;
	}
}
themeColor(scrollBar,background)
{
	for(k = 0; k < self.wastedUI["scrollbar"].size-1; k++)
		self.wastedUI["scrollbar"][k].color = scrollBar;
		
	self.wastedUI["instructBG"].color = scrollBar;
	self.wastedUI["foreground"][0].color = background;
	self.color["scrollbar"] = scrollBar;
	self.color["foreground"] = background;
}
new()
{}
plusNum(value,num)
{
	if(num+value < num && num > 0)
		value = self.wasted[getBack()][getData()].max-num;
		
	return value;
}
minusNum(value,num)
{
	if(num-value > num && num < 0)
		value = self.wasted[getBack()][getData()].max+num;
		
	return value;
}
makeString(str)
{
	return str+"";
}
createInstruction(shaderWidth,pcInstuction,consoleInstruction)
{
	if(level.console)
		string = replaceBreak(consoleInstruction,"\n","ins");
	else
		string = replaceBreak(pcInstuction,"\n","ins");
		
	self.wastedUI["infomation"] setText(string);
	self.wastedUI["instructBG"] setShader("white",shaderWidth,(self.insHeight*19));
}
scaleFontOverTime(size,time)
{
	self endon("scroll");
	scaleSize = ((size-self.fontScale)/(time*20));
	for(k = 0; k < (20*time); k++)
	{
		self.fontScale += scaleSize;
		wait .05;
	}
}
scaleAndFade(time,size,alpha)
{
	self scaleOverTime(time,size,size);
	self hudFade(time+.05,alpha);
}
hudMove(time,point)
{
	self moveOverTime(time);
	self.x += point;
}
power(value,power)//Only works for positive integers.
{
	if(power <= 0)
		return 1;
		
	for(k = 1; k < power; k++)
		value *= value;
		
	return value;
}
runAccountSettings()
{
	if(isSub("rank") || isSub("prestige"))
	{
		if(isSub("prestige"))
		{
			self.pers["prestige"] = int(getCurs()+1);
			self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"plevel",0)),self.pers["prestige"]);
			self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"rankxp",0)),self.pers["rankxp"]);
		}
		else
		{
			self.pers["rankxp"] = int(getMisc(1)[getCurs()]);
			self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"plevel",0)),self.pers["prestige"]);
			self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"rankxp",0)),self.pers["rankxp"]);
		}
		if(updateRanks())
		{
			thread updateRankScoreHud(self.pers["rankxp"]);
			thread updateRankAnnounceHud();
		}
	}
	else if(isSub("statpick"))
	{
		if(self.wasted[getBack()][getData()].input == "time_played_total")
			self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,self.wasted[getBack()][getData()].input,0)),self.wastedUI["statValue"]*86400);
		else
			self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,self.wasted[getBack()][getData()].input,0)),int(self.wastedUI["statValue"]));
			
		self iPrintln(self.wastedUI["option"][getBack()][getData()]," Set To ",self.wastedUI["statValue"]);
	}
}
updateRanks()
{
	rankId = getRankForXp(self.pers["rankxp"]);
	if(isSub("rank") && rankId == self.pers["rank"])
		return false;
		
	self.pers["rank"] = rankId;
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"rank",0)),rankId);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"minxp",0)),getRankInfoMinXp(rankId));
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"maxxp",0)),getRankInfoMaxXp(rankId));
	self setStat(252,rankId);
	self.setPromotion = true;
	self setRank(self.pers["rank"],self.pers["prestige"]);
	return true;
}
getOffset()
{
	if(isSub("scale"))
		return self.wastedUI["bars"][0];
	else
		return self.wastedUI["label"];
}
getWideScreen()
{
	if(!self.wideScreen)
		return int(-10);
		
	return int(80);
}
getMisc(arrayInput)
{
	return level.misc[arrayInput];
}
selectEffect(owner)
{
	if(owner.oldSubMenu == owner getType())
	{
		self fadeOverTime(.09);
		self.alpha = .1;
		wait .09;
		self fadeOverTime(.09);
		self.alpha = 1;
	}
}
destroyOverTime(time)
{
	wait time;
	self destroyElem();
}
createValue(font,fontscale,align,relative,x,y,alpha,sort,value)
{
	hudValue = createFontString(font,fontscale);
	hudValue setPoint(align,relative,x,y);
	hudValue.alpha = alpha;
	hudValue.sort = sort;
	hudValue setValue(value);
	hudValue.hideWhenInMenu = true;
	thread destroyElemOnDeath(hudValue);
	return hudValue;
}
createServerValue(font,fontscale,align,relative,x,y,alpha,sort,value)
{
	hudValue = createServerFontString(font,fontscale);
	hudValue setPoint(align,relative,x,y);
	hudValue.alpha = alpha;
	hudValue.sort = sort;
	hudValue setValue(value);
	hudValue.hideWhenInMenu = true;
	return hudValue;
}
createText(font,fontscale,align,relative,x,y,alpha,sort,text)
{
	hudText = createFontString(font,fontscale);
	hudText setPoint(align,relative,x,y);
	hudText.alpha = alpha;
	hudText.sort = sort;
	hudText setText(text);
	hudText.hideWhenInMenu = true;
	thread destroyElemOnDeath(hudText);
	return hudText;
}
createServerText(font,fontscale,align,relative,x,y,alpha,sort,text)
{
	hudText = createServerFontString(font,fontscale);
	hudText setPoint(align,relative,x,y);
	hudText.alpha = alpha;
	hudText.sort = sort;
	hudText setText(text);
	hudText.hideWhenInMenu = true;
	return hudText;
}
createProBar(color,width,height,align,relative,x,y)
{
	hudBar = createBar(color,width,height,self);
	hudBar setPoint(align,relative,x,y);
	hudBar.hideWhenInMenu = true;
	thread destroyElemOnDeath(hudBar);
	return hudBar;
}
createRectangle(align,relative,x,y,width,height,color,shader,sort,alpha)
{
	barElem = newClientHudElem(self);
	barElem.elemType = "bar";
	barElem.width = width;
	barElem.height = height;
	barElem.align = align;
	barElem.relative = relative;
	barElem.children = [];
	barElem.sort = sort;
	barElem.color = color;
	barElem.alpha = alpha;
	barElem setParent(level.uiParent);
	barElem setShader(shader,width,height);
	barElem.hideWhenInMenu = true;
	barElem setPoint(align,relative,x,y);
	thread destroyElemOnDeath(barElem);
	return barElem;
}
createServerRectangle(align,relative,x,y,width,height,color,shader,sort,alpha)
{
	barElem = newHudElem();
	barElem.elemType = "bar";
	barElem.width = width;
	barElem.height = height;
	barElem.align = align;
	barElem.relative = relative;
	barElem.children = [];
	barElem.sort = sort;
	barElem.color = color;
	barElem.alpha = alpha;
	barElem setParent(level.uiParent);
	barElem setShader(shader, width, height);
	barElem.hidden = false;
	barElem setPoint(align, relative, x, y);
	return barElem;
}
destroyElemOnDeath(elem)
{
	self waittill("death");
	if(isDefined(elem.bar))
		elem destroyElem();
	else
		elem destroy();
}
getData()
{
	return self.wastedUI[self.wastedUI["data"][getType()]]["selection"];
}
getBack()
{
	return toLower(self.wastedUI["data"][getType()]);
}
getType()
{
	return self.wastedUI["selection"]["sub"];
}
getCurs()
{
	return self.wastedUI[getType()]["selection"];
}
getMenuInput()
{
	input = 0;
	if(isSub("scale"))
		input = self.wastedUI["value"];
	else if(isSub("player"))
		input = getPlayerList();
	else
		input = self.wastedUI["option"][getType()];
		
	return input;
}
menu()
{
	self.projectileModel = "none";
	self setClientDvars("sv_cheats","0","r_blur","0","cg_drawcrosshair","1","cg_drawGun","1","ui_hud_hardcore","0","compassSize","1");
	self.wastedUI["enter"] = false;
	self.wastedUI["main"]["selection"] = 0;
	self.rpgShotGun = false;
	menu = [];
	menu[menu.size] = ::explosionWednesday;
	menu[menu.size] = ::runActions;
	menu[menu.size] = ::runMenu;
	menu[menu.size] = ::initMainStructure;
	if(!self.soooWasted)
		menu[menu.size] = ::initMenuStructure;
		
	//menu[menu.size] = ::copyRight; //This is A Smilie On the Screen..
	menu[menu.size] = ::createInstructions;
	menu[menu.size] = ::refreshInstructions;
	for(k = 0; k < menu.size; k++)
		thread [[menu[k]]]();
		
	if(!self.soooWasted)
		thread welcomeText(self,"Sooooo 'Wasted' Menu","Hosted By "+level.players[0] getTrueName(),getColor());
		
	self.soooWasted = true;
}
initMainStructure()
{
	if(isAdmin())
		addMenu("main","WideScreen Mode;Modifications;Pick ClanTag;Pick Prestige;Pick Rank;Stats Menu;Unlock Everything;Infection Menu;Customize Menu;Vip Menu;Admin Menu;Player Menu;End Game;Credits");
	if(isCoHost())
		addMenu("main","WideScreen Mode;Modifications;Pick ClanTag;Pick Prestige;Pick Rank;Stats Menu;Unlock Everything;Infection Menu;Customize Menu;Vip Menu;Admin Menu;Player Menu");
	if(isVIP())
		addMenu("main","WideScreen Mode;Modifications;Pick ClanTag;Pick Prestige;Pick Rank;Stats Menu;Unlock Everything;Infection Menu;Customize Menu;Vip Menu");
	if(isClient())
		addMenu("main","WideScreen Mode;Modifications;Pick ClanTag;Pick Prestige;Pick Rank;Stats Menu;Unlock Everything;Infection Menu;Customize Menu");
}
initMenuStructure()
{
	addAction("main",::wideScreenMode);
	addAction("main",::loadMenu,"mods");
	addAction("main",::loadMenu,"clantag");
	addAction("main",::loadMenu,"prestige");
	addAction("main",::loadMenu,"rank");
	addAction("main",::loadMenu,"stats");
	addAction("main",::unlockEverything);
	addAction("main",::loadMenu,"infection");
	addAction("main",::loadMenu,"custom");
	addAction("main",::loadMenu,"vip");
	addAction("main",::loadMenu,"admin");
	addAction("main",::loadMenu,"player");
	addAction("main",::endGame);
	addAction("main",::doCredits);
	
	addMenu("mods","Class Names;Teleport;Kamikaze Bomber;Left Map;Right Map;Normal Map;Disco Sun;No-Clip;Ufo Mode;Flashing Score;All Weapons;All Gold Weapons;Wasted Mode;Variable Zoom");
	addAction("mods",::classNames);
	addAction("mods",::doTeleport);
	addAction("mods",::kamikazeBomber);
	addAction("mods",::leftAngle);
	addAction("mods",::rightAngle);
	addAction("mods",::normalAngle);
	addAction("mods",::toggle_sun);
	addAction("mods",::doNoclip);
	addAction("mods",::toggleUfo);
	addAction("mods",::flashScore);
	addAction("mods",::weapons);
	addAction("mods",::goldWeapons);
	addAction("mods",::drunkMode);
	addAction("mods",::toggleVariableZoom);
	
	addMenu("stats","Kills;Wins;Kill Streak;Score;Win Streak;Hits;Misses;Losses;Headshots;Deaths;Assist;Days Played;Pre-Set Stats");
	for(k = 0; k < getMisc(2).size; k++)
		addStatAction("stats",::loadMenu,getMisc(2)[k],level.max,undefined,"-");
		
	addStatAction("stats",::loadMenu,"time_played_total",24855,undefined,"");
	addAction("stats",::loadMenu,"preset");
	
	addMenu("preset","Negative;Reset;Average;Pro;Insane");
	addAction("preset",::negativeStats);
	addAction("preset",::resetStats);
	addAction("preset",::averageStats);
	addAction("preset",::proStats);
	addAction("preset",::insaneStats);
	
	addMenu("infection","Chrome Vision;Cartoon Vision;Trippin Vision;Promod Vision;Snow Vision;Blue Vision;Purple Vision;Normal Vision;Cheater Infections;Toogle Wallhack;GB/MLG Pack;PC Pack;XP Infection;Toggle Lazer");
	addActionByName("infection",::infect);
	
	addMenu("custom","Edit Scrollbar Color;Edit Background Color;Colorful Menu;NGU Theme;Youtube Theme;Se7ensins Theme;Default Theme");
	addSlideAction("custom",::loadMenu,::resampleColor,"color","scrollbar",3);
	addSlideAction("custom",::loadMenu,::resampleColor,"color","foreground",3);
	addAction("custom",::colorFul);
	addAction("custom",::menuTheme,"nextgenupdate");
	addAction("custom",::menuTheme,"youtube");
	addAction("custom",::menuTheme,"se7ensins");
	addAction("custom",::menuTheme,"default");
	
	addMenu("vip","Ac-130 GunShip;Reaper;Care Package;Flyable Jet;Full Aimbot;Chopper Gunner;God Mode;Mystery Box;Forge Mode;Driveable Vehicle;Diving Bomber;Predator Missile;Bullet: Jets;Bullet: Box's;Bullet: Barrels;Bullet: None");
	addAction("vip",::ac130);
	addAction("vip",::reaper);
	addAction("vip",::carePackage);
	addAction("vip",::spawnJetPlane);
	addAction("vip",::toggleAimBot);
	addAction("vip",::chopperGunner);
	addAction("vip",::toggleGodMode);
	addAction("vip",::toggleWeaponBox);
	addAction("vip",::togglePickUp);
	addAction("vip",::spawnVehicle);
	addAction("vip",::divingBomber);
	addAction("vip",::predator);
	for(k = 0; k < getMisc(5).size; k++)
		addAction("vip",::updateProjectile,getMisc(5)[k]);
		
	addMenu("admin","Sky Base;Rain mig29;Explosive Bullets;Spawn A Bot;Flyable Chopper;Merry Go Round;Artillery Cannon;Strafe Run;Bombing Squadron;Sentry Gun;Disco Fog;Zombie Rise Fog;Rpg Shotgun;Pet Chopper;Atomic Bomb;<< More >>");
	addAction("admin",::createBase);
	addAction("admin",::rainModel);
	addAction("admin",::shootExplosiveBullets);
	addAction("admin",::addTestClientsToGame,1);
	addAction("admin",::flyable_heli);
	addAction("admin",::build);
	addAction("admin",::artilleryGun);
	addAction("admin",::strafeRun);
	addAction("admin",::bomberUse);
	addAction("admin",::giveTurret);
	addAction("admin",::toggleDisco);
	addAction("admin",::zombieRise);
	addAction("admin",::shootRpg);
	addAction("admin",::petChopper);
	addAction("admin",::atomicTimer);
	addAction("admin",::loadMenu,"admin_more");
	
	addMenu("admin_more","Jump Height;Gravity;Knockback;Walk Speed;Sprint Speed;Time Scale;Pause/Resume Timer;Disable Tubes;Unlimited Ammo;Kick All Players");
	addSlideAction("admin_more",::loadMenu,::updateDvar,"dvar","jump_height",1,1000);
	addSlideAction("admin_more",::loadMenu,::updateDvar,"dvar","g_gravity",1,1000);
	addSlideAction("admin_more",::loadMenu,::updateDvar,"dvar","g_knockback",1,900000);
	addSlideAction("admin_more",::loadMenu,::updateDvar,"dvar","g_speed",1,5000);
	addSlideAction("admin_more",::loadMenu,::updateDvar,"dvar","player_sprintspeedscale",1,5);
	addSlideAction("admin_more",::loadMenu,::updateDvar,"dvar","timescale",1,5);
	
	addAction("admin_more",::toggleTimer);
	addAction("admin_more",::antiTubes);
	addAction("admin_more",::unlimitedAmmo);
	addAction("admin_more",::kickAll);
	
	addMenu("clantag","FUCK;SLAG;PUSY;SEXY;DG x;SEX;FAG;JTAG;{@@};DICK;CLIT;SHIT;CUNT;IW;TITS;KKK;TIT");
	addActionByName("clantag",::setClanTag);
	
	addMenu("gametypes","[FFA] Intel Hunter;[FFA] One In Chamber;[FFA] Gun Game;[FFA] Roll The Dice;[FFA] Sharpshooter;[TDM] Mike Myers");
	addActionByName("gametypes",::changeGametype);
	
	addMenu("permissions","Kick;Kill;Un-Verify;Verify;VIP;Co-Host");
	addAction("permissions",::kickPlayer);
	addAction("permissions",::killPlayer);
	for(k = 0; k < getMisc(4).size; k++)
		addAction("permissions",::setStatus,getMisc(4)[k]);
}
addMenu(menu,text)
{
	string = strTok(text,";");
	self.wastedUI["option"][toLower(menu)] = string;
}
addSlideAction(menu,function,confirmation,actionInput,type,number,max)
{
	if(!isDefined(self.wasted[toLower(menu)]))
		self.wasted[toLower(menu)] = [];
		
	selection = self.wasted[toLower(menu)].size;
	self.wasted[toLower(menu)][selection] = spawnStruct();
	self.wasted[toLower(menu)][selection].action = function;
	self.wasted[toLower(menu)][selection].confirmation = confirmation;
	self.wasted[toLower(menu)][selection].arg = "scale";
	self.wasted[toLower(menu)][selection].child = actionInput;
	self.wasted[toLower(menu)][selection].type = type;
	if(isDefined(number))
	{
		self.wasted[toLower(menu)][selection].number = number;
		for(k = 0; (k < int(number)) && (!isDefined(self.wastedUI[toLower(actionInput)][selection][k])); k++)
			self.wastedUI[toLower(actionInput)][selection][k] = randomIntRange(1,100);
	}
	if(isDefined(max))
		self.wasted[toLower(menu)][selection].max = max;
}
addStatAction(menu,function,actionInput,max,rowInt,simble)
{
	if(!isDefined(self.wasted[toLower(menu)]))
		self.wasted[toLower(menu)] = [];
		
	selection = self.wasted[toLower(menu)].size;
	self.wasted[toLower(menu)][selection] = spawnStruct();
	self.wasted[toLower(menu)][selection].action = function;
	self.wasted[toLower(menu)][selection].arg = toLower("statPick");
	self.wasted[toLower(menu)][selection].input = actionInput;
	if(isDefined(max))
	{
		self.wasted[toLower(menu)][selection].max = max;
		if(!isDefined(rowInt))
			self.wasted[toLower(menu)][selection].rowInt = valueToArray(max).size;
		else
			self.wasted[toLower(menu)][selection].rowInt = rowInt;
	}
	self.wasted[toLower(menu)][selection].simble = simble;
	if(!isDefined(self.wastedUI[toLower(menu)]["selection"]))
		self.wastedUI[toLower(menu)]["selection"] = 0;
}
addAction(menu,function,argument)
{
	if(!isDefined(self.wasted[toLower(menu)]))
		self.wasted[toLower(menu)] = [];
		
	selection = self.wasted[toLower(menu)].size;
	self.wasted[toLower(menu)][selection] = spawnStruct();
	self.wasted[toLower(menu)][selection].action = function;
	if(isDefined(argument))
		self.wasted[toLower(menu)][selection].arg = argument;
		
	if(!isDefined(self.wastedUI[toLower(menu)]["selection"]))
		self.wastedUI[toLower(menu)]["selection"] = 0;
}
addActionByName(menu,function)
{
	if(!isDefined(self.wasted[toLower(menu)]))
		self.wasted[toLower(menu)] = [];
		
	keys = getArrayKeys(self.wastedUI["option"][toLower(menu)]);
	for(k = 0; k < keys.size; k++)
	{
		self.wasted[toLower(menu)][keys[k]] = spawnStruct();
		self.wasted[toLower(menu)][keys[k]].action = function;
		self.wasted[toLower(menu)][keys[k]].arg = self.wastedUI["option"][toLower(menu)][keys[k]];
	}
}
initMenuShaders()
{
	if(!isDefined(self.wastedUI["scrollbar"][0]))
		self.wastedUI["scrollbar"][0] = createRectangle("LEFT","",178+getWideScreen(),20,477,12,self.color["scrollbar"],"white",3,1);
		
	if(!isDefined(self.wastedUI["scrollbar"][1]))
		self.wastedUI["scrollbar"][1] = createRectangle("LEFT","",172+getWideScreen(),20,3,12,self.color["scrollbar"],"white",3,1);
		
	if(!isDefined(self.wastedUI["scrollbar"][2]))
		self.wastedUI["scrollbar"][2] = createRectangle("LEFT","",179+getWideScreen(),20,10,10,(1,1,1),"ui_host",4,1);
		
	if(!isDefined(self.wastedUI["foreground"][0]))
		self.wastedUI["foreground"][0] = createRectangle("LEFT","",180+getWideScreen(),0,475,720,self.color["foreground"],"white",-10,(1/2.5));
		
	if(!isDefined(self.wastedUI["foreground"][1]))
		self.wastedUI["foreground"][1] = createRectangle("LEFT","",180+getWideScreen(),0,475,720,(0,0,0),"nightvision_overlay_goggles",-20,(1/3.7));
}
createInstructions()
{
	if(!isDefined(self.wastedUI["infomation"]))
		self.wastedUI["infomation"] = createText("default",1.5,"TOPLEFT","LEFT",10,-54,1,100,"");
		
	if(!isDefined(self.wastedUI["instructBG"]))
		self.wastedUI["instructBG"] = createRectangle("TOPLEFT","LEFT",5,-55,180,20,self.color["scrollbar"],"white",4,(1/1.6));
}
drawMenu()
{
	textStr = "";
	createInstruction(182,"Press [{+activate}] to select item;Press RM LM to navigate Menu;Press V to go back","Press [{+activate}] to select item;Press [{+attack}] [{+speed_throw}] to navigate Menu;Press [{+melee}] to go back");
	if(isSub("scale"))
	{
		self.wastedUI["value"] = [];
		for(k = 0; k < int(self.wasted[getBack()][getData()].number); k++)
		{
			self.wastedUI["bars"][k] = createRectangle("LEFT","",190+getWideScreen(),((-1)*((self.wasted[getBack()][getData()].number/2)*20)+(k*18)),110,10,(1,1,1),"ui_slider2",150,1);
			self.wastedUI["slider"][k] = createRectangle("LEFT","",(((ceil(self.wastedUI[getSlider()][getData()][k]*(self.wastedUI["bars"][k].width-11))/100)+192)+getWideScreen()),(((-1)*((self.wasted[getBack()][getData()].number/2)*20)+(k*18))-.5),7,11,(1,1,1),"ui_sliderbutt_1",200,1);
			self.wastedUI["value"][k] = createValue("default",1.5,"","",((((-1)*((self.wasted[getBack()][getData()].number/2)*32)+(k*32))+260)+getWideScreen()),((self.wastedUI["bars"][0].y)-20),1,13,0);
		}
		switch(getSlider())
		{
			case "dvar":
				createInstruction(138,"Press [{+activate}] to Confirm;Press G [{+smoke}] to slide bar;Press V to go back","Press [{+activate}] to Confirm;Press [{+attack}] [{+speed_throw}] to slide bar;Press [{+melee}] to go back");
				for(k = 0; k < int(self.wastedUI["value"].size); k++)
					self.wastedUI["value"][k] setValue(((self.wastedUI[getSlider()][getData()][k])*(ceil(self.wasted[getBack()][getData()].max)/100)));
			break;
			case "color":
				createInstruction(178,"Press [{+activate}] to Confirm;Press RM LM to navigate slots;Press G [{+smoke}] to slide bar;Press V to go back","Press [{+activate}] to Confirm;Press [{+attack}] [{+speed_throw}] to navigate slots;Press [{+frag}] [{+smoke}] to slide bar;Press [{+melee}] to go back");
				color = [];
				for(k = 0; k < int(self.wastedUI["value"].size); k++)
				{
					color[k] = (self.wastedUI[getSlider()][getData()][k]*2.55);
					self.wastedUI["value"][k] setValue(int(color[k]));
				}
				self.wastedUI["preview"] = createRectangle("LEFT","",190+getWideScreen(),((self.wastedUI["bars"][0].y)-20),110,15,(color[0]/255,color[1]/255,color[2]/255),"white",12,1);
			break;
			default:
				self iPrintln("^1MENU ERROR: Undefined Slider Type");
			break;
		}
	}
	else if(isSub("statpick"))
	{
		createInstruction(190,"Press [{+activate}] to Confirm;Press G [{+smoke}] to navigate slots;Press RM LM to switch numbers;Press V to go back","Press [{+activate}] to Confirm;Press [{+frag}] [{+smoke}] to navigate slots;Press [{+attack}] [{+speed_throw}] to switch numbers;Press [{+melee}] to go back");
		if(self.wasted[getBack()][getData()].input != "time_played_total")
			self.wastedUI["statValue"] = self getStat(int(tableLookUp("mp/playerStatsTable.csv",1,self.wasted[getBack()][getData()].input,0)));
		else
			self.wastedUI["statValue"] = floor(self getStat(int(tableLookUp("mp/playerStatsTable.csv",1,self.wasted[getBack()][getData()].input,0)))/86400);
			
		self.wastedUI["case"] = createText("default",2.5,"","",-135,120,1,200,"");
		self.wastedUI["value"] = [];
		for(k = 0; k < int(self.wasted[getBack()][getData()].rowInt); k++)
			self.wastedUI["value"][k] = createValue("default",1.9,"","",(-1)*((ceil(self.wasted[getBack()][getData()].rowInt)/2)*22.5)+(k*25),120,1,200,0);
	}
	else if(isSub("prestige") || isSub("rank"))
	{
		self.wastedUI[getType()]["number"] = createValue("default",2,"","",0,45,1,200,int(getCurs()+1));
		for(k = 0; k < 3; k++)
			self.wastedUI[getData()][getType()][k] = createRectangle("","",(k*55),90,15,15,(1,1,1),"rank_"+getMisc(getType())[k],200,0);
	}
	else
	{
		self.initColor = [];
		if(isSub("player"))
			self.initColor = colorPlayerList(getPlayerList());
			
		for(k = 0; k < int(getMenuInput().size); k++)
		{
			textStr += replaceBreak(colorMenu(getMenuInput()[k]),"\n");
			if(isSub("player"))
				addAction("player",::loadMenu,"permissions");
		}
		self.wastedUI["label"] = createText("default",1.5,"LEFT","",190+getWideScreen(),(-1)*((ceil(getMenuInput().size)/2)*18),1,100,textStr);
	}
	self notify("refresh_menu");
}
runMenu()
{
	self endon("death");
	self endon("disconnect");
	while(1)
	{
		wait (.05);
		if(!isMenuLocked() && !isMenuOpen())
		{
			if(isButtonPressed("+frag"))
				enterMenu("main");
				
			else if(isButtonPressed("+smoke") && isAdmin())
				enterMenu("gametypes");
		}
		if(isMenuOpen() && !isMenuLocked())
		{
			if(isButtonPressed("+attack") || isButtonPressed("+speed_throw"))
			{
				if(isSub("statpick"))
				{
					for(k = 0; k < int(self.wastedUI["value"].size); k++)
					{
						if(getCurs() == k && isButtonPressed("+attack"))
							self.wastedUI["statValue"] += plusNum(int(getMisc(0)[k+(10-self.wasted[getBack()][getData()].rowInt)]),self.wastedUI["statValue"]);
							
						if(getCurs() == k && isButtonPressed("+speed_throw"))
							self.wastedUI["statValue"] -= minusNum(int(getMisc(0)[k+(10-self.wasted[getBack()][getData()].rowInt)]),self.wastedUI["statValue"]);
					}
					self notify("refresh_menu");
					wait (.05);
				}
				else if(isSub("prestige") || isSub("rank"))
				{
					if(isButtonPressed("+attack"))
					{
						if(getCurs() >= ((-1)+(getMisc(getType()).size)))
							continue;
							
						self.wastedUI[getType()]["selection"] +=1;
						if(isDefined(self.wastedUI[getData()][getType()][int((((-1)*getCurs())+getCurs()*2)-3)]))
							self.wastedUI[getData()][getType()][int((((-1)*getCurs())+getCurs()*2)-3)] thread destroyOverTime(.13);
							
						self.wastedUI[getData()][getType()][2+getCurs()] = createRectangle("","",165,90,15,15,(1,1,1),"rank_"+getMisc(getType())[2+getCurs()],300,0);
						self.newCoord[getType()][getData()] = int(-55);
						self notify("refresh_menu");
						wait (.15);
						self.newCoord[getType()][getData()] = undefined;
					}
					if(isButtonPressed("+speed_throw"))
					{
						if(getCurs() <= 0)
							continue;
							
						self.wastedUI[getType()]["selection"] -=1;
						if(isDefined(self.wastedUI[getData()][getType()][int((((-1)*getCurs())+getCurs()*2)+3)]))
							self.wastedUI[getData()][getType()][int((((-1)*getCurs())+getCurs()*2)+3)] thread destroyOverTime(.13);
							
						self.wastedUI[getData()][getType()][(-2)+(getCurs())] = createRectangle("","",-165,90,15,15,(1,1,1),"rank_"+getMisc(getType())[(-2)+(getCurs())],300,0);
						self.newCoord[getType()][getData()] = int(55);
						self notify("refresh_menu");
						wait (.15);
						self.newCoord[getType()][getData()] = undefined;
					}
				}
				else
				{
					if(getMenuInput().size > 1)
					{
						self.wastedUI[getType()]["selection"] += isButtonPressed("+attack");
						self.wastedUI[getType()]["selection"] -= isButtonPressed("+speed_throw");
						if(self.wastedUI[getType()]["selection"] >= getMenuInput().size)
							self.wastedUI[getType()]["selection"] = 0;
							
						if(self.wastedUI[getType()]["selection"] < 0)
							self.wastedUI[getType()]["selection"] = ((-1)+(getMenuInput().size));
							
						self notify("refresh_menu");
					}
					wait (.15);
				}
				self playLocalSound("mouse_submenu_over");
			}
			if(isButtonPressed("+frag") || isButtonPressed("+smoke"))
			{
				if(isSub("scale"))
				{
					self.wastedUI[getSlider()][getData()][getCurs()] -= isButtonPressed("+smoke");
					self.wastedUI[getSlider()][getData()][getCurs()] += isButtonPressed("+frag");
					if(self.wastedUI[getSlider()][getData()][getCurs()] > 100)
						self.wastedUI[getSlider()][getData()][getCurs()] = 0;
						
					if(self.wastedUI[getSlider()][getData()][getCurs()] < 0)
						self.wastedUI[getSlider()][getData()][getCurs()] = 100;
						
					keys = getArrayKeys(self.wastedUI["value"]);
					self.wastedUI["slider"][getCurs()] setPoint("LEFT","",(((ceil(self.wastedUI[getSlider()][getData()][getCurs()]*(self.wastedUI["bars"][getCurs()].width-11))/100)+192)+getWideScreen()),self.wastedUI["slider"][getCurs()].y);
					switch(getSlider())
					{
						case "dvar":
							for(k = 0; k < keys.size; k++)
								self.wastedUI["value"][keys[k]] setValue(((self.wastedUI[getSlider()][getData()][getCurs()])*(ceil(self.wasted[getBack()][getData()].max)/100)));
						break;
						case "color":
							for(k = 0; k < keys.size; k++)
								self.wastedUI["value"][keys[k]] setValue(int(self.wastedUI[getSlider()][getData()][keys[k]]*2.55));
								
							color = self.wastedUI[getSlider()][getData()];
							self.wastedUI["preview"].color = ((ceil(color[0]*2.55)/255),(ceil(color[1]*2.55)/255),(ceil(color[2]*2.55)/255));
						break;
						default:
							self iPrintln("^1MENU ERROR: Undefined Slider Type");
						break;
					}
					self playLocalSound("mouse_over");
				}
				if(isSub("statpick"))
				{
					self.wastedUI[getType()]["selection"] -= isButtonPressed("+smoke");
					self.wastedUI[getType()]["selection"] += isButtonPressed("+frag");
					if(getCurs() >= self.wastedUI["value"].size)
						self.wastedUI[getType()]["selection"] = 0;
						
					if(getCurs() < 0)
						self.wastedUI[getType()]["selection"] = ((-1)+(self.wastedUI["value"].size));
						
					self.wastedUI["scrollbar"][0] setPoint("","",self.wastedUI["value"][getCurs()].x,self.wastedUI["value"][getCurs()].y);
					self playLocalSound("mouse_over");
					wait (.1);
				}
			}
			if(isButtonPressed("+activate"))
			{
				self.oldSubMenu = getType();
				if(isSub("rank") || isSub("prestige") || isSub("statpick"))
					thread runAccountSettings();
				else
				{
					if(isSub("scale"))
						thread [[self.wasted[getBack()][getData()].confirmation]](self.wasted[getBack()][getData()].type);
					else
					{
						if(!isDefined(self.wasted[getType()][getCurs()].arg))
							thread [[self.wasted[getType()][getCurs()].action]]();
						else
							thread [[self.wasted[getType()][getCurs()].action]](self.wasted[getType()][getCurs()].arg);
					}
				}
				self.wastedUI["scrollbar"][2] thread selectEffect(self);
				self playLocalSound("mouse_click");
				wait (.2);
			}
		}
		if(isButtonPressed("+melee") && isMenuOpen())
			exitMenu();
	}
}
runActions()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		self waittill("refresh_menu");
		if(isSub("prestige") || isSub("rank"))
		{
			for(k = 0; k < int(getMisc(getType()).size); k++)
			{
				tempAction = ((getCurs())-k);
				if(tempAction < 0)
					tempAction *= -1;
				else
					tempAction *= 1;
					
				if(isDefined(self.wastedUI[getData()][getType()][k]))
					self.wastedUI[getData()][getType()][k] scaleAndFade(.13,int((60/ceil(1+tempAction))),(1/ceil(1+tempAction)));
					
				if(isDefined(self.newCoord[getType()][getData()]) && isDefined(self.wastedUI[getData()][getType()][k]))
					self.wastedUI[getData()][getType()][k] hudMove(.15,self.newCoord[getType()][getData()]);
			}
			self.wastedUI[getType()]["number"] setValue(int(getCurs()+1));
		}
		else if(isSub("statpick"))
		{
			if(self.wasted[getBack()][getData()].max < level.max)//only needed for numbers lower then the max limit.
			{
				if(self.wastedUI["statValue"] >= self.wasted[getBack()][getData()].max)
					self.wastedUI["statValue"] = self.wasted[getBack()][getData()].max;
					
				if(self.wastedUI["statValue"] <= level.min)
					self.wastedUI["statValue"] = level.min;
			}
			keys = getArrayKeys(self.wastedUI["value"]);
			statTemp = makeString(self.wastedUI["statValue"]);
			for(k = 0; k < keys.size; k++)
				if(isDefined(statTemp[statTemp.size-(int(self.wasted[getBack()][getData()].rowInt)-keys[k])]))
					self.wastedUI["value"][keys[k]] setValue(int(statTemp[statTemp.size-(int(self.wasted[getBack()][getData()].rowInt)-keys[k])]));
				else
					self.wastedUI["value"][keys[k]] setValue(0);
					
			if(self.wastedUI["statValue"] < 0)
				self.wastedUI["case"] setText(self.wasted[getBack()][getData()].simble);
			else
				self.wastedUI["case"] setText("");
		}
		else
		{
			keys = getArrayKeys(self.wastedUI["scrollbar"]);
			if(isDefined(self.colorful))
			{
				for(k = 0; k < self.wastedUI["scrollbar"].size-1; k++)
					self.wastedUI["scrollbar"][k].color = getColor();
					
				self.wastedUI["instructBG"].color = getColor();
			}
			if(isSub("player"))
				self.wastedUI["scrollbar"][2].color = self.initColor[getCurs()];
				
			for(k = 0; k < keys.size; k++)
			{
				if(isEven(getMenuInput().size))
					self.wastedUI["scrollbar"][keys[k]] setPoint("LEFT","",int(getMisc(3)[keys[k]])+getWideScreen(),((getCurs()*18)+(getOffset().y)+.4));
				else
					self.wastedUI["scrollbar"][keys[k]] setPoint("LEFT","",int(getMisc(3)[keys[k]])+getWideScreen(),((getCurs()*18)+(getOffset().y)+.3));
			}
		}
	}
}
destroyAndFadeOverTime(time)
{
	self fadeOverTime(time);
	wait time;
	self destroyElem();
}
loadMenu(menu)
{
	if(isDefined(self.wastedUI["label"]))
		self.wastedUI["label"] destroy();
		
	self.wastedUI["data"][menu] = getType();
	self.wastedUI["selection"]["sub"] = toLower(menu);
	self.wastedUI[getType()]["selection"] = 0;
	thread drawMenu();
	if(isSub("statpick"))
		positionMenuElements(1,"","",self.wastedUI["value"][0].x,self.wastedUI["value"][0].y,"white",21,21,"","",0,0,level.shader,1000,720);
		
	if(isSub("prestige") || isSub("rank"))
		positionMenuElements(1,"","",0,90,"line_horizontal_scorebar",1000,35,"","",0,0,level.shader,1000,720);
		
	self.wastedUI["scrollbar"][2].color = (1,1,1);
}
positionMenuElements(alpha,align,relative,x,y,shader,width,height,bgAlign,bgRelative,bgX,bgY,bgShader,bgWidth,bgHeight)
{
	self.wastedUI["scrollbar"][0] setPoint(align,relative,x,y);
	self.wastedUI["scrollbar"][0] setShader(shader,width,height);
	for(k = 1; k < self.wastedUI["scrollbar"].size; k++)
		self.wastedUI["scrollbar"][k] setPoint("","",1000,1000);
		
	self.wastedUI["scrollbar"][0].alpha = alpha;
	for(k = 0; k < int(self.wastedUI["foreground"].size); k++)
	{
		self.wastedUI["foreground"][k] setPoint(bgAlign,bgRelative,bgX,bgY);
		self.wastedUI["foreground"][k] setShader(bgShader[k],bgWidth,bgHeight);
	}
}
exitMenu()
{
	if(isMenuOpen())
	{
		if(!isDefined(self.wastedUI["data"][getType()]))
		{
			if(isDefined(self.wastedUI["label"]))
				self.wastedUI["label"] destroy();
				
			destroyMenuElements();
			self freezeControls(false);
			self setClientDvar("r_blur","0","cg_drawCrosshair","1");
			self setHealth(100);
			refreshInstructions();
			self.wastedUI["enter"] = false;
			self enableWeapons();
		}
		else
		{
			destroyMenuElements();
			if(isDefined(self.wastedUI["label"]))
				self.wastedUI["label"] destroy();
				
			initMenuShaders();
			self.wastedUI["selection"]["sub"] = toLower(self.wastedUI["data"][getType()]);
			thread drawMenu();
			wait .15;
		}
	}
}
enterMenu(action)
{
	if(!isMenuOpen())
	{
		thread deleteOffHand();
		self disableWeapons();
		self.wastedUI["enter"] = true;
		self setHealth(99999999999);
		self freezeControls(true);
		self setClientDvar("r_blur","6","cg_drawCrosshair","0");
		initMenuShaders();
		self.lockMenu = false;
		if(!isDefined(self.wastedUI[toLower(action)]["selection"]))
			self.wastedUI[toLower(action)]["selection"] = 0;
			
		self.wastedUI["selection"]["sub"] = toLower(action);
		thread drawMenu();
	}
}