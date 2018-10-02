#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

#include cp\_common_scripts;
#include cp\_main;
#include cp\menu\_menu;
#include cp\menu\_menu_hud;
#include cp\_verifycation;
#include cp\menu\_menu_struct;
#include cp\menu\_menu_utilities;

TEST_CAL()
{
	S("::TEST_CAL");
}


func_godmode()
{
	if(!isDefined(self.var["godmode"]))
		self.var["godmode"] = false;
	if(!self.var["godmode"])
	{
		self.var["godmode"] = true;
		self thread func_call_godmode();
		S("Toggle Godmode ^2ON");
	}
	else
	{
		
		self.var["godmode"] = false;
		self.maxhealth = 100;
		self.health = self.maxhealth;
		S("Toggle Godmode ^1OFF");
	}
}

func_call_godmode()
{
	self endon("disconnect");
	self endon("death");
	self.var["godmode"] = true;
	while(self.var["godmode"])
	{
		self.maxhealth = 999999;
		self.health = self.maxhealth;
		wait .05;
	}
}

func_UnlimitedAmmo()
{
	if(!isDefined(self.var["UnlimitedAmmo"]))
		self.var["UnlimitedAmmo"] = false;
	if(!self.var["UnlimitedAmmo"])
	{
		self.var["UnlimitedAmmo"] = true;
		self thread func_call_UnlimitedAmmo();
		S("Toggle Unlimited Ammo ^2ON");
	}
	else
	{
		
		self.var["UnlimitedAmmo"] = false;
		self SetWeaponAmmoClip(self GetCurrentWeapon(),0);
		self SetWeaponAmmoStock(self GetCurrentWeapon(),0);
		self SetWeaponAmmoClip(self GetCurrentOffhand(),0);
		self SetWeaponAmmoStock(self GetCurrentOffhand(),0);
		self GiveMaxAmmo(self getCurrentWeapon());
		self GiveMaxAmmo(self GetCurrentOffhand());
		S("Toggle Unlimited Ammo ^1OFF");
	}
}



func_call_UnlimitedAmmo()
{
	self endon("disconnect");
	self endon("death");
	self.var["UnlimitedAmmo"] = true;
	while(self.var["UnlimitedAmmo"])
	{
		self SetWeaponAmmoClip(self GetCurrentWeapon(),1337);
		self SetWeaponAmmoClip(self GetCurrentOffhand(),1337);
		self SetWeaponAmmoStock(self GetCurrentWeapon(),1337);
		self SetWeaponAmmoStock(self GetCurrentOffhand(),1337);
		wait .02;
	}
}

func_toggleDvarbool(dvar) // CabCon: reagiert automatisch auf einen toggle bool dvar und stellt ihn um. 
{
	self setClientDvar(dvar,!getDvarInt(dvar));
	wait 0.1;
	S(dvar+ " "+getBoolintoString(getDvarInt(dvar)));
}
func_toggleDvarbool_input(dvar,i2,i3)
{
	if(getDvarInt(dvar) != i3)
	{
		self setClientDvar(dvar,i3);
		self.var[dvar] = true;
		S(getOptionName()+" ^2ON");
	}
	else
	{
		self setClientDvar(dvar,i2);
		self.var[dvar] = false;
		S(getOptionName()+" ^1OFF");
	}
	wait .1; //Waiting for DVAR
	self _loadMenu(self.PIX["CurrentMenu"]); //Reloead menu
}
func_resetLobby()
{
	if(self.var["jump_height"] == true)
		self.var["jump_height"] = false;
	self setClientDvar("jump_height",39);
	if(self.var["g_speed"] == true)
		self.var["g_speed"] = false;
	self setClientDvar("g_speed",190);
	self setClientDvar("player_sprintSpeedScale",1.5);
	if(self.var["g_gravity"] == true)
		self.var["g_gravity"] = false;
	self setClientDvar("g_gravity",800);
	wait .1; //Waiting for DVAR
	S("Lobby Modifications ^1Reseted");
	self _loadMenu(self.PIX["CurrentMenu"]); //Reloead menu
}
	
func_freezBots()
{
	if(self.var["bots_freez"])
	{
		self.var["bots_freez"] = false;
		self thread func_freezBots_call();
	}
	else
	{
		self notify("func_freezBots_stop");
		for(i=0; i<getAllPlayers().size; i++)
		{
			if(getAllPlayers()[i].pers["isBot"] == true)
				getAllPlayers()[i] freezeControls(false);
		}
		self.var["bots_freez"] = true;
	}
}
func_freezBots_call()
{
	self endon("func_freezBots_stop");
	while(self.var["bots_freez"])
	{
		for(i=0; i<getAllPlayers().size; i++)
		{
			if(getAllPlayers()[i].pers["isBot"] == true)
				getAllPlayers()[i] freezeControls(true);
		}
		wait .1;
	}
}
func_spawn_amount_of_bots(amount)
{
	for(i = 0; i < amount; i++)
	{
		ent[i] = addtestclient();
		if (!isdefined(ent[i])) 
		{
			E("Can't add Test Client.");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread func_testclient("autoassign");
	}
}


func_testclient(team)
{
	self endon( "disconnect" );
	while(!isdefined(self.pers["team"]))
	wait .05;
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
	classes = getArrayKeys( level.classMap );
	okclasses = [];
	for ( i = 0; i < classes.size; i++ )
	{
		if ( !issubstr( classes[i], "custom" ) && isDefined( level.default_perk[ level.classMap[ classes[i] ] ] ) )
			okclasses[ okclasses.size ] = classes[i];
	}
	assert( okclasses.size );
	while( 1 )
	{
		class = okclasses[ randomint( okclasses.size ) ];
		if ( !level.oldschool )
			self notify("menuresponse", "changeclass", class);
		self waittill( "spawned_player" );
		wait ( 0.10 );
	}
}
func_sound(i)
{
	if(!isDefined(self.var["sound_type"]))
	{
		S(getOptionName()+" ^2Start Playing");
		self func_sound_on_player(i);
	}
	else if(self.var["sound_type"] == "ey")	
	{
		S(getOptionName()+" ^2Start Playing for everyone!");
		self func_playSoundOnAllPlayers(i);
	}
}
func_sound_setting()
{
	if(!isDefined(self.var["sound_type"]))
	{
		self.var["sound_type"] = "ey";
		S("Sound Listener ^2Everyone");
	}
	else
	{
		self.var["sound_type"] = undefined;
		S("Sound Listener ^2"+self.name);
	}
}

func_setVision(i)
{
	if(getDvarInt("r_fullbright"))
	{
		E("Fullbright is ^2ON^1. You can't set NakedVisions without disabling Fullbright.");
		return;
	}
	VisionSetNaked( i, self.var["vision_fadetime"] );
	S("Vision setted to ^2"+i);
}
func_resetVision()
{
	if(getDvarInt("r_fullbright"))
	{
		self func_toggleDvarbool("r_fullbright");
	}
	VisionSetNaked( getMapName(), 0 );
	S("Vision ^2reseted");
}

funV_vision_fadetime(i)
{
	self.var["vision_fadetime"] = i;
}

func_giveWeapon(i)
{
	/*if(self hasWeapon(i))
	{
		E("You have this Weapon already!");
		return;
	}*/
	if(self GetWeaponsListPrimaries().size != 1)
		self TakeWeapon(self getcurrentWeapon());
	self GiveWeapon(i);
	self switchToWeapon(i);
	S("I_"+i);
}
func_giveGrenade(i)
{
	/*if(self hasWeapon(i))
	{
		E("You have this Weapon already!");
		return;
	}*/
	//self TakeWeapon(self GetCurrentOffhand());
	self GiveWeapon(i);
	S("I_"+i);
}
func_giveEquip(i)
{
	self giveWeapon(i);
    self SetActionSlot(4, "weapon", i);
	S("I_"+i);
}
func_getWeaponName() 
{
	S(""+self getcurrentWeapon());
}

func_giveCamo(i)// i = 0 - 6 
{
	temp = self getcurrentWeapon(); 
	self TakeWeapon(temp);
	self GiveWeapon(temp,i);
	self switchToWeapon(i);
	S("Camo set to ^2"+getOptionName());
}

func_addAttachment(i)//TODO CabCon: Don't work really good.
{
	var = self getcurrentWeapon();
	var = getsubstr( var, 0, var.size-2 );
	var += i+"_mp";
	L("Weapon: "+var);
	self func_giveWeapon(var);
}

func_tel_sky()
{
	self setOrigin(self getOrg()+(0,0,100000));
	S("Teleported to Sky ^2Successful");
}
func_tel_ground()
{
	self setOrigin(findGround(self getOrg()));
	S("Teleported to Ground ^2Successful");
}
findGround(origin)
{
    return bullettrace(origin,(origin+(0,0,-1000000)),false,self)["position"];
}
func_tel_trace()
{
	self setOrigin(self findTracePosition());
	S("Teleported to Trace Position ^2Successful");
}
findTracePosition()
{
	return BulletTrace( self geteye(), ( anglesToForward( self getPlayerAngles() )[0] * 100000000, anglesToForward( self getPlayerAngles() )[1] * 100000000, anglesToForward( self getPlayerAngles() )[2] * 100000000 ), 0, self )[ "position" ];
}
fund_tel_withMap()
{
	self beginLocationSelection( "map_artillery_selector" );
	self.selectingLocation = true;
	self waittill( "confirm_location", location );
	self SetOrigin( PhysicsTrace( location + ( 0, 0, 1000 ), location - ( 0, 0, 1000 ) ) );
	self SetOrigin( bullettrace(self getOrg(),(self getOrg()+(0,0,-1000000)),false,self)["position"]);
	self endLocationSelection();
	self.selectingLocation = undefined;
	self iPrintln( "Teleported To" +PhysicsTrace( location + ( 0, 0, 1000 ), location - ( 0, 0, 1000 ) ));
}
func_disableDamageFeedback()
{
	self.hud_damagefeedback.x = -99999;
	self.hud_damagefeedback.y = -99999;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////
// HITMARKER / DAMAGEFEEDBACK Options Created by CabCon
/////////////////////////////////////////////////////////////////////////////////////////////////////
func_hitmarker()
{
	if(self.var["hitmarker_pos_flash"] == true)
		self func_hitmarker_flashing_pos();
	if(self.var["hitmarker"] == false || !isDefined(self.var["hitmarker"]) )
	{
		self.hud_damagefeedback.x = -12;
		self.hud_damagefeedback.y = -12;
		self.var["hitmarker"] = true;
		S("Hitmarker ^2ON");
	}
	else
	{
		self.hud_damagefeedback.x = -99999;
		self.hud_damagefeedback.y = -99999;
		self.var["hitmarker"] = false;
		S("Hitmarker ^1OFF");
	}
}
func_hitmarker_flashing_pos()
{
	if(self.var["hitmarker"] == false || !isDefined(self.var["hitmarker"]))
		self func_hitmarker();
	if(self.var["hitmarker_pos_flash"] == false || !isDefined(self.var["hitmarker_pos_flash"]) )
	{
		self.var["hitmarker_pos_flash"] = true;
		self thread func_hitmarker_flashing_pos_func();
		S("Crazy Hitmarker ^2ON");
	}
	else
	{
		self.var["hitmarker_pos_flash"] = false;
		self notify("hitmarker_pos_flash_stop");
		S("Crazy Hitmarker ^1OFF");
	}
}
func_hitmarker_flashing_pos_func()
{
	self endon("hitmarker_pos_flash_stop");
	while(self.var["hitmarker_pos_flash"])
	{
		if(self.var["hitmarker_pos_flash_animated"])
			self.hud_damagefeedback moveovertime(self.var["hitmarker_pos_flash_speed"]);
		self.hud_damagefeedback.x = -12 + randomIntRange(0-self.var["hitmarker_pos_flash_distance"],self.var["hitmarker_pos_flash_distance"]);
		self.hud_damagefeedback.y = -12 + randomIntRange(0-self.var["hitmarker_pos_flash_distance"],self.var["hitmarker_pos_flash_distance"]);
		wait self.var["hitmarker_pos_flash_speed"];
	}
}

func_hitmarker_pos_flash_animated()
{
	if(self.var["hitmarker_pos_flash"] == false || !isDefined(self.var["hitmarker_pos_flash"]) )
		S("You need to ^2enable^7 Crazy Hitmarker to see which effect this action have.");
	self.var["hitmarker_pos_flash_animated"] = !self.var["hitmarker_pos_flash_animated"];
}
func_hitmarker_distance(i)
{
	if(self.var["hitmarker_pos_flash"] == false || !isDefined(self.var["hitmarker_pos_flash"]) )
		S("You need to ^2enable^7 Crazy Hitmarker to see which effect this action have.");
	self.var["hitmarker_pos_flash_distance"] = i;
}
func_hitmarker_speed(i)
{
	if(self.var["hitmarker_pos_flash"] == false || !isDefined(self.var["hitmarker_pos_flash"]) )
		S("You need to ^2enable^7 Crazy Hitmarker to see which effect this action have.");
	self.var["hitmarker_pos_flash_speed"] = i;
}
func_hitmarker_color(i)
{
	if(self.var["hitmarker"] == false || !isDefined(self.var["hitmarker"]))
		S("You need to ^2enable^7 Hitmarker to see which effect this action have.");
	self notify("func_hitmarker_colorLoop_stop");
	self.hud_damagefeedback.color = i;
	S("Hitmarker Color Changed to ^2"+getOptionName());
}

func_hitmarker_colorLoop()
{
	if(self.var["hitmarker"] == false || !isDefined(self.var["hitmarker"]))
		S("You need to ^2enable^7 Hitmarker to see which effect this action have.");
	self endon("func_hitmarker_colorLoop_stop");
	S("Hitmarker Color Changed to ^2Random Color Loop");
	for(;;)
	{
		self.hud_damagefeedback.color = (randomintrange( 0, 255 )/255,randomintrange( 0, 255 )/255,randomintrange( 0, 255 )/255);
		if(self.var["hitmarker_pos_flash"])
			wait self.var["hitmarker_pos_flash_speed"];
		else
			wait .01;
	}
}
func_hitmarker_reset(i)
{
	self.var["hitmarker_pos_flash_distance"] = 20;
	self.var["hitmarker_pos_flash_speed"] = .01;
	self.var["hitmarker_pos_flash_animated"] = false;
	if(i == false)
	{
		self _loadMenu("main_hitmaker_crazy_settings");
		S("Crazy Hitmarker Settings ^1Reseted");
		return;
	}
	else
	{
		self.var["hitmarker_pos_flash"] = false;
		self.var["hitmarker"] = true;	
		self notify("func_hitmarker_colorLoop_stop");
		self.hud_damagefeedback.color = (1,1,1);
		self _loadMenu("main_hitmaker");
		S("Hitmarker Settings ^1Reseted");
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////

func_resetAxisWeapon()
{
	if(getDvarInt("cg_gun_x") == 0 && getDvarInt("cg_gun_y") == 0 && getDvarInt("cg_gun_z") == 0)
	{
		S("^1Weapon Position isn't modified");return;
	}
	self setClientDvar("cg_gun_x",0);
	self setClientDvar("cg_gun_y",0);
	self setClientDvar("cg_gun_z",0);
	wait 0.1;
	self _loadMenu("main_weaponmods_pos");
	S("Weapon Position ^1Reseted");
}

/////////////////////////////////////////////////////////////////////////////////////////////////////


func_suicide()
{
	self suicide();
	self.var["godmode"] = false;
	S("Sucide ^2DONE");
}

//////////////////////////////////////

func_setAngle(i)
{
	self setPlayerAngles(i)
	S("Angle set to ^2"+self GetPlayerAngles());
}

/////////////////////////////////%%%%%%%%%%

func_ufoMode()
{
	if(self.var["player_mode_ufo"] == false)
	{
		S("Ufo Mode ^2ON^7\nHold ^2[{+smoke}] ^7To Fly");
		self thread func_ufoMode_call();
		self.var["player_mode_ufo"]=true;
	}
	else
	{
		S("Ufo Mode ^1OFF");
		self notify("func_ufoMode_stop");
		if(isdefined(self.N)) 
			self.N delete();
		self.var["player_mode_ufo"]=false;
	}
}
func_ufoMode_call()
{
	self endon("func_ufoMode_stop");
	if(isdefined(self.N)) 
		self.N delete();
	self.N=spawn("script_origin", self.origin);
	self.On=0;
	for(;;)
	{
		if(self SecondaryOffHandButtonPressed())
		{
			self.On=1;
			self.N.origin=self.origin;
			self linkto(self.N);
		}
		else
		{
			self.On=0;
			self unlink();
		}
		if(self.On == 1)
		{
			self.N.origin=self.N.origin+(anglestoforward(self getPlayerAngles())[0] * 20, anglestoforward(self getPlayerAngles())[1] * 20, anglestoforward(self getPlayerAngles())[2] * 20);
		}
		wait 0.05;
	}
}
func_doKillstreak(i,i_2)
{
	self maps\mp\gametypes\_hardpoints::giveHardpoint(i, i_2 );
	S("Killstreak ^2"+getOptionName()+" Given");
}
func_doAirstrikeAtyourPos()
{
	self maps\mp\gametypes\_hardpoints::doArtillery( getOrg(), self, self.pers["team"] );
	S("Airstrike ^2Sended^7 to your Position(^2"+getOrg()+"^7)");
}
	
func_setValueInput(i)
{
	tmp_function = getOptionName();
	switch(tmp_function)
	{
	case "Radar Time":
		level.radarViewTime = i;
	break;
	case "Airstrike MaxRadius" :
		level.artilleryDangerMaxRadius = i;
	break;
	case "Airstrike MinRadius" :
		level.artilleryDangerMinRadius = i;
	break;
	case "Airstrike ForwardPush" :
		level.artilleryDangerForwardPush = i;
	break;
	case "Airstrike OvalScale" :
		level.artilleryDangerOvalScale = i;
	break;
	case "Map Circle Flys" :
		level.heli_loopmax = i;
	break;
	case "Maxhealth" :
		level.heli_maxhealth = i;
	break;
	case "Spawnprotection Time" :
		level.heli_target_spawnprotection = i;
	break;
	case "Visual Range" :
		level.heli_visual_range = i;
	break;
	case "Turret Range" :
		level.heli_turret_engage_dist = i;
	break;
	case "Missile Range" :
		level.heli_missile_engage_dist = i;
	break;
	case "Bulletdamage" :
		level.scr_heli_armor_bulletdamage = i;
	break;
	default:
		E("Required arguments don't match to one of our allowed inputs. Be sure to report this.");
	break;
	}
}
	
func_teleporttonearestplayer()
{
	if(getAllPlayers().size == 1)
	{ 
		self E("There are no Enemys to Teleport to."); 
		return;
	}
	tmp_player = getRandomPlayer();
	while(tmp_player == self)
	{
		tmp_player = getRandomPlayer();
	}
    if(isDefined(tmp_player))
    {
        self setOrigin(tmp_player.origin);
        self S("Teleported to ^2"+tmp_player.name);
    }
}


////////
// Account
/////////

func_rankup()
{
	self maps\mp\gametypes\_persistence::statSet("rank", 55 );
	self maps\mp\gametypes\_persistence::statSet("rankxp", 251600 );
	self thread maps\mp\gametypes\_rank::updateRankAnnounceHUD();
	S("Rank Up to Level 55 ^2Successful");
}

func_stats(i) //Credits to sep5594 or the person who created that!
{
	switch(i)
	{
		case "Insane": 
			self thread SetStats(2147400000,2147400000,2147400000,2147400000,2147400000,2147400000,0,2147400000,2147400000,0,0,500000000000);
			S("Set Stats to ^2"+i);break;
		case "High": 
			self thread SetStats(21474000,21474000,21474000,21474000,21474000,21474000,10023,21474000,21474000,2343,10493,5000000000);
			S("Set Stats to ^2"+i);break;
		case "Legit": 
			self thread SetStats(83582,2648,504302,13,11,4659,43860,35742,2,1769,45322,5000);
			S("Set Stats to ^2"+i);break;
		case "Low": 
			self thread SetStats(2541,475,42650,7,2,462,0,285,1,328,34565,400);
			S("Set Stats to ^2"+i);break;
		case "Negative": 
			self thread SetStats(-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-500000000000);
			S("Set Stats to ^2"+i);break;
		case "Reset": 
			self thread SetStats(0,0,0,0,0,0,0,0,0,0,0,0);
			S("Set Stats to ^2"+i);break;
	}
}
SetStats(Kills,Wins,Score,KillStreak,Winstreak,Headshots,Deaths,Assists,Accuracy,Losses,Misses,TimePlayed)
{
	self maps\mp\gametypes\_persistence::statSet("kills",Kills);
	self maps\mp\gametypes\_persistence::statSet("wins",Wins);
	self maps\mp\gametypes\_persistence::statSet("score",Score);
	self maps\mp\gametypes\_persistence::statSet("kill_streak",KillStreak);
	self maps\mp\gametypes\_persistence::statSet("win_streak",Winstreak);
	self maps\mp\gametypes\_persistence::statSet("headshots",Headshots);
	self maps\mp\gametypes\_persistence::statSet("deaths",Deaths);
	self maps\mp\gametypes\_persistence::statSet("assist",Assists);
	self maps\mp\gametypes\_persistence::statSet("accuracy",Accuracy);
	self maps\mp\gametypes\_persistence::statSet("losses",Losses);
	self maps\mp\gametypes\_persistence::statSet("misses",Misses);
	self maps\mp\gametypes\_persistence::statAdd("time_played_total",TimePlayed);
}
autoAim1()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	if(self.aim == false )
	{
		self.aim = true;
		self iPrintln("Unfair AimBot ^2[ON]");
		self thread ToggleAutoAim1();
	}
	else
	{
		self.aim = false;
		self iPrintln("Unfair AimBot ^1[OFF]");
		self notify( "stop_aimbot");
	}
}
ToggleAutoAim1()
{
	self endon( "disconnect" );
	self endon( "stop_aimbot");
	for(;;)
	{
		self waittill( "weapon_fired" );
		wait 0.01;
		aimAt = undefined;
		for ( i = 0;i < level.players.size;i++ )
		{
			if( (level.players[i] == self) || (level.teamBased && self.pers["team"] == level.players[i].pers["team"]) || ( !isAlive(level.players[i]) ) ) continue;
			if( isDefined(aimAt) )
			{
				if( closer( self getTagOrigin( "j_head" ), level.players[i] getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) aimAt = level.players[i];
			}
			else aimAt = level.players[i];
		}
		if( isDefined( aimAt ) )
		{
			aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0 );

		
			}
	}
}
//REMOVE>









//Values
menu_ValueDvar(value)
{
	if(!isDefined(self.PIX[self.PIX["CurrentMenu"]].inp4[self.Scroller[self.PIX["CurrentMenu"]]]))
	{
		E("Error Needed Parameters not founded! Be sure to report that.\nLog:\nnotDefined(self.PIX[self.PIX[CurrentMenu]].inp4[self.Scroller[self.PIX[CurrentMenu]]])");
		return;
	}
	self setClientDvar(self.PIX[self.PIX["CurrentMenu"]].inp4[self.Scroller[self.PIX["CurrentMenu"]]],value);
	if(self.PIX[self.PIX["CurrentMenu"]].inp4[self.Scroller[self.PIX["CurrentMenu"]]]=="cg_fov")
	{
		self.var["fov_save"] = value;
	}
}


///////
//DEV//
///////

dev_call()
{
	S(getOptionName());
}
dev_call_2()
{
	S(getScroll());
}
dev_call_3()
{
	S(getCurrent());
}




UnlockAll()
{
	if(self.var["locking"]==0)
	{
		self.var["unlocking"]=1;
		self thread ChallengeBar();
		wait 30.2;
		self iPrintlnBold("\n\n^2All Challenges Unlocked!\n\n");
		self.var["unlocking"]=0;
		chal="";
		camo="";
		attach="";
		camogold=strtok("dragunov|ak47|uzi|m60e4|m1014","|");
		for(i=1;i<=level.numChallengeTiers;i++)
		{
			tableName="mp/challengetable_tier"+i+".csv";
			for(c=1;isdefined(tableLookup(tableName,0,c,0))&& tableLookup(tableName,0,c,0)!="";
			c++)
			{
				if(tableLookup(tableName,0,c,7)!="")chal+=tableLookup(tableName,0,c,7)+"|";
				if(tableLookup(tableName,0,c,12)!="")camo+=tableLookup(tableName,0,c,12)+"|";
				if(tableLookup(tableName,0,c,13)!="")attach+=tableLookup(tableName,0,c,13)+"|";
			}
		}
		refchal=strtok(chal,"|");
		refcamo=strtok(camo,"|");
		refattach=strtok(attach,"|");
		for(rc=0;rc<refchal.size;rc++)
		{
			self setStat(level.challengeInfo[refchal[rc]]["stateid"],255);
			self setStat(level.challengeInfo[refchal[rc]]["statid"],level.challengeInfo[refchal[rc]]["maxval"]);
			wait(0.05);
		}
		for(at=0;at<refattach.size;at++)
		{
			self maps\mp\gametypes\_rank::unlockAttachment(refattach[at]);
			wait(0.05);
		}
		for(ca=0;ca<refcamo.size;ca++)
		{
			self maps\mp\gametypes\_rank::unlockCamo(refcamo[ca]);
			wait(0.05);
		}
		for(g=0;g<camogold.size;g++)self maps\mp\gametypes\_rank::unlockCamo(camogold[g]+" camo_gold");
		self setClientDvar("player_unlock_page","3");
	}
	else
	{
		self iPrintln("\n\n^1ERROR: You Cannot Unlock All While Locking All!");
	}
}
LockChallenges()
{
	if(self.var["unlocking"]==0)
	{
		self.var["locking"]=1;
		self thread ChallengeBar();
		wait 30;
		self iPrintlnBold("\n\n^1All Challenges Locked!\n\n");
		self.var["locking"]=0;
		self.challengeData=[];
		for(i=1;i<=level.numChallengeTiers;i++)
		{
			tableName="mp/challengetable_tier"+i+".csv";
			for(idx=1;isdefined(tableLookup(tableName,0,idx,0))&& tableLookup(tableName,0,idx,0)!= "";
			idx++)
			{
				refString=tableLookup(tableName,0,idx,7);
				level.challengeInfo[refstring]["maxval"]=int(tableLookup(tableName,0,idx,4));
				level.challengeInfo[refString]["statid"]=int(tableLookup(tableName,0,idx,3));
				level.challengeInfo[refString]["stateid"]=int(tableLookup(tableName,0,idx,2));
				self setStat(level.challengeInfo[refString]["stateid"] ,0);
				self setStat(level.challengeInfo[refString]["statid"] ,0);
				wait 0.01;
			}
		}
	}
	else
	{
		self iPrintln("\n\n^1ERROR: You Cannot Lock All While Unlocking All!");
	}
}
ChallengeBar()
{
	for(i=0;i<101;i++)
	{
		self iprintlnBold("^1Percent Complete: "+i);
		wait .3;
	}
}
toggleInvisible()
{
	if(!self.var["invisible"])
	{
		self hide();
		self iprintln("Invisible: ^2ON");
		self.var["invisible"] = true;
	}
	else
	{
		self show();
		self iprintln("Invisible: ^1OFF");
		self.var["invisible"] = false;
	}
}
CloneMe()
{
	self ClonePlayer(99999);
	self iprintln("^1Cloned");
}
CloneDeadMe()
{
   xD = self ClonePlayer (99999999);
   xD startRagDoll();
}
StageViewport()
{
	self.ViewPortVal ++;
	if(self.ViewPortVal>4)
	{
		self.ViewPortVal = 1;
	}
	if(self.ViewPortVal==1)
	{
		self.ViewPortShow = "Default";
		self ViewPortScaleChange("Fullscreen");
	}
	if(self.ViewPortVal==2)
	{
		self.ViewPortShow = "0.5";
		self ViewPortScaleChange("0.5");
	}
	if(self.ViewPortVal==3)
	{
		self.ViewPortShow = "0.3";
		self ViewPortScaleChange("0.3");
	}
	if(self.ViewPortVal==4)
	{
		self.ViewPortShow = "0.1";
		self ViewPortScaleChange("NotFullscreen");
	}
	self _selectUpdate();
}
ViewPortScaleChange(lol)
{
   switch(lol)
   {
      case "Fullscreen":
	      self setclientDvar("r_scaleviewport",0.2);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.3);wait 0.05;
	      self setclientDvar("r_scaleviewport",0.4);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.5);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.6);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.7);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.8);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.9);wait 0.05;
		  self setclientDvar("r_scaleviewport",1);wait 0.05;
	  break;
	  
	  case "NotFullscreen":
		  self setclientDvar("r_scaleviewport",0.2);wait 0.05;
		  self setclientDvar("r_scaleviewport",0.1);wait 0.05;
	  break;
	  
	  case "0.5":
		  self setclientDvar("r_scaleviewport",0.9);wait 0.05;
          self setclientDvar("r_scaleviewport",0.8);wait 0.05;
          self setclientDvar("r_scaleviewport",0.7);wait 0.05;
	      self setclientDvar("r_scaleviewport",0.6);wait 0.05;
	      self setclientDvar("r_scaleviewport",0.5);wait 0.05;
	  break;
	  
	  case "0.3":
	      self setclientDvar("r_scaleviewport",0.4);wait 0.05;
	      self setclientDvar("r_scaleviewport",0.3);wait 0.05;
	  break;
   }
}
ToggleDeathM()
{
	if(!self.var["deathmachine"])
	{
		self.var["deathmachine"]=true;
		self iPrintln("Deathmachine [^2ON^7]");
		self thread doDeath();
	}
	else
	{
		self.var["deathmachine"]=false;
		self notify("end_dm");
		self iPrintln("Deathmachine [^1OFF^7]");
	}
}
doDeath()
{
	self endon("disconnect");
	self endon("end_dm");
	self thread WatchDeath();
	self thread EndDeath();
	self allowADS(false);
	self allowSprint(false);
	self setPerk("specialty_bulletaccuracy");
	self setPerk("specialty_rof");
	self setClientDvar("perk_weapSpreadMultiplier",0.20);
	self setClientDvar("perk_weapRateMultiplier",0.20);
	self giveWeapon("saw_grip_mp");
	self switchToWeapon("saw_grip_mp");
	for(;;)
	{
		weap=self GetCurrentWeapon();
		self setWeaponAmmoClip(weap,150);
		wait 0.2;
	}
}
EndDeath()
{
	self endon("disconnect");
	self waittill("end_dm");
	self takeWeapon("saw_grip_mp");
	self setClientDvar("perk_weapRateMultiplier",0.7);
	self setClientDvar("perk_weapSpreadMultiplier",0.6);
	self allowADS(true);
	self allowSprint(true);
}
WatchDeath()
{
	self endon("disconnect");
	self endon("end_dm");
	for(;;)
	{
		if(self GetCurrentWeapon()!= "saw_grip_mp")
		{
			self switchToWeapon("saw_grip_mp");
		}
		wait 0.01;
	}
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
toggle_discosun()
{
	if(!self.var["discosun"])
	{
		self.var["discosun"] = true;
		self thread discoSun();
		self iPrintln("Disco Sun [^2ON^7]");
	}
	else
	{
		self notify("disco_sun_end");
		self.var["discosun"] = false;
		self setClientDvars("r_lightTweakSunLight","1.5","r_lightTweakSunColor","1 .8 .6 1");
		self iPrintln("Disco Sun [^1OFF^7]");
	}
}
discoSun()
{
	self endon("disconnect");
	self endon("disco_sun_end");
	self setClientDvar("r_lightTweakSunLight","4");
	while(self.var["discosun"])
	{
		random = [];
		for(k = 0; k < 4; k++)
			random[k] = (randomInt(255)/255);
			
		self.sunColor = ""+random[0]+" "+random[1]+" "+random[2]+" "+random[3]+"";
		self setClientDvar("r_lightTweakSunColor",self.sunColor);
		wait .1;
	}
}




AC130()
{
	self endon("death");
	self _closeMenu();
	wait .2;
	setPlayerHealth(90000);
	self iPrintln("Press [{+attack}] To Fire Current Cannon!\nPress [{+frag}] To Switch Cannon!\nPress [{+melee}] To Exit AC130!");
	if(getdvar("mapname")== "mp_bloc")self.Ac130Loc =(1100,-5836,1800);
	else if(getdvar("mapname")== "mp_crossfire")self.Ac130Loc =(4566,-3162,1800);
	else if(getdvar("mapname")== "mp_citystreets")self.Ac130Loc =(4384,-469,1500);
	else if(getdvar("mapname")== "mp_creek")self.Ac130Loc =(-1595,6528,2000);
	else
	{
		level.mapCenter=maps\mp\gametypes\_spawnlogic::findBoxCenter(level.spawnMins,level.spawnMaxs);
		self.Ac130Loc=getAboveBuildings(level.mapCenter);
	}
	self.Ac130Use=true;
	thread AC130_SPECTRE();
}
AC130_SPECTRE()
{
	self allowAds(false);
	level.ac["105mm"]=loadfx("explosions/aerial_explosion_large");
	level.ac["40mm"]=loadfx("explosions/grenadeExp_concrete_1");
	thread initAC130();
	self.OldOrigin=self getOrigin();
	thread playerLinkAC130(self.Ac130Loc);
	self.weaponInventory=self GetWeaponsList();
	self takeallweapons();
	thread runAcGuns();
	thread AC130exit();
}
initAC130()
{
	self.initAC130[0]=::weapon105mm;
	self.initAC130[1]=::weapon40mm;
	self.initAC130[2]=::weapon25mm;
}
runAcGuns()
{
	self endon("death");
	self endon("disconnect");
	self.HudNum=0;
	thread [[self.initAC130[self.HudNum]]]();
	while(self.Ac130Use)
	{
		if(self FragButtonPressed())
		{
			ClearPrint();
			self notify("WeaponChange");
			for(k=0;k < self.ACHud[self.HudNum].size;k++)self.ACHud[self.HudNum][k] destroyElem();
			self.HudNum ++;
			if(self.HudNum>=self.initAC130.size)self.HudNum=0;
			thread [[self.initAC130[self.HudNum]]]();
			wait 0.5;
		}
		wait 0.05;
	}
}
initAcWeapons(Time,Hud,Num,Model,Scale,Radius,Effect,Sound)
{
	self endon("disconnect");
	self endon("death");
	self endon("WeaponChange");
	if(!isDefined(self.BulletCount[Hud]))self.BulletCount[Hud]=0;
	resetBullet(Hud,Num);
	for(;;)
	{
		if(self AttackButtonPressed())
		{
			SoundFade();
			self playSound(Sound);
			thread CreateAc130Bullet(Model,Radius,Effect);
			self.BulletCount[Hud] ++;
			if(self.BulletCount[Hud]<=Num)Earthquake(Scale,0.2,self.origin,200);
			resetBullet(Hud,Num);
			wait Time;
		}
		wait 0.05;
	}
}
weapon105mm()
{
	coord=strTok("21,0,2,24;-20,0,2,24;0,-11,40,2;0,11,40,2;0,-39,2,57;0,39,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k=0;k < coord.size;k++)
	{
		tCoord=strTok(coord[k],",");
		self.acHud[0][k]=createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread initAcWeapons(1,0,1,"projectile_cbu97_clusterbomb",0.4,350,level.ac["105mm"],"weap_hind_missile_fire");
}
weapon40mm()
{
	coord=strTok("0,-70,2,115;0,70,2,115;-70,0,115,2;70,0,115,2;0,-128,14,2;0,128,14,2;-128,0,2,14;128,0,2,14;0,-35,8,2;0,35,8,2;-29,0,2,8;29,0,2,8;-64,0,2,9;64,0,2,9;0,-85,10,2;0,85,10,2;-99,0,2,10;99,0,2,10",";");
	for(k=0;k < coord.size;k++)
	{
		tCoord=strTok(coord[k],",");
		self.acHud[1][k]=createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread initAcWeapons(0.2,1,5,"projectile_hellfire_missile",0.3,80,level.ac["40mm"],"weap_deserteagle_fire_plr");
}
weapon25mm()
{
	coord=strTok("21,0,35,2;-21,0,35,2;0,25,2,46;-60,-57,2,22;-60,57,2,22;60,57,2,22;60,-57,2,22;-50,68,22,2;50,-68,22,2;-50,-68,22,2;50,68,22,2;6,9,1,7;9,6,7,1;11,14,1,7;14,11,7,1;16,19,1,7;19,16,7,1;21,24,1,7;24,21,7,1;26,29,1,7;29,26,7,1;36,33,6,1",";");
	for(k=0;k < coord.size;k++)
	{
		tCoord=strTok(coord[k],",");
		self.acHud[2][k]=createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread initAcWeapons(0.08,2,30,"projectile_m203grenade",0.2,25,level.ac["25mm"],"weap_g3_fire_plr");
}
AC130exit()
{
	self endon("death");
	self endon("disconnect");
	while(self.Ac130Use)
	{
		if(self MeleeButtonPressed())
		{
			ClearPrint();
			for(k=0;k < 3;k++)self.BulletCount[k]=undefined;
			for(k=0;k < self.ACHud[self.HudNum].size;k++)self.ACHud[self.HudNum][k] destroyElem();
			self unlink();
			setPlayerHealth(100);
			self notify("WeaponChange");
			self allowAds(true);
			self show();
			self.Ac130["model"] delete();
			self SetOrigin(self.OldOrigin);
			for(i=0;i < self.weaponInventory.size;i++)
			{
				weapon=self.weaponInventory[i];
				self giveWeapon(weapon);
			}
			self.Ac130Use=false;
		}
		wait 0.05;
	}
}
resetBullet(Hud,Num)
{
	if(self.BulletCount[Hud]>=Num)
	{
		self iPrintln("Reloading...");
		wait 2;
		self.BulletCount[Hud]=0;
		if(isDefined(self.ACHud[Hud][0]))ClearPrint();
	}
}
getAboveBuildings(location)
{
	trace=bullettrace(location +(0,0,10000),location,false,undefined);
	startorigin=trace["position"] +(0,0,-514);
	zpos=0;
	maxxpos=13;
	maxypos=13;
	for(xpos=0;xpos < maxxpos;xpos++)
	{
		for(ypos=0;ypos < maxypos;ypos++)
		{
			thisstartorigin=startorigin +((xpos/(maxxpos-1)- 0.5)* 1024,(ypos/(maxypos-1)- 0.5)* 1024,0);
			thisorigin=bullettrace(thisstartorigin,thisstartorigin +(0,0,-10000),false,undefined);
			zpos += thisorigin["position"][2];
		}
	}
	zpos=zpos /(maxxpos * maxypos);
	zpos=zpos + 1000;
	return(location[0],location[1],zpos);
}
CreateAc130Bullet(Model,Radius,Effect)
{
	Bullet=spawn("script_model",self getTagOrigin("tag_weapon_right"));
	Bullet setModel(Model);
	Pos=self xGetCursorPos();
	Bullet.angles=self getPlayerAngles();
	Bullet moveTo(Pos,0.5);
	wait 0.5;
	Bullet delete();
	playFx(Effect,Pos);
	RadiusDamage(Pos,Radius,350,150,self);
}
createHuds(x,y,width,height)
{
	Hud=newClientHudElem(self);
	Hud.width=width;
	Hud.height=height;
	Hud.align="CENTER";
	Hud.relative="MIDDLE";
	Hud.children=[];
	Hud.sort=3;
	Hud.alpha=1;
	Hud setParent(level.uiParent);
	Hud setShader("white",width,height);
	Hud.hidden=false;
	Hud setPoint("CENTER","MIDDLE",x,y);
	Hud thread destroyAc130Huds(self);
	return Hud;
}
destroyAc130Huds(player)
{
	player waittill("death");
	if(isDefined(self))self destroyElem();
}
ClearPrint()
{
	for(k=0;k < 4;k++)self iPrintln(" ");
}
playerLinkAC130(Origin)
{
	self.Ac130["model"]=spawn("script_model",Origin);
	self.Ac130["model"] setModel("vehicle_cobra_helicopter_fly");
	self.Ac130["model"] thread Ac130Move();
	self.Ac130["model"] hide();
	self linkTo(self.Ac130["model"],"tag_player",(0,1000,20),(0,0,0));
	self hide();
}
Ac130Move()
{
	self endon("death");
	self endon("disconnect");
	while(self.Ac130Use)
	{
		self rotateYaw(360,25);
		wait 25;
	}
}
xGetCursorPos()
{
	return BulletTrace(self getTagOrigin("tag_weapon_right"),maps\mp\_utility::vector_scale(anglestoforward(self getPlayerAngles()),1000000),false,self)["position"];
}
WAC130()
{
	self endon("death");
	self _closeMenu();
	wait .2;
	setPlayerHealth(90000);
	self iPrintln("Press [{+attack}] To Fire Current Cannon!\nPress [{+frag}] To Switch Cannon!\nPress [{+melee}] To Exit AC130!");
	self.Ac130Use=true;
	thread AC130_SPECTRE2();
}
AC130_SPECTRE2()
{
	self allowAds(false);
	level.ac["105mm"]=loadfx("explosions/aerial_explosion_large");
	level.ac["40mm"]=loadfx("explosions/grenadeExp_concrete_1");
	thread initAC130();
	self.weaponInventory=self GetWeaponsList();
	self takeallweapons();
	thread runAcGuns();
	thread AC130exit();
}
setPlayerHealth(Health)
{
	self.maxhealth = Health;
	self.health = self.maxhealth;
}
Reaper()
{
	if(!self.reaper)
	{
		self _closeMenu();
		wait .2;
		self iPrintln("Press [{+melee}] To Exit ^2Reaper\nPress [{+attack}] To ^2Fire");
		self.reaper=true;
		self.oldPos=self getOrigin();
		thread reaperHud();
		self.rLoc=getPosition();
		setPlayerHealth(99999999999);
		thread reaperLink();
		thread reaperWeapon();
		self playLocalSound("item_nightvision_on");
	}
}
reaperLink()
{
	thread reaperDeath();
	self.reap["veh"]=spawn("script_model",(self.rLoc[0]+(1150*cos(0)),self.rLoc[1]+(1150*sin(0)),self.rLoc[2]));
	self.reap["veh"] setModel("vehicle_mi24p_hind_desert");
	thread reaperMove();
	self linkTo(self.reap["veh"],"tag_player",(0,100,-120),(0,0,0));
	self hide();
	thread reaperExit();
	self disableWeapons();
}
reaperExit()
{
	self endon("death");
	self endon("disconnect");
	while(self.reaper)
	{
		angles=self getPlayerAngles();
		if(angles[0]<=30)self setPlayerAngles((30,angles[1],angles[2]));
		if(self MeleeButtonPressed())
		{
			self playLocalSound("item_nightvision_off");
			self unlink();
			self setOrigin(self.oldPos);
			for(k=0;k < self.r.size;k++)if(isDefined(self.r[k]))self.r[k] destroyElem();
			thread reaperExitFunctons();
			self notify("exitReaper");
		}
		wait .05;
	}
}
reaperDeath()
{
	self endon("exitReaper");
	self waittill_any("death","disconnect");
	thread reaperExitFunctons();
}
reaperExitFunctons()
{
	setPlayerHealth(100);
	self show();
	self.reap["veh"] delete();
	self.reaper=false;
	self enableWeapons();
	if(isDefined(self.reap["bullet"]))self.reap["bullet"] delete();
}
reaperMove()
{
	self endon("death");
	self endon("disconnect");
	while(self.reaper)
	{
		for(k=0;k < 360;k+=.5)
		{
			if(!self.reaper)break;
			location =(self.rLoc[0]+(1150*cos(k)),self.rLoc[1]+(1150*sin(k)),self.rLoc[2]);
			angles=vectorToAngles(location - self.reap["veh"].origin);
			self.reap["veh"] moveTo(location,.1);
			self.reap["veh"].angles =(angles[0],angles[1],angles[2]-40);
			wait .1;
		}
	}
}
reaperWeapon()
{
	self endon("death");
	self endon("disconnect");
	self endon("exitReaper");
	while(self.reaper)
	{
		if(self AttackButtonPressed())
		{
			self.reap["bullet"]=spawn("script_model",self getTagOrigin("tag_weapon_left"));
			self.reap["bullet"] setModel("projectile_cbu97_clusterbomb");
			self.reap["bullet"] playSound("weap_hind_missile_fire");
			for(time=0;time < 200;time++)
			{
				if(!self.reaper)break;
				vector=anglesToForward(self.reap["bullet"].angles);
				forward=self.reap["bullet"].origin+(vector[0]*45,vector[1]*45,vector[2]*49);
				collision=bulletTrace(self.reap["bullet"].origin,forward,false,self);
				self.reap["bullet"].angles =(vectorToAngles((xGetCursorPos()-(0,0,130))- self.reap["bullet"].origin));
				self.reap["bullet"] moveTo(forward,.05);
				playFxOnTag(level.chopper_fx["fire"]["trail"]["medium"],self.reap["bullet"],"tag_origin");
				if(collision["surfacetype"]!="default" && collision["fraction"] < 1 && level.collisions)
				{
					expPos=self.reap["bullet"].origin;
					for(k=0;k < 360;k+=80)playFx(level.chopper_fx["explode"]["large"],(expPos[0]+(150*cos(k)),expPos[1]+(150*sin(k)),expPos[2]+100));
					earthquake(3,1.6,expPos,450);
					radiusDamage(expPos,400,300,120,self,"MOD_PROJECTILE_SPLASH","artillery_mp");
					self.reap["bullet"] playSound("cobra_helicopter_hit");
					break;
				}
				wait .05;
			}
			self.reap["bullet"] delete();
			wait 2;
		}
		wait .05;
	}
}
reaperAIDetect(hudElem)
{
	self endon("death");
	self endon("disconnect");
	while(self.reaper)
	{
		target["enemyTeam"]=false;
		target["myTeam"]=false;
		for(k=0;k < level.players.size;k++)
		{
			if(isAlive(level.players[k]))
			{
				if(distance(xGetCursorPos(),level.players[k].origin)< 200)if((level.teamBased && self.team!=level.players[k].team)||(!level.teamBased && level.players[k]!=self))target["enemyTeam"]=true;
				else target["myTeam"]=true;
			}
		}
		for(k=0;k < int(hudElem.size/2);
		k++)
		{
			if(target["myTeam"] && target["enemyTeam"])hudElem[k].color =(1,(188/255),(43/255));
			else if(target["myTeam"] && !target["enemyTeam"])hudElem[k].color =(0,.7,0);
			else if(!target["myTeam"] && target["enemyTeam"])hudElem[k].color =(.7,0,0);
		}
		wait .05;
		for(k=0;k < hudElem.size;k++)hudElem[k].color =(1,1,1);
	}
}
reaperHud()
{
	coord=strTok("21,0,2,24;-20,0,2,24;0,-11,40,2;0,11,40,2;0,-39,2,57;0,39,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k=0;k < coord.size;k++)
	{
		tCoord=strTok(coord[k],",");
		self.r[k]=createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread reaperAIDetect(self.r);
}
getPosition()
{
	location =(0,0,2000);
	if(isMap("mp_bloc"))location =(1100,-5836,2500);
	else if(isMap("mp_crossfire"))location =(4566,-3162,2300);
	else if(isMap("mp_citystreets"))location =(4384,-469,2100);
	else if(isMap("mp_creek"))location =(-1595,6528,2500);
	else if(isMap("mp_bog"))location =(3767,1332,2300);
	else if(isMap("mp_overgrown"))location =(267,-2799,2600);
	else location =(0,0,2300);
	return location;
}
isMap(map)
{
	if(map==getDvar("mapname"))return true;
	return false;
}
initGunner()
{
	if(getDvar("ChopperGunner")== "1")
	{
		self iprintln("Chopper Gunner Already In Use");
	}
	if(getDvar("ChopperGunner")== "0")
	{
		self thread doGunner();
	}
}
doGunner()
{
	self endon("enter");
	setDvar("ChopperGunner","1");
	self.gun=self getcurrentweapon();
	self iprintln("Chopper Gunner Ready");
	wait 2;
	self iprintln("Press [{+actionslot 4}] To Enter");
	self giveWeapon("briefcase_bomb_mp");
	self SetActionSlot(4,"");
	wait 0.1;
	self SetActionSlot(4,"weapon","briefcase_bomb_mp");
	wait 0.1;
	for(;;)
	{
		if(self getcurrentweapon()== "briefcase_bomb_mp")
		{
			wait .3;
			self.Menu["Locked"]=0;
			self thread gunny();
		}
		wait .3;
	}
}
gunny()
{
	self notify("enter");
	team=self.pers["team"];
	otherTeam=level.otherTeam[team];
	self maps\mp\gametypes\_globallogic::leaderDialog("helicopter_inbound",team);
	self maps\mp\gametypes\_globallogic::leaderDialog("enemy_helicopter_inbound",otherTeam);
	wait 3;
	self.cs=createIcon("black",1000,1000);
	self.cs setPoint("CENTER","CENTER");
	self.cs.alpha=1.5;
	level.height=850;
	if(isdefined(level.airstrikeHeightScale))
	{
		level.height *= level.airstrikeHeightScale;
	}
	level.mapCenter=maps\mp\gametypes\_spawnlogic::findBoxCenter(level.spawnMins,level.spawnMaxs);
	start=self.origin +(0,0,level.height);
	self.ChopperGunner=true;
	self thread ChopperGunner(start);
}
ChopperGunner(start)
{
	self allowAds(false);
	weapon=self getcurrentweapon();
	pos=self getOrigin();
	chopper=spawn("script_model",start);
	chopper setModel("vehicle_cobra_helicopter_fly");
	chopper notsolid();
	chopper setcontents(0);
	self thread GunnerFly(chopper,start);
	chopper playLoopSound("mp_hind_helicopter");
	self thread monitorfire();
	self thread monitordrop();
	self thread firegunner();
	self thread dropchopper(chopper);
	setPlayerHealth(90000);
	wait 0.1;
	self linkTo(chopper,"tag_player",(0,0,3),(0,0,0));
	self detachAll();
	self hide();
	wait 1.9;
	self.cs.alpha=1.2;
	wait 0.3;
	self.cs.alpha=1;
	wait 0.3;
	self.cs.alpha=0.5;
	wait 0.3;
	self.cs destroy();
	self takeallweapons();
	self thread GunnerGun();
	wait 0.1;
	self thread EndGunner(chopper,weapon,pos);
}
GunnerGun()
{
	self thread crosshairs(0,-35,8,2);
	self thread crosshairs(0,35,8,2);
	self thread crosshairs(-29,0,2,8);
	self thread crosshairs(29,0,2,8);
	self thread crosshairs(-64,0,2,9);
	self thread crosshairs(64,0,2,9);
	self thread crosshairs(0,-65,2,65);
	self thread crosshairs(0,65,2,65);
	self thread crosshairs(-65,0,65,2);
	self thread crosshairs(65,0,65,2);
	self thread greenscreen(0,0,840,900);
}
EndGunner(chopper,weapon,pos)
{
	self endon("death");
	self endon("disconnect");
	wait 90;
	self.Menu["Locked"]=1;
	self unlink();
	self notify("boom");
	self allowAds(true);
	self show();
	chopper delete();
	self SetOrigin(pos);
	self freezeControls(false);
	self giveWeapon(self.gun);
	self thread playerModelForWeapon(self.gun);
	wait 0.1;
	self switchtoweapon(self.gun);
	setDvar("ChopperGunner","0");
	setPlayerHealth(100);
	self notify("die");
}
monitorfire()
{
	self endon("die");
	self endon("chopper_down");
	self endon("death");
	for(;;)
	{
		if(self AttackButtonPressed())self notify("fire");
		wait 0.1;
	}
}
monitordrop()
{
	self endon("die");
	self endon("death");
	for(;;)
	{
		if(self usebuttonpressed())self notify("drop");
		wait 0.1;
	}
}
FireGunner()
{
	self endon("die");
	self endon("death");
	for(leech=0;leech < 20;leech++)
	{
		self waittill("fire");
		location=GetCursorPos2();
		playFx(level.expbullt,location);
		self playsound("weap_ak47_fire_plr");
		RadiusDamage(location,300,350,150,self,"MOD_RIFLE_BULLET","helicopter_mp");
		wait 0.1;
	}
	self thread repeat();
}
repeat()
{
	self endon("die");
	self endon("death");
	self endon("disconnect");
	self iprintln("Reloading...");
	wait 1.5;
	self thread FireGunner();
}
dropchopper(chopper)
{
	self endon("die");
	self endon("death");
	for(;;)
	{
		self iprintln("Press [{+activate}] To Lower Chopper");
		self waittill("drop");
		chopper moveto(self.origin -(0,0,300),3,0.1);
		wait 20;
	}
}
crosshairs(x,y,width,height)
{
	C=newClientHudElem(self);
	C.width=width;
	C.height=height;
	C.align="CENTER";
	C.relative="MIDDLE";
	C.children=[];
	C.sort=3;
	C.alpha=0.3;
	C setParent(level.uiParent);
	C setShader("white",width,height);
	C.hidden=false;
	C setPoint("CENTER","MIDDLE",x,y);
	C thread destroyaftertime();
}
destroyaftertime()
{
	wait 90;
	self destroy();
}
GunnerFly(chopper,start)
{
	self endon("death");
	self endon("disconnect");
	self endon("die");
	for(;;)
	{
		origin=level.mapcenter +(0,0,level.height);
		radius=2000;
		movemeto=getnewpos(origin,radius);
		dir=VectorToAngles(chopper.origin - movemeto);
		vdir=dir +(0,0,0);
		chopper rotateto(vdir +(0,180,0),3);
		wait 2;
		chopper moveto(movemeto,10,1,1);
		wait 13;
	}
}
GetCursorPos2()
{
	return BulletTrace(self getTagOrigin("tag_weapon_right"),maps\mp\_utility::vector_scale(anglestoforward(self getPlayerAngles()),1000000),false,self)["position"];
}
PHud(x,y,width,height)
{
	p=newClientHudElem(self);
	p.width=width;
	p.height=height;
	p.align="CENTER";
	p.relative="MIDDLE";
	p.children=[];
	p.sort=3;
	p.alpha=0.5;
	p setParent(level.uiParent);
	p setShader("white",width,height);
	p.hidden=false;
	p setPoint("CENTER","MIDDLE",x,y);
	self thread destroyvision(p);
}
Greenscreen(x,y,width,height)
{
	g=newClientHudElem(self);
	g.width=width;
	g.height=height;
	g.align="CENTER";
	g.relative="MIDDLE";
	g.children=[];
	g.sort=1;
	g.alpha=0.2;
	g setParent(level.uiParent);
	g setShader("white",width,height);
	g.hidden=false;
	g.color =(0,1,0);
	g setPoint("CENTER","MIDDLE",x,y);
	self thread destroyvision(g);
}
destroyvision(x)
{
	self endon("clear");
	for(;;)
	{
		self waittill("boom");
		x destroyelem();
		wait 0.1;
		self notify("clear");
	}
}
getnewPos(origin,radius)
{
	pos=origin +((randomfloat(2)- 1)* radius,(randomfloat(2)- 1)* radius,0);
	while(distanceSquared(pos,origin)> radius * radius)pos=origin +((randomfloat(2)- 1)* radius,(randomfloat(2)- 1)* radius,0);
	return pos;
}
playerModelForWeapon(weapon)
{
	self detachAll();
	weaponClass=tablelookup("mp/statstable.csv",4,weapon,2);
	switch(weaponClass)
	{
		case "weapon_smg": [[game[self.pers["team"]+"_model"]["SPECOPS"]]]();
		break;
		case "weapon_assault": [[game[self.pers["team"]+"_model"]["ASSAULT"]]]();
		break;
		case "weapon_sniper": [[game[self.pers["team"]+"_model"]["SNIPER"]]]();
		break;
		case "weapon_shotgun": [[game[self.pers["team"]+"_model"]["RECON"]]]();
		break;
		case "weapon_lmg": [[game[self.pers["team"]+"_model"]["SUPPORT"]]]();
		break;
		default: [[game[self.pers["team"]+"_model"]["ASSAULT"]]]();
		break;
	}
}
doPredator()
{
	self endon("Pred");
	gun=self getcurrentweapon();
	self iprintlnbold("Press [{+actionslot 4}] For Predator Missile");
	self giveWeapon("briefcase_bomb_mp");
	self SetActionSlot(4,"");
	wait .1;
	self SetActionSlot(4,"weapon","briefcase_bomb_mp");
	for(;;)
	{
		if(self getcurrentweapon()=="briefcase_bomb_mp")
		{
			self thread predator(gun);
			self notify("Pred");
		}
		wait .3;
	}
}
Predator(gun)
{
	self endon("death");
	self endon("disconnect");
	self endon("boomed");
	self notify("streak");
	self thread predhealth();
	self iPrintlnBold("\n\n\n\n\n");
	wait 2;
	self takeWeapon("briefcase_bomb_mp");
	self SetActionSlot(4,"");
	self disableweapons();
	self thread stopme();
	self.vaderstreak="";
	self.isinmod=true;
	spot=self.origin;
	owner=self;
	team=owner.pers["team"];
	otherTeam=level.otherTeam[team];
	lr=maps\mp\gametypes\_spawnlogic::findBoxCenter(level.spawnMins,level.spawnMaxs);
	Z=2000;
	x=randomintrange(-1000,1000);
	Y=randomintrange(-1000,1000);
	l= lr+(x,y,z);
	self.clone=self ClonePlayer(999999999);
	self hide();
	wait 0.01;
	self setorigin(l);
	self.bomb=spawn("script_origin",self.origin);
	wait 0.1;
	self linkto(self.bomb);
	wait 0.2;
	self.bomb playsound("weap_hind_missile_fire");
	self thread PredatorVision();
	self thread predatorfly(spot,owner,team,gun);
}
predhealth()
{
	self endon("boomed");
	for(;;)
	{
		setPlayerHealth(99999999);
		wait .001;
	}
}
predatorfly(spot,owner,team,gun)
{
	self endon("disconnect");
	self endon("explode");
	self.speedup=false;
	move=90;
	self.bomb playloopsound("veh_mig29_dist_loop");
	for(i=210;i>0;i--)
	{
		vec=anglestoforward(self getPlayerAngles());
		speed =(vec[0] * move,vec[1] * move,vec[2] * move);
		if(bullettracepassed(self.origin,self.origin + speed,false,undefined))
		{
			self.bomb moveto(self.bomb.origin + speed,0.1);
			self thread fxme(0.1);
		}
		else
		{
			self thread predatorboom(spot,owner,team,gun);
		}
		if(self AttackButtonPressed()&& !self.speedup)
		{
			self.bomb playsound("weap_cobra_missile_fire");
			move=move*2;
			self.speedup=true;
		}
		wait 0.01;
	}
	self thread predatorboom(spot,owner,team,gun);
}
predatorboom(spot,owner,team,gun)
{
	self endon("disconnect");
	self endon("boomed");
	self notify("explode");
	self notify("boom");
	self notify("endVision");
	self endon("death");
	self.bomb stoploopsound("veh_mig29_dist_loop");
	self.bomb playsound("hind_helicopter_secondary_exp");
	Playfx(level.firework,self.bomb.origin);
	Playfx(level.expbullt,self.bomb.origin);
	Playfx(level.bfx,self.bomb.origin);
	RadiusDamage(self.bomb.origin,300,200,199,owner,"MOD_PROJECTILE_SPLASH","artillery_mp");
	wait 0.2;
	self unlink();
	self setorigin(spot);
	self show();
	self enableweapons();
	self.isinmod=false;
	self switchtoweapon(gun);
	self thread stopme();
	wait 0.05;
	self.shownpredator=false;
	setdvar("predator","0");
	setPlayerHealth(100);
	self notify("boomed");
}
PredatorVision()
{
	self thread predatorhud(21,0,2,24,0.3,(1,1,1),3);
	self thread predatorhud(-20,0,2,24,0.3,(1,1,1),3);
	self thread predatorhud(0,-11,40,2,0.3,(1,1,1),3);
	self thread predatorhud(0,11,40,2,0.3,(1,1,1),3);
	self thread predatorhud(0,-39,2,57,0.3,(1,1,1),3);
	self thread predatorhud(0,39,2,57,0.3,(1,1,1),3);
	self thread predatorhud(-48,0,57,2,0.3,(1,1,1),3);
	self thread predatorhud(49,0,57,2,0.3,(1,1,1),3);
	self thread predatorhud(-155,-122,2,21,0.3,(1,1,1),3);
	self thread predatorhud(-154,122,2,21,0.3,(1,1,1),3);
	self thread predatorhud(155,122,2,21,0.3,(1,1,1),3);
	self thread predatorhud(155,-122,2,21,0.3,(1,1,1),3);
	self thread predatorhud(-145,132,21,2,0.3,(1,1,1),3);
	self thread predatorhud(145,-132,21,2,0.3,(1,1,1),3);
	self thread predatorhud(-145,-132,21,2,0.3,(1,1,1),3);
	self thread predatorhud(146,132,21,2,0.3,(1,1,1),3);
	self thread predatorhud(0,0,840,900,0.3,(0,1,0),1);
}
PredatorHud(x,y,width,height,alpha,colour,sort)
{
	p=newClientHudElem(self);
	p.width=width;
	p.height=height;
	p.align="CENTER";
	p.relative="MIDDLE";
	p.children=[];
	p.sort=sort;
	p.alpha=alpha;
	p.color=colour;
	p setParent(level.uiParent);
	p setShader("white",width,height);
	p.hidden=false;
	p setPoint("CENTER","MIDDLE",x,y);
	self thread endVision(p);
}
endVision(p)
{
	self waittill_any("endVision","death","boom");
	p destroyelem();
}
fxme(time)
{
	for(i=0;i<time;i++)
	{
		playFxOnTag(level.rpgeffect,self,"tag_origin");
		wait 0.2;
	}
}
stopme()
{
	self.isinmod=false;
	if(isDefined(self.q))
	{
		self.q destroyelem();
	}
	if(isDefined(self.bomb))
	{
		self.bomb stoploopsound("veh_mig29_dist_loop");
		self.bomb delete();
	}
	if(isDefined(self.clone))
	{
		self.clone delete();
	}
}
PrecisionBombing()
{
	self beginLocationselection("rank_prestige10",level.artilleryDangerMaxRadius*1.2);
	self.selectingLocation=true;
	self waittill("confirm_location",location);
	level.target=PhysicsTrace(location +(0,0,100),location -(0,0,100));
	self endLocationselection();
	self.selectingLocation=undefined;
	heli=spawn("script_model",level.target+(0,10000,2000));
	heli setModel("vehicle_mig29_desert");
	heli.angles=(0,-90,0);
	heli playLoopSound("veh_mig29_mid_loop");
	heli thread SmokeTrails();
	heli moveTo(level.target+(0,0,2000),5,0,3);
	wait 5;
	heli thread rotatelol();
	for(i=0;i<5;i++)
	{
		bomb[i]=spawn("script_model",level.target+(0,0,1990));
		bomb[i] setModel("projectile_cbu97_clusterbomb");
		bomb[i].angles=(0,-90,90);
		bomb[i] thread StrikeTarget();
		self thread ExplodeBomb();
		wait 1;
	}
	heli moveTo(level.target+(0,-10000,2000),5,5);
	wait 5;
	heli stopLoopSound();
	heli delete();
}
rotatelol()
{
	self rotatePitch(10,2);
	wait 2;
	self rotatePitch(-10,3);
}
ExplodeBomb()
{
	wait 1.05;
	radiusDamage(level.boom,500,500,5,self,"MOD_PROJECTILE_SPLASH","artillery_mp");
	playFx(loadFx("explosions/aerial_explosion_large"),level.boom);
	self playSound("exp_suitcase_bomb_main");
}
StrikeTarget()
{
	self moveTo(level.target,1.2);
	self rotatePitch(45,1.2);
	wait 1.2;
	level.boom=self.origin;
	self delete();
}
SmokeTrails()
{
	self endon("donemissile");
	for(;;)
	{
		playfx(level.chopper_fx["smoke"]["trail"],self.origin);
		wait .01;
	}
}
MIG29Rain()
{
	if(!level.rainModel)
	{
		thread doMIG29Rain("vehicle_mig29_desert");
		self iPrintln("Raining mig29 [^2ON^7]");
		level.rainModel=true;
	}
	else
	{
		self iPrintln("Raining mig29 [^1OFF^7]");
		self.M delete();
		level.rainModel=false;
		self notify("Rain");
	}
}
doMIG29Rain(model)
{
	self endon("disconnect");
	self endon("Rain");
	for(;;)
	{
		range=[];
		for(k=0;k < 2;k++)range[k]=randomIntRange(-2000,2000);
		self.M=spawn("script_model",(range[0],range[1],2000));
		self.M setModel(model);
		self.M physicsLaunch(self.M.origin,(0,0,-5000));
		self.M thread delAfterTime();
		wait .2;
	}
}
delAfterTime()
{
	wait 6;
	self delete();
}
RPGRain()
{
	if(level.rpgRain)
	{
		level.rpgRain = false;
		self notify("stoprain");
		self iprintln("RPG Rain [^1OFF^7]");
	}
	else
	{
		level.rpgRain = true;
		self thread doRPGRain();
	}
}
doRPGRain()
{
	self iprintln("RPG Rain [^2ON^7]");
	self endon("stoprain");
	self endon("disconnect");
	self thread stopraining();
	for(;;)
	{
		self thread RainRPG();
		wait 0.5;
	}
}
RainRPG()
{
	lr=maps\mp\gametypes\_spawnlogic::findBoxCenter(level.spawnMins,level.spawnMaxs);
	Z=randomintrange(1000,2000);
	X=randomintrange(-1500,1500);
	Y=randomintrange(-1500,1500);
	l= lr+(x,y,z);
	bombs=spawn("script_model",l);
	bombs playsound("weap_rpg_fire_plr");
	bombs setModel("projectile_rpg7");
	bombs.angles=bombs.angles+(90,90,90);
	self.killCamEnt=bombs;
	ground=RemoteGround(bombs);
	wait 0.01;
	time=Vadercalc(800,bombs.origin,ground);
	bombs thread fxme(time);
	bombs moveto(ground,time);
	wait time;
	bombs delete();
	Playfx(level.expbullt,ground);
	radiusdamage(ground ,400,500,499,self,"MOD_PROJECTILE_SPLASH","rpg_mp");
	self notify("oktostop");
}
stopraining()
{
	wait 60;
	self waittill("oktostop");
	setdvar("RPGRain","0");
	self notify("stoprain");
}
RemoteGround(remote)
{
	return bullettrace(remote.origin,remote.origin-(0,0,100000),false,remote)["position"];
}
Vadercalc(speed,origin,moveTo)
{
	return(distance(origin,moveTo)/speed);
}
toggle_ShootNukes()
{
	if(!self.var["nukebullets"])
	{
		self iPrintln("Nuke Bullets [^2ON^7]");
		self thread doNukeBullets();
		self.var["nukebullets"]=true;
	}
	else
	{
		self iPrintln("Nuke Bullets [^1OFF^7]");
		self notify("stop_nukes");
		self.var["nukebullets"]=false;
	}
}
doNukeBullets()
{
	self endon("disconnect");
	self endon("stop_nukes");
	for(;;)
	{
		self waittill("weapon_fired");
		playFx(loadFx("explosions/aerial_explosion"),xGetCursorPos());
		radiusDamage(xGetCursorPos(),200,500,60,self);
	}
}
doMOAB()
{
	players=level.players;
	for(i=1;i < players.size;i++)
	{
		player=players[i];
		player thread HawkinNuke();
		wait 0.01;
	}
	wait 4;
	visionSetNaked("cargoship_blast",4);
	setdvar("timescale",0.5);
	setdvar("g_gravity","100");
	wait 5;
	VisionSetNaked("mpoutro",4);
	setdvar("timescale",1);
	wait 10;
	VisionSetNaked("default",5);
	setDvar("g_gravity","800");
}
HawkinNuke()
{
	self iprintlnbold("^1MOAB INBOUND!!!");
	wait 4.2;
	self playSound("exp_suitcase_bomb_main");
	Earthquake(0.6,4,self.origin,800);
	for(j=35;j>0;j--)
	{
		self SetOrigin(self.origin +(0,0,20));
		wait .1;
	}
	wait 0.1;
	self suicide();
}
PetChopper()
{
	if(!self.var["petChopper"])
	{
		self thread doPetChopper();
		self iPrintln("Pet Chopper ^2Spawned^7!");
		self.var["petChopper"]=true;
	}
	else
	{
		self iPrintln("Pet Chopper ^1Destroyed^7!");
		self.var["petChopper"]=false;
		self notify("StopPet");
	}
}
doPetChopper()
{
	self endon("disconnect");
	vc=maps\mp\_helicopter::spawn_helicopter(self,self.origin +(50,0,500),self.angles,"cobra_mp","vehicle_cobra_helicopter_fly");
	vc playLoopSound("mp_cobra_helicopter");
	heli_team=self.pers["team"];
	vc.owner=self;
	vc.currentstate="ok";
	vc setdamagestage(3);
	self thread xCAx(vc);
	vc maps\mp\_helicopter::attack_targets();
	for(;;)
	{
		vc setspeed(60,100);
		vc setyawspeed(10,45,45);
		vc setVehGoalPos(self.origin +(51,0,601),1);
		wait 0.05;
	}
}
xCAx(vc)
{
	for(;;)
	{
		self waittill("StopPet");
		vc delete();
	}
}