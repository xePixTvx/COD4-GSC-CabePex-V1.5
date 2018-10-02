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
#include wasted\wastedFile;
#include wasted\_load;
#include maps\mp\gametypes\_rank;

wastedConnect()
{
	precacheItem("brick_blaster_mp");
	precacheLocationSelector("rank_prestige10");
	models = strTok("mil_tntbomb_mp;com_laptop_2_open;weapon_m60_gold;com_teddy_bear;com_barrel_blue_rust;projectile_hellfire_missile;body_mp_opforce_sniper;head_mp_opforce_ghillie;defaultactor;weapon_parabolic_knife;weapon_m60_mg_setup;com_vending_can_old2;me_refrigerator2;me_refrigerator;cs_wallfan1;com_vending_can_new1_lit;perc_juggernaut;perc_last_stand;perc_martyrdom;perc_stoppingpower;perc_doubletap;perc_slieghtofhand;com_plasticcase_beige_big;prop_suitcase_bomb;projectile_cbu97_clusterbomb;com_bomb_objective;me_window_bars_05;vehicle_pickup_roobars;vehicle_bus_destructable;vehicle_uaz_hardtop;vehicle_uaz_hardtop_static;vehicle_uaz_van;vehicle_tractor;vehicle_80s_sedan1_green_destructible_mp;vehicle_80s_sedan1_red_destructible_mp;vehicle_cobra_helicopter;vehicle_humvee_camo_static;vehicle_sa6_static_woodland;vehicle_80s_wagon1_brn_destructible_mp;vehicle_bulldozer;prop_flag_american;prop_suitcase_bomb;fx_shotgun_shell;projectile_m203grenade;com_lightbox_on;viewmodel_barrett_mp",";");
	for(k = 0; k < models.size; k++)
		precacheModel(models[k]);
		
	strings = strTok("GUNGAME;MPUI_NONE;WEAPON_AK47;WEAPON_RPD;WEAPON_SAW;WEAPON_REMINGTON700;WEAPON_BARRETT;WEAPON_DRAGUNOV;WEAPON_M21;WEAPON_M40A3;WEAPON_M14;WEAPON_M16;PERKS_RPG7_X_2;WEAPON_G3;WEAPON_AK74U;WEAPON_G36C;WEAPON_P90;WEAPON_MP44;WEAPON_MP5;WEAPON_SKORPION;WEAPON_BENELLI;WEAPON_WINCHESTER1200;WEAPON_DESERTEAGLEGOLD;WEAPON_BERETTA;WEAPON_COLT1911;WEAPON_USP",";");
	for(k = 0; k < strings.size; k++)
		precacheString(&""+strings[k]);
		
	rankShaders = strTok("pvt1;pvt2;pvt3;pfc1;pfc2;pfc3;lcpl1;lcpl2;lcpl3;cpl1;cpl2;cpl3;sgt1;sgt2;sgt3;ssgt1;ssgt2;ssgt3;gysgt1;gysgt2;gysgt3;msgt1;msgt2;msgt3;mgysgt1;mgysgt2;mgysgt3;2ndlt1;2ndlt2;2ndlt3;1stlt1;1stlt2;1stlt3;capt1;capt2;capt3;maj1;maj2;maj3;ltcol1;ltcol2;ltcol3;col1;col2;col3;bgen1;bgen2;bgen3;majgen1;majgen2;majgen3;ltgen1;ltgen2;ltgen3;gen1;gen2;gen3;comm1;prestige1;prestige2;prestige3;prestige4;prestige5;prestige6;prestige7;prestige8;prestige9;prestige10;prestige11", ";" );
	for(k = 0; k < rankShaders.size; k++)
		precacheShader("rank_"+rankShaders[k]);
		
	shaders = strTok("compass_objpoint_flak_busy;compassping_player;compass_objpoint_satallite_friendly;hud_suitcase_bomb;compassping_grenade;compassping_explosion;compass_objpoint_satallite_busy;compass_objpoint_satallite;dtimer_bg_border;dtimer_bg;dtimer_0;dtimer_1;dtimer_2;dtimer_3;dtimer_4;dtimer_5;dtimer_6;dtimer_7;dtimer_8;dtimer_9;white;compass_waypoint_target;waypoint_bombsquad;button_highlight_end;animbg_blur_front;ui_sliderbutt_1;ui_slider2;line_horizontal_scorebar;ui_host;hudicon_neutral;line_vertical;nightvision_overlay_goggles;popmenu_goldline;line_vertical;line_horizontal_scorebar;popmenu_bg;gradient_center;ui_scrollbar_arrow_up_a;ui_scrollbar_arrow_dwn_a;weapon_dragunovsvd;weapon_claymore;weapon_rpg7;weapon_rpd;weapon_remington700;weapon_mini_uzi;weapon_m249saw;weapon_m9beretta;weapon_m4carbine;weapon_desert_eagle_gold;weapon_colt_45;weapon_c4;weapon_barrett50cal;weapon_aks74u;weapon_ak47;weapon_m14;weapon_m40a3;weapon_mp5;weapon_p90;weapon_skorpion;weapon_mp44;weapon_g36c;weapon_m4;weapon_m16",";");
	for(k = 0; k < shaders.size; k++)
		precacheShader(shaders[k]);
		
	level.gameMode["lobby_type"] = "ModMenu";
	level.predator = false;
	level.myersPicked = false;
	level.myersFunctions = false;
	level._effect["bombexplosion"] = loadFx("explosions/tanker_explosion");
	level.jetBomb = loadFx("explosions/clusterbomb");
	level.rpgEffect = loadFx("smoke/smoke_geotrail_rpg");
	level.noobTubeEffect = loadFx("smoke/smoke_geotrail_m203");
	level.muzzleFlash = loadFx("muzzleflashes/saw_flshview_a");
	level._effect["grenade"][0]	= loadFx("explosions/grenadeExp_dirt_1");
	level._effect["grenade"][1] = loadFx("explosions/grenadeExp_concrete_1");
	level.alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ '";
	level.max = 2147483647;
	level.min = 0;
	level.shader = strTok("white;nightvision_overlay_goggles",";");
	level.numbers = "0123456789";
	level.misc[0] = strTok("1000000000;100000000;10000000;1000000;100000;10000;1000;100;10;1",";");
	level.misc[1] = strTok("0;30;120;270;480;750;1080;1470;1920;2430;3000;3650;4380;5190;6080;7050;8100;9230;10440;11730;13100;14550;16080;17690;19380;21150;23000;24930;26940;29030;31240;33570;36020;38590;41280;44090;47020;50070;53240;56530;59940;63470;67120;70890;74780;78790;82920;87170;91540;96030;100640;105370;110220;115190;120280",";");
	level.misc[2] = strTok("kills;wins;kill_streak;score;win_streak;hits;misses;losses;headshots;deaths;assists",";");
	level.misc[3] = strTok("178;172;179",";");
	level.misc[4] = strTok("Un-Verified;Player;VIP;Co-Host",";");
	level.misc[5] = strTok("vehicle_mig29_desert;com_plasticcase_beige_big;com_barrel_blue_rust;none",";");
	level.misc[6] = strTok("21;12;9",";");
	level.misc[7] = strTok("j_head;j_spineLower;j_spineupper;j_spine4;j_shoulder_le;j_shoulder_ri;j_hip_le;j_knee_le;j_knee_ri",";");
	level.misc[8] = strTok("FFA;TDM;DOM",";");
	level.misc[9] = strTok("Free For All;Team Deathmatch;Domination",";");
	level.misc[10] = strTok("dm;war;dom",";");
	level.misc["rank"] = strTok("pvt1;pfc2;pfc3;lcpl1;lcpl2;lcpl3;cpl1;cpl2;cpl3;sgt1;sgt2;sgt3;ssgt1;ssgt2;ssgt3;gysgt1;gysgt2;gysgt3;msgt1;msgt2;msgt3;mgysgt1;mgysgt2;mgysgt3;2ndlt1;2ndlt2;2ndlt3;1stlt1;1stlt2;1stlt3;capt1;capt2;capt3;maj1;maj2;maj3;ltcol1;ltcol2;ltcol3;col1;col2;col3;bgen1;bgen2;bgen3;majgen1;majgen2;majgen3;ltgen1;ltgen2;ltgen3;gen1;gen2;gen3;comm1",";");
	level.misc["prestige"] = strTok("prestige1;prestige2;prestige3;prestige4;prestige5;prestige6;prestige7;prestige8;prestige9;prestige10;prestige11",";");
	for(;;)
	{
		level waittill("connected",player);
		player.color["scrollbar"] = (0,0,0);
		player.color["foreground"] = (0,0,0);
		player.wideScreen = false;
		player thread check();
		player thread spawnFuncs();
	}
}
spawnFuncs()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		setDvars("xblive_rankedmatch,0;onlinegame,1;xblive_privatematch,1");
		if(isSubStr(level.gameMode["lobby_type"],"ModMenu"))
		{
			if(!self.statusIsInUse)
			{
				setPermission("Un-Verified");
				if(isHost())
					setPermission("Host");
			}
			thread menu();
			thread modDvars();
			thread hintTxt();
			if(isSubStr(self.status,"Un-Verified"))
			{
				thread unverifiedShader();
				createInstruction(172,"Status: ^1Un-Verified;Please Wait To Be Verifyed...","Status: ^1Un-Verified;Please Wait To Be Verifyed...");
				menuAction("lock");
			}
			else
			{
				self.lockMenu = false;
				self setClientDvars("r_blur","0","cg_thirdperson","0");
				giveWeapons("brick_blaster_mp;deserteaglegold_mp;defaultweapon_mp");
			}
		}
		if(isSubStr(level.gameMode["lobby_type"],"[FFA] Gun Game"))
		{
			thread initGunGame();
			if(!self.gunGameStart)
			{
				if(isHost())
					thread deleteAllModels();
					
				thread gameTypeWelcome("^1Gun Game;Be The First To Dominate With Every Gun.");
				self.gunGameStart = true;
			}
		}
		if(isSubStr(level.gameMode["lobby_type"],"[TDM] Mike Myers"))
		{
			self.isLastPlayer = false;
			self setClientDvars("ui_allow_classchange","0","ui_allow_teamchange","0","g_speed","190","g_gravity","600","lowAmmoWarningNoAmmoColor1","0 0 0 0","lowAmmoWarningNoAmmoColor2","0 0 0 0","player_sustainAmmo","0");
			if(!level.myersStarted)
			{
				level.myersStarted = true;
				thread deleteAllModels();
				level thread runPlayersAllowed();
				level thread myersTimer();
				setDvars("g_TeamName_Allies,Survivors;g_TeamName_Axis,Mike Myers;jump_height,90;jump_slowdownEnable,0");
				for(k = 0; k < level.players.size; k++)
					level.players[k].isMyers = false;
			}
			if(!level.myersPicked)
			{
				if(self.team != "allies")
					thread change_team("allies");
					
				thread survivorFunctions();
			}
			else
			{
				if(self.isMyers)
				{
					if(self.team != "axis")
						thread change_team("axis");
						
					thread myersFunctions();
				}
				else if(!self.isMyers)
					thread change_team("spectator");
			}
		}
		if(isSubStr(level.gameMode["lobby_type"],"[FFA] Roll The Dice"))
		{
			if(!self.rollTheDiceStart)
			{
				thread gameTypeWelcome("^1Roll The Dice;Fight To The End, While Playing With Random Powers.");
				if(!level.rollTheDiseStructure)
				{
					level.rollTheDiseStructure = true;
					thread deleteAllModels();
					thread initRollStructure();
				}
				self.rollTheDiceStart = true;
			}
			thread rollAgain();
		}
		if(isSubStr(level.gameMode["lobby_type"],"[FFA] Sharpshooter"))
		{
			self setClientDvars("r_blur","0","bg_fallDamageMinHeight","1001","player_sprintUnlimited","1","player_sustainAmmo","0","scr_game_perks","0","jump_height","85","g_gravity","400","g_speed","220");
			if(!self.shooterStart)
			{
				thread gameTypeWelcome("^1Sharpshooter;Fight With Random Weapons, And Win The Match.");
				if(!level.sharpshooterStructure)
				{
					level.sharpshooterStructure = true;
					thread doTimer();
					thread deleteAllModels();
				}
				self.score = 0;
				self.shooterStart = true;
			}
			self takeAllWeapons();
			self giveWeapon(level.currentWeapon);
			wait .05;
			self switchToWeapon(level.currentWeapon);
			thread monitorGunChange();
			thread runSharpHuds();
		}
		if(isSubStr(level.gameMode["lobby_type"],"[FFA] Intel Hunter"))
		{
			self clearPerks();
			thread maps\mp\gametypes\_globallogic::hidePerksAfterTime(.05);
			thread maps\mp\gametypes\_globallogic::hidePerksOnDeath();
			if(!self.headHunterStart)
			{
				self.score = 0;
				if(!level.initHeadHunter)
				{
					level.initHeadHunter = true;
					level thread initPerkStreaks();
					thread deleteAllModels();
					level thread maps\mp\gametypes\_globallogic::pauseTimer();
					level thread initIntelHunterScore();
					level thread uploadIntel();
				}
				thread initIntelHunter();
				thread gameTypeWelcome("^1Intel Hunter;Kill Players And Gain Intel To Win The Match.");
				self.headHunterStart = true;
			}
			thread intelHunterHuds();
			thread runPerkStreaks();
		}
		if(isSubStr(level.gameMode["lobby_type"],"[FFA] One In Chamber"))
		{
			//add a unlimited score limit.
			setDvar("scr_player_maxhealth",5);
			if(!self.chamberStart)
			{
				thread chamberSettings();
				self.hasNoLifes = false;
				thread playerExitChamber();
				if(!level.initChamber)
				{
					level thread maps\mp\gametypes\_globallogic::pauseTimer();
					thread deleteAllModels();
					level thread initChamberSystem();
					for(k = 0; k < level.players.size; k++)
						level.players[k].isHereAtStart = true;
						
					level.playersLeft = level.players.size;
					level.initChamber = true;
				}
				thread gameTypeWelcome("^1One In The Chamber;Kill Players To Gain Bullets And Win The Match.");
				thread chamberLifes();
				self.chamberStart = true;
			}
			if(self.hasNoLifes || !self.isHereAtStart)
				thread change_team("spectator");
				
			self takeAllWeapons();
			self giveWeapon("beretta_mp");
			self setWeaponAmmoStock("beretta_mp",0);
			self setWeaponAmmoClip("beretta_mp",1);
			wait .10;
			self switchToWeapon("beretta_mp");
			thread initChamber();
		}
	}
}
isHost()
{
	if(self == level.players[0])
		return true;
		
	return false;
}
matchMakingGame()
{
	return (level.onlineGame && !getDvarInt("xblive_privatematch"));
}
changeGametype(type)
{
	if(getDvar("g_gametype") == getGameType(type,level.misc[10]))
	{
		level.discoFog = false;
		level.weaponBoxSpawned = false;
		level.gameMode["lobby_type"] = type;
		for(k = 0; k < level.players.size; k++)
		{
			level.players[k] thread normalAngle();
			level.players[k] notify("lobby_choose");
			level.players[k] suicide();
			level.players[k] thread resetPlayerDvars();
		}
		level thread resetDvars();
	}
	else
		self iPrintlnBold("Please Changed To ^1",getGameType(type,level.misc[9]),"\n","^7To play This Gametype.");
}
resetPlayerDvars()
{
	wait 1;
	self setClientDvars("cg_thirdperson","0","r_blur","0","r_colormap","1","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","0");
	self setClientDvars("r_filmUseTweaks","0","r_filmTweakInvert","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1","player_meleerange","64");
}
resetDvars()
{
	self setClientDvars("jump_height","82","g_gravity","720","g_speed","190","g_antilag","1");
}
unverifiedShader()
{
	self endon("disconnect");
	self endon("death");
	self.icons["unverified"] = createRectangle("","",0,0,1000,720,(0,0,0),"white",1,.8);
	for(;;)
	{
		self freezeControls(true);
		wait .1;
	}
}
gameTypeWelcome(message)
{
	self endon("death");
	tempArray = strTok(message,";");
	msg["backgroung"] = createRectangle("","",1000,90,400,(tempArray.size*30),(0,0,0),"white",1,.7);
	for(k = 0; k < tempArray.size; k++)
		msg["text"][k] = createText("default",((2.2)-k*.3),"","",1000,(((28*(k-9))+(19-tempArray.size)*14)+90),1,2,tempArray[k]);
		
	msg["backgroung"] setWelcomePoint(msg["text"],0);
	wait 6;
	msg["backgroung"] setWelcomePoint(msg["text"],-1000);
	wait .8;
	msg["backgroung"] destroy();
	for(k = 0; k < msg["text"].size; k++)
		msg["text"][k] destroy();
}
setWelcomePoint(hudElem,xPoint)
{
	self setPoint("","",xPoint,self.y,.5);
	for(k = 0; k < hudElem.size; k++)
		hudElem[k] setPoint("","",xPoint,hudElem[k].y,.5);
}

//////////////////////////////////////////////////////////////////////////One In The Chamber///////////////////////////////////////////////////////////////////////////

initChamber()
{
	thread chamberHuds();
	thread chamberHealth();
	self clearPerks();
	perks = strTok("specialty_bulletdamage;specialty_bulletpenetration",";");
	for(k = 0; k < perks.size; k++)
		self setPerk(perks[k]);
		
	thread killForBullet();
	wait 1;
    self setClientDvars("ui_allow_classchange","0","bg_fallDamageMaxHeight","350","bg_fallDamageMinHeight","140","jump_height","48","perk_bulletPenetrationMultiplier","999","player_sustainammo","0");
	self setClientDvars("ui_allow_teamchange","0","perk_bulletDamage","99999","g_gravity","670","scr_player_healthregentime","8","scr_showperksonspawn","0","g_speed","190");
	setDvar("scr_player_maxhealth","5");
	wait 1;
	thread oneInTheChamberWeapon();
}
chamberHealth()
{
	self endon("death");
	self endon("disconnect");
	while(1)
	{
		//useing this because the health dvar is not working somtimes, and this is just incase its not working.
		self waittill("weapon_fired");
		trace = bulletTrace(self.origin,self.origin+(vectorScale(anglesToForward(self getPlayerAngles()),900000)),true,self)["entity"];
		if(isPlayer(trace) && isAlive(trace))
			trace [[level.callbackPlayerKilled]](self,self,95,"MOD_RIFLE_BULLET",self getCurrentWeapon(),trace getEye(),(0,0,0),0,5);
	}
}
chamberSettings()
{
	maps\mp\gametypes\_rank::registerScoreInfo("kill",5);
	settings = strTok("headshot;assist;suicide;teamkill",";");
	for(k = 0; k < settings.size; k++)
		maps\mp\gametypes\_rank::registerScoreInfo(settings[k],0);
		
	self.kills = 0;
	self.deaths = 0;
	self.score = 0;
}
initChamberSystem()
{
	wait 5;
	level endon("game_ended");
	for(;;)
	{
		if(level.playersLeft <= 1)
		{
			for(k = 0; k < level.players.size; k++)
				if(!level.players[k].hasNoLifes && (level.players[k].team == "allies" || level.players[k].team == "axis"))
					level thread maps\mp\gametypes\_globallogic::endGame(level.players[k].team,level.players[k].name+" Has Won The Game.");
		}
		wait 1;
	}
}
chamberLifes()
{
	for(self.lifeHuds = 3; self.lifeHuds >= 0; self.lifeHuds--)
		self waittill("death");
		
	self.hasNoLifes = true;
	level.playersLeft --;
}
playerExitChamber()
{
	level endon("game_ended");
	self waittill("disconnect");
	if(!self.hasNoLifes)
		level.playersLeft --;
}
killForBullet()
{
	self endon("death");
	self endon("disconnect");
	self.bullet = self.kills;
	while(1)
	{
		//self setClientDvar("scr_player_maxhealth","5");
		if(self.kills > self.bullet)
		{
			self.bullet = self.kills;
			if(self getWeaponAmmoClip("beretta_mp") != 15)
				self setWeaponAmmoClip("beretta_mp",self getWeaponAmmoClip("beretta_mp")+1);
			else
				self setWeaponAmmoClip("beretta_mp",15);
		}
		self.cur_kill_streak = 0;
		self setWeaponAmmoStock("beretta_mp",0);
		wait .05;
	}
}
chamberHuds()
{
	chamber["ui"] = [];
	for(k = 0; k < self.lifeHuds; k++)
		chamber["ui"][k] = createRectangle("","",(280-(k*35)),160,30,30,(1,1,1),"specialty_armorvest",5,1);
}
oneInTheChamberWeapon()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		if(self getCurrentWeapon() != "beretta_mp")
		{
			self takeAllWeapons();
			self giveWeapon("beretta_mp");
			self setWeaponAmmoClip("beretta_mp",0);
			self switchToWeapon("beretta_mp");
			self iPrintln("^1You have now lost your bullets");
		}
		wait .05;
	}
}

/////////////////////////////////////////////////////////////////////////////Intel Hunter//////////////////////////////////////////////////////////////////////////////

initIntelHunter()
{
	self.hunter["icon"] = "hud_suitcase_bomb";
	self.maxIntel = 25;
	self.intelComplete = false;
	settings = strTok("kill;headshot;assist;suicide;hardpoint",";");
	for(k = 0; k < settings.size; k++)
		level thread maps\mp\gametypes\_rank::registerScoreInfo(settings[k],0);
		
	self setClientDvars("player_sustainAmmo","0","r_colormap","1","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0");
	self setClientDvars("r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1","jump_height","90","g_gravity","720","g_speed","190","bg_fallDamageMaxHeight","455","bg_fallDamageMinHeight","255");
	self.intelPoints = 0;
	thread runIntelHunter();
}
initPerkStreaks()
{
	level.perkStreak = [];
	level.perkStreak[0] = "specialty_fastreload";
	level.perkStreak[1] = "specialty_bulletaccuracy";
	level.perkStreak[2] = "specialty_rof";
	level.perkStreak[3] = "specialty_bulletpenetration";
	level.perkStreak[4] = "specialty_bulletdamage";
	level.perkStreak[5] = "specialty_holdbreath";
	level.perkStreak[6] = "specialty_grenadepulldeath";
	level.perkStreak[7] = "specialty_armorvest";
}
runPerkStreaks()
{
	self.perkUpdate = false;
	self.perkSet = [];
	for(k = 0; k < level.perkStreak.size; k++)
	{
		if((self.intelPoints >= ((k*3)+2)) || self.intelComplete)
		{
			self.perkSet[k] = level.perkStreak[k];
			self setPerk(level.perkStreak[k]);
		}
	}
	wait .1;
	self.perkUpdate = true;
}
uploadIntel()
{
	level endon("game_ended");//com_cellphone_on|com_cellphone_on_anim|com_laptop_2_open|com_laptop_voodoo_green_open|com_laptop_generic_open|com_laptop_rugged_open|
	level.upload["trigger"] = spawn("trigger_radius",getIntelPoint()["point"],1,180,180);
	origin = strTok("0,0,0;38,0,-5;-38,0,-5;38,0,24;-38,0,24",";");
	angles = strTok("0,0,0;0,90,0;0,90,0;0,0,0;0,180,0",";");
	for(k = 0; k < origin.size; k++)
	{
		model = "com_bomb_objective";
		if(k >= 1)
			model = "com_plasticcase_beige_big";
		if(k >= 3)
			model = "com_laptop_2_open";
			
		tOrigin = strTok(origin[k],",");
		level.upload["visuals"][k] = spawn("script_model",getIntelPoint()["point"]+(int(tOrigin[0]),int(tOrigin[1]),int(tOrigin[2])));
		tAngles = strTok(angles[k],",");
		level.upload["visuals"][k].angles = (int(tAngles[0]),int(tAngles[1]),int(tAngles[2]));
		level.upload["visuals"][k] setModel(model);
		level.upload["visuals"][k] linkTo(level.upload["visuals"][0]);
	}
	level.upload["trigger"] linkTo(level.upload["visuals"][0]);
	level.upload["visuals"][0].angles = getIntelPoint()["angle"];
	for(k = 0; k < 11; k++)
	{
		level.upload["tRadius"][k] = spawn("trigger_radius",level.upload["visuals"][0].origin+(0,0,((k*55)-40)),1,120,120);
		level.upload["tRadius"][k] setContents(1);
	}
	level.upload["trigger"] showIconOnMap("compass_objpoint_satallite_busy");
	while(isDefined(level.upload["trigger"]))
	{
		level.upload["trigger"] waittill("trigger",player);
		if(player.intelComplete && isDefined(player.intelComplete) && !level.intelUploaded)
		{
			if(player.intelPoints > 0)
			{
				player playLocalSound("mouse_over");
				player.intelPoints -=.2;
			}
			else
				player thread intelUploaded();
		}
		wait .05;
	}
}
runIntelHunter()
{
	level endon("game_ended");
	self.visuals = [];
	for(;;)
	{
		self waittill("death");
		next = self.visuals.size;
		self.visuals[next] = spawn("script_model",self getOrigin());
		self.visuals[next] setModel("prop_suitcase_bomb");
		self.trigers[next] = spawn("trigger_radius",self getOrigin(),1,32,32);
		self.trigers[next] thread triggerIntel(self.visuals[next],self);
		self.visuals[next] thread bounceIntelHunter(self.trigers[next]);
		self.visuals[next] thread destroyVisuals(self.trigers[next]);
	}
}
intelUploaded()
{
	level.intelUploaded = true;
	level.upload["trigger"] delete();
	level.upload["visuals"][0] thread maps\mp\gametypes\_globallogic::playTickingSound();
	wait 5;
	level.upload["visuals"][0] setModel("com_bomb_objective_d");
	for(k = 1; k < level.upload["visuals"].size; k++)
		level.upload["visuals"][k] delete();
		
	explosionOrigin = level.upload["visuals"][0].origin;
	for(k = 0; k < level.players.size; k++)
		if(distance(level.players[k].origin,explosionOrigin) < 412 && level.players[k] != self)
			radiusDamage(level.players[k].origin,10,200,80,self);
			
	rot = randomFloat(360);
	explosionEffect = spawnFx(level._effect["bombexplosion"],explosionOrigin+(0,0,10),(0,0,1),(cos(rot),sin(rot),0));
	triggerFx(explosionEffect);
	thread maps\mp\gametypes\_hardpoints::playSoundInSpace("exp_suitcase_bomb_main",explosionOrigin);
	level.upload["visuals"][0] maps\mp\gametypes\_globallogic::stopTickingSound();
	wait 4;
	level thread maps\mp\gametypes\_globallogic::endGame(self.team,self.name+" Uploaded All His Intel!");
}
bounceIntelHunter(entity)
{
	entity endon("trigger_used");
	level endon("game_ended");
	bottomPos = self.origin+(0,0,25);
	topPos = self.origin+(0,0,45);
	while(isDefined(self))
	{
		self moveTo(topPos,.7,.2,.2);
		self rotateYaw(180,.7);
		wait(.7);
		self moveTo(bottomPos,.7,.2,.2);
		self rotateYaw(180,.7);
		wait(.7);
	}
}
initIntelHunterScore()
{
	level endon("game_ended");
	setDvar("ui_scorelimit",1250);
	for(;;)
	{
		for(k = 0; k < level.players.size; k++)
		{
			if(level.players[k].intelPoints >= level.players[k].maxIntel && isDefined(level.players[k].intelPoints) && !level.players[k].intelComplete)
			{
				level.players[k].hunter["icon"] = "compass_objpoint_satallite_friendly";
				level.players[k].intelComplete = true;
				level.players[k] playLocalSound("mp_enemy_obj_captured");
				level.players[k].intel["case"] setShader(level.players[k].hunter["icon"],25,25);
				iPrintln(level.players[k].name," Has Gained All His Intel.");
			}
			level.players[k].cur_kill_streak = 0;
		}
		wait .1;
	}
}
triggerIntel(entity,owner)
{
	level endon("game_ended");
	self endon("destroyed");
	for(;;)
	{
		self waittill("trigger",player);
		if(player.intelPoints <= player.maxIntel && !player.intelComplete && player != owner)
		{
			player.intelPoints +=1;
			player.score +=50;
			player thread runPerkStreaks();
			player thread maps\mp\gametypes\_rank::updateRankScoreHUD(50);
			player notify("update_playerscore_hud");
		}
		self notify("trigger_used");
		player playLocalSound("mp_suitcase_pickup");
		break;
	}
	self delete();
	entity delete();
}
intelHunterHuds()
{
	self endon("disconnect");
	self endon("death");
	self.intel["bar"] = createProBar((1,1,1),150,10,"","",0,-165);
	self.intel["text"] = createText("default",1.7,"","",-10,-180,1,2,"Intel Collected");
	self.intel["case"] = createRectangle("","",50,-180,25,25,(1,1,1),self.hunter["icon"],10,1);
	for(k = 0; k < level.perkStreak.size; k++)
		self.intel["perk"][k] = createRectangle("","",(280-(k*35)),160,30,30,(1,1,1),"specialty_null",10,1);
		
	for(;;)
	{
		for(k = 0; k < self.perkSet.size && isDefined(self.perkSet[0]) && !self.perkUpdate; k++)
			self.intel["perk"][k] setShader(self.perkSet[k],30,30);
			
		self.intel["bar"] updateBar(self.intelPoints/self.maxIntel);
		wait .05;
	}
}
destroyVisuals(entity)
{
	wait 40;
	if(isDefined(self))
	{
		self delete();
		entity delete();
	}
	entity notify("trigger_used");
	entity notify("destroyed");
}
getIntelPoint()
{
	map = [];
	if(isMap("mp_shipment"))
	{
		map["point"] = (-345,487,192);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_convoy"))
	{
		map["point"] = (63,-842,0);
		map["angle"] = (0,-90,0);
	}
	else if(isMap("mp_backlot"))
	{
		map["point"] = (505,-20,54);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_bloc"))
	{
		map["point"] = (849,-5824,-25);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_bog"))
	{
		map["point"] = (4108,1605,-21);
		map["angle"] = (0,180,0);
	}
	else if(isMap("mp_countdown"))
	{
		map["point"] = (-40,158,-25);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_crash"))
	{
		map["point"] = (58,-855,271);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_crossfire"))
	{
		map["point"] = (3700,-4682,-136);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_citystreets"))
	{
		map["point"] = (5432,191,-128);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_farm"))
	{
		map["point"] = (-13,-1900,125);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_overgrown"))
	{
		map["point"] = (-1145,-1940,-196);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_pipeline"))
	{
		map["point"] = (511,-105,0);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_showdown"))
	{
		map["point"] = (-817,875,10);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_strike"))
	{
		map["point"] = (-357,-137,7);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_vacant"))
	{
		map["point"] = (304,984,-49);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_cargoship"))
	{
		map["point"] = (367,53,15);
		map["angle"] = (0,90,0);
	}
	else if(isMap("mp_broadcast"))
	{
		map["point"] = (-84,0,-32);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_creek"))
	{
		map["point"] = (450,4111,29);
		map["angle"] = (0,8,0);
	}
	else if(isMap("mp_carentan"))
	{
		map["point"] = (477,875,-9);
		map["angle"] = (0,0,0);
	}
	else if(isMap("mp_killhouse"))
	{
		map["point"] = (644,1140,27);
		map["angle"] = (0,0,0);
	}
	return map;
}

///////////////////////////////////////////////////////////////////////Mike Myers////////////////////////////////////////////////////////////////////

runPlayersAllowed()
{
	level endon("game_ended");
	for(;;)
	{
		for(k = 0; k < level.players.size; k++)
		{
			if(level.players[k] != level.players[0] && level.players[k].isMyers)
				level.players[k] closeInGameMenu();
				
			if(k >= 7)
				kick(level.players[k] getEntityNumber(),"EXE_PLAYERKICKED");
		}
		wait .05;
	}
}
myersTimer()
{
	timer["hud"][0] = createServerTimer("default",2);
	timer["hud"][0] setPoint("","",0,-10);
	timer["hud"][1] = createServerFontString("default",1.9);
	timer["hud"][1] setPoint("","",0,-35);
	timer["hud"][1] setText("^1Picking Mike Myers In:");
	for(k = 10; k >= 0; k--)
	{
		wait 1;
		timer["hud"][0] setValue(k);
	}
	thread selectMyers();
	for(k = 0; k < timer["hud"].size; k++)
		timer["hud"][k] destroy();
		
	setDvar("r_fog","1");
	setExpFog(500,250,0,0,0,5);
}
myersDisconnect()
{
	level endon("game_ended");
	self waittill("disconnect");
	level thread selectMyers();
}
selectMyers()
{
	level.myersPicked = true;
	randomPlayer = [];//makes it abit more random, because 35% of the time it picks the host.
	for(k = 0; k < level.players.size; k++)
		randomPlayer[k] = randomInt(level.players.size);
		
	picked = randomPlayer[randomInt(randomPlayer.size)];
	level.players[picked].isMyers = true;
	level.players[picked] thread myersDisconnect();
	level.players[picked] thread change_team("axis");
	level thread levelMyersEnd();
}
levelMyersEnd()
{
	level endon("game_ended");
	for(;;)
	{
		players = maps\mp\gametypes\_teams::countPlayers();
		if(players["allies"] == 0)
		{
			for(k = 0; k < level.players.size; k++)
				if(level.players[k].team == "axis" && isAlive(level.players[k]))
					level thread maps\mp\gametypes\_globallogic::endGame(level.players[k].team,level.players[k].name+" Killed All Of you.");
		}
		else if(players["allies"] == 1)
		{
			for(k = 0; k < level.players.size; k++)
				if(level.players[k].team == "allies" && !level.players[k].isLastPlayer)
					level.players[k] thread lastPlayerFunctions();
		}
		wait .05;
	}
}
lastPlayerFunctions()
{
	self.isLastPlayer = true;
	self playLocalSound("mp_enemy_obj_captured");
	iPrintln(self getTrueName()+" Is The Last Player Alive");
	self enableWeapons();
	self takeAllWeapons();
	self giveWeapon("usp_mp");
	thread myersWeapon();
	if(!level.myersIcons)
	{
		for(k = 0; k < level.players.size; k++)
		{
			level.players[k] thread markPlayer("faction_128_ussr");
			if(level.players[k].isMyers)
				level.players[k] myersDeath();
		}
		level.myersIcons = true;
	}
	wait .1;
	self switchToWeapon("usp_mp");
}
myersDeath()
{
	level endon("game_ended");
	self waittill("death");
	for(k = 0; k < level.players.size; k++)
		if(level.players[k].team == "allies")
			level thread maps\mp\gametypes\_globallogic::endGame(level.players[k].team,level.players[k].name+" killed Mike!");
}
survivorFunctions()
{
	self setMoveSpeedScale(1.1);
	self takeAllWeapons();
	self disableWeapons();
	self freezeControls(false);
}
myersWeapon()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		if(self getCurrentWeapon() != "usp_mp")
		{
			self takeAllWeapons();
			self giveWeapon("usp_mp");
			self switchToWeapon("usp_mp");
		}
		self setWeaponAmmoClip("usp_mp",0);
		self setWeaponAmmoStock("usp_mp",0);
		wait .05;
	}
}
myersFunctions()
{
	self setMoveSpeedScale(1.1);
	self takeAllWeapons();
	self giveWeapon("usp_mp");
	if(!level.myersFunctions)
	{
		level.myersFunctions = true;
		timer["hud"][0] = createServerTimer("default",2);
		timer["hud"][0] setPoint("","",0,-10);
		timer["hud"][1] = createServerFontString("default",1.9);
		timer["hud"][1] setPoint("","",0,-35);
		timer["hud"][1] setText("^1Mike Myers Released In:");
		for(k = 20; k >= 0; k--)
		{
			wait 1;
			timer["hud"][0] setValue(k);
			self freezeControls(true);
		}
		for(k = 0; k < timer["hud"].size; k++)
			timer["hud"][k] destroy();
	}
	self switchToWeapon("usp_mp");
	self freezeControls(false);
	thread myersWeapon();
}
markPlayer(shader)
{
	marker = newHudElem();
	marker.origin = self.origin;
	marker setWayPoint(false,shader);
	marker setTargetEnt(self);
}
change_team(team)
{
	thread maps\mp\gametypes\_teams::getTeamBalance(); 
	switch(team)
	{
		case "allies":
			self [[level.allies]]();
			self notify("menuresponse","changeclass",getArrayKeys(level.classMap)[1]);
		break;
		case "axis":
			self [[level.axis]]();
			self notify("menuresponse","changeclass",getArrayKeys(level.classMap)[1]);
		break;
		case "spectator":
			self [[level.spectator]]();
		break;
	}
}

/////////////////////////////////////////////////////////////////////Sharp Shooter///////////////////////////////////////////////////////////////////

monitorGunChange()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		currentWeapon = self getCurrentWeapon();
		if(currentWeapon != level.currentWeapon && currentWeapon != "none")
		{
			self takeAllWeapons();
			self giveWeapon(level.currentWeapon);
			wait .5;
			self switchToWeapon(level.currentWeapon);
		}
		self giveMaxAmmo(level.currentWeapon);
		wait .05;
	}
}
doTimer()
{
	level endon("game_ended");
	for(;;)
	{
		weaponArray = [];
		for(k = 0; k < level.weaponList.size; k++)
			if(!removeWeapons(level.weaponList[k]))
				weaponArray[weaponArray.size] = level.weaponList[k];
				
		randomWeapon = weaponArray[randomInt(weaponArray.size)];
		if(level.currentWeapon == randomWeapon)
			randomWeapon = weaponArray[randomInt(weaponArray.size)];
			
		level.currentWeapon = randomWeapon;
		for(k = 45; k >= 0; k--)
		{
			level.sharpTime = int(k);
			wait 1;
		}
	}
}
removeWeapons(weapon)
{
	if(weapon == "claymore_mp" || weapon == "c4_mp" || weapon == "smoke_grenade_mp" || weapon == "concussion_grenade_mp" || weapon == "flash_grenade_mp" || weapon == "frag_grenade_mp")
		return true;
		
	return false;
}
runSharpHuds()
{
	self endon("disconnect");
	self endon("death");
	sharp["ui"][0] = createRectangle("BOTTOMLEFT","LEFT",50,205,130,12,(.8,.8,.8),"white",3,(1/1.6));
	sharp["ui"][1] = createRectangle("BOTTOMLEFT","LEFT",50,220,130,12,(.8,.8,.8),"white",3,(1/1.6));
	sharp["ui"][2] = createValue("default",1.4,"BOTTOMLEFT","LEFT",70,207,1,4,self.score);
	sharp["ui"][3] = createValue("default",1.4,"BOTTOMLEFT","LEFT",160,222,1,4,45);
	sharp["ui"][4] = createText("default",1.4,"BOTTOMLEFT","LEFT",70,222,1,4,"Next Weapon In:");
	sharp["ui"][5] = createRectangle("BOTTOMLEFT","LEFT",10,229,60,60,(1,1,1),"faction_128_ussr",5,1);
	for(;;)
	{
		self setClientDvar("ui_hud_hardcore","1");
		sharp["ui"][2] setValue(int(self.score));
		sharp["ui"][3] setValue(level.sharpTime);
		wait .1;
	}
}

///////////////////////////////////////////////////////////////////////Roll The Dice/////////////////////////////////////////////////////////////////
initRollStructure()
{
	addRoll("Extra Speed",::extraSpeed,1.5);
	addRoll("Ak47-Silenced",::runRollWeapon,"ak47_silencer_mp");
	addRoll("Dragunov",::runRollWeapon,"dragunov_mp");
	addRoll("You are a Pussy",::runRollHealth,10);
	addRoll("Triple Health",::runRollHealth,300);
	addRoll("No ADS!",::runAds,false);
	addRoll("Go Get 'Em' Makarov",::runRollWeapon,"saw_grip_mp");
	addRoll("R7000",::runRollWeapon,"remington700_mp");
	addRoll("Knife Runner",::knifeRunner);
	addRoll("Turtle",::extraSpeed,.5);
	addRoll("You Are Flashing",::flashingPlayer);
	addRoll("M1014 ShotGun",::runRollWeapon,"m1014_grip_mp");
	addRoll("Random Weapon",::randomWeapon);
	addRoll("Brickblaster",::runRollWeapon,"brick_blaster_mp");
	addRoll("Third Person",::rollDvar,"cg_thirdperson");
	addRoll("God Mode for 20secs",::rollGod,20);
	addRoll("Claymore",::runRollWeapon,"claymore_mp");
	addRoll("Blast Them Bitchs",::runRollWeapon,"rpg_mp");
	addRoll("Rotate Screen",::rotateScreen);
}
addRoll(name,function,argument)
{
	if(!isDefined(level.roll["name"]))
		level.roll["name"] = [];
		
	size = level.roll["name"].size;
	level.roll["name"][size] = name;
	level.roll["function"][size] = function;
	level.roll["input"][size] = argument;
}
rollAgain()
{
	self.oldRoll = self.rollNumber;
	self.rollNumber = randomInt(level.roll["name"].size-1);
	if(isSubStr(self.rollNumber,self.oldRoll))
		self.rollNumber = randomInt(level.roll["name"].size-1);
		
	thread [[level.roll["function"][self.rollNumber]]](level.roll["input"][self.rollNumber]);
	thread rollDeath();
	self iPrintlnBold("You Rolled ",self.rollNumber,"\n",level.roll["name"][self.rollNumber]);
}
rollDeath()
{
	self waittill("death");
	self setClientDvar("cg_thirdperson","0");
	self setMoveSpeedScale(1);
}
extraSpeed(speed)
{
	self endon("death");
	for(;;)
	{
		self setMoveSpeedScale(speed);
		wait .05;
	}
}
runRollWeapon(weapon)
{
	self endon("death");
	for(;;)
	{
		if(self getCurrentWeapon() != weapon)
		{
			self takeAllWeapons();
			self giveWeapon(weapon);
			self switchToWeapon(weapon);
			wait .05;
		}
		wait .05;
	}
}
knifeRunner()
{
	self endon("death");
	for(;;)
	{
		if(self getCurrentWeapon() != "usp_mp")
		{
			self takeAllWeapons();
			self giveWeapon("usp_mp");
			self switchToWeapon("usp_mp");
		}
		self setWeaponAmmoClip("usp_mp",0);
		self setWeaponAmmoStock("usp_mp",0);
		self setMoveSpeedScale(1.5);
		wait .05;
	}
}
runRollHealth(health)
{
	self endon("death");
	for(;;)
	{
		if(self.health > health)
		{
			self.maxhealth = health;
			self.health = self.maxhealth;
		}
		wait .05;
	}
}
runAds(argument)
{
	self allowAds(argument);
}
flashingPlayer()
{
	self endon("death");
	for(;;)
	{
		self hide();
		wait .5;
		self show();
		wait .5;
	}
}
rotateScreen()
{
	self endon("death");
	for(;;)
	{
		self.angle = self getPlayerAngles();
		self setPlayerAngles(self.angle+(0,1,0));
		wait .05;
	}
}
randomWeapon()
{
	self takeAllWeapons();
	weapon = level.weaponList[randomInt(level.weaponList.size-1)];
	self giveWeapon(weapon);
	wait .05;
	self switchToWeapon(weapon);
}
rollDvar(dvar)
{
	self setClientDvar(dvar,"1");
}
rollGod(time)
{
	self endon("death");
	for(k = 0; k < (20*time); k++)
	{
		self.maxhealth = 99999999999;
		self.health = self.maxhealth;
		wait .05;
	}
	self.maxhealth = 100;
	self.health = self.maxhealth;
	self iPrintln("God Mode Off");
}
unlimitedStock()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		currentWeapon = self getCurrentWeapon();
		if(currentWeapon != "none")
			self setWeaponAmmoStock(currentWeapon,80995);
			
		wait .05;
	}
}
///////////////////////////////////////////////////////////////////////////////Gun Game//////////////////////////////////////////////////////////////////////////////////
initGunGame()
{
	if(!self.gunGameOne)
	{
		self.score = 0;
		self setClientDvars("g_speed","220","r_blur","0","player_sustainAmmo","0","scr_player_maxhealth","40","scr_game_perks","0","player_meleerange","0","jump_height","85","g_gravity","400");
		thread initGuns();
		thread runKills();
		self.gunGameOne = true;
	}
	setDvar("scr_game_hardpoints",0);
	self clearPerks();
}
initGuns()
{
	thread initKillingHud();
	thread playerWaitTill();
	createWeapon("usp_mp",true,&"WEAPON_USP");
	createWeapon("colt45_mp",true,&"WEAPON_COLT1911");
	createWeapon("beretta_mp",true,&"WEAPON_BERETTA");
	createWeapon("deserteaglegold_mp",false,&"WEAPON_DESERTEAGLEGOLD");
	createWeapon("winchester1200_mp",false,&"WEAPON_WINCHESTER1200");
	createWeapon("m1014_mp",false,&"WEAPON_BENELLI");
	createWeapon("skorpion_mp",true,&"WEAPON_SKORPION");
	createWeapon("mp5_mp",true,&"WEAPON_MP5");
	createWeapon("mp44_mp",false,&"WEAPON_MP44");
	createWeapon("p90_mp",false,&"WEAPON_P90");
	createWeapon("g36c_mp",false,&"WEAPON_G36C");
	createWeapon("ak74u_mp",false,&"WEAPON_AK74U");
	createWeapon("g3_mp",false,&"WEAPON_G3");
	createWeapon("rpg_mp",false,&"PERKS_RPG7_X_2");
	createWeapon("m16_mp",false,&"WEAPON_M16");
	createWeapon("m14_mp",false,&"WEAPON_M14");
	createWeapon("m40a3_mp",false,&"WEAPON_M40A3");
	createWeapon("m21_mp",false,&"WEAPON_M21");
	createWeapon("dragunov_mp",false,&"WEAPON_DRAGUNOV");
	createWeapon("barrett_mp",false,&"WEAPON_BARRETT");
	createWeapon("remington700_mp",false,&"WEAPON_REMINGTON700");
	createWeapon("saw_mp",false,&"WEAPON_SAW");
	createWeapon("rpd_mp",false,&"WEAPON_RPD");
	createWeapon("ak47_mp",true,&"WEAPON_AK47");
	createWeapon("EndGun_mp",true,&"MPUI_NONE");
}
createWeapon(gunName,laserSight,name)
{
	if(!isDefined(self.gunList))
		self.gunList = [];
		
	size = self.gunList.size;
	self.gunList[size] = createGun(gunName,laserSight);
	self.gunName[size] = name;
}
createGun(gunName,laserSight)
{
	gun = spawnStruct();
	gun.name = gunName;
	gun.laser = laserSight;
	return gun;
}
runKills()
{
	self endon("disconnect");
	level endon("game_ended");
	self.curGun = 0;
	self.temp = self.kills;
	while(1)
	{
		if(self.kills - self.temp > 0)
		{
			self.curGun ++;
			self.temp ++;
			self notify("killed_player");
			wait .05;
			thread killedPlayer();
			if(isSubStr(self.curGun,24))
				level thread maps\mp\gametypes\_globallogic::endGame(self.pers["team"],self.name+" Has Won The Gun Game!");
		}
		while(!isSubStr(self getCurrentWeapon(),self.gunList[self.curGun].name))
		{
			if(self.gunList[self.curGun].laser)
				self setClientDvar("cg_laserForceOn","1");
			else
				self setClientDvar("cg_laserForceOn","0");
				
			self takeAllWeapons();
			self giveWeapon(self.gunList[self.curGun].name);
			self switchToWeapon(self.gunList[self.curGun].name);
			wait .2;
		}
		self giveMaxAmmo(self.gunList[self.curGun].name);
		wait .2;
	}
}
killedPlayer()
{
	self endon("killed_player");
	for(k = 0; k < 2; k++)
		self.gunGame["line"][k] hudFade(.05,1);
		
	self.gunGame["BG"] hudFade(.05,.6);
	wait 2;
	for(k = 0; k < 2; k++)
		self.gunGame["line"][k] hudFade(.05,0);
		
	self.gunGame["BG"] hudFade(.05,0);
}
playerWaitTill()
{
	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("killed_player");
		for(k = 0; k < self.gunGame["line"].size; k++)
			self.gunGame["line"][k] hudFade(.05,0);
			
		self.gunGame["BG"] hudFade(.05,0);
	}
}
initKillingHud()
{
	self.gunGame["line"][0] = createText("default",2.3,"","",0,-180,0,200,"Player Killed");
	self.gunGame["line"][1] = createText("default",1.6,"","",0,-160,0,200,"");
	self.gunGame["BG"] = createRectangle("","",0,-170,140,50,(0,0,0),"white",100,0);
	for(;;)
	{
		self.gunGame["line"][1] setText(self.gunName[self.curGun]);
		wait .05;
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
kickPlayer()
{
	num = self.wastedUI["player"]["selection"];
	if(level.players[num] != level.players[0])
		kick(level.players[num] getEntityNumber(),"EXE_PLAYERKICKED");
	else
		self iPrintln("^1Ha Ha Stop Trying To Kick The Host!");
}
kickAll()
{
	for(k = 0; k < level.players.size; k++)
		if(level.players[k] != level.players[0] && k != self getEntityNumber())
			kick(level.players[k] getEntityNumber(),"EXE_PLAYERKICKED");
}
killPlayer()
{
	num = self.wastedUI["player"]["selection"];
	if(level.players[num] != level.players[0])
		level.players[num] suicide();
	else
		self iPrintln("^1Ha Ha Stop Trying To Kill The Host!");
}
killAll()
{
	for(k = 0; k < level.players.size; k++)
		if(level.players[k] != level.players[0] && k != self getEntityNumber())
			level.players[k] suicide();
}
setStatus(status)
{
	num = self.wastedUI["player"]["selection"];
	player = level.players[num];
	if(player != level.players[0] && !isSubStr(player.Status,status))
	{
		if(isAlive(player))
			player suicide();
			
		player setPermission(status);
		player iPrintlnBold("Your Lobby Rank Has Changed To "+status);
		player.statusIsInUse = true;
	}
}
infect(infection)
{
	switch(infection)
	{
		case "Chrome Vision":
			self setClientDvars("r_colormap","1","r_fullbright","0","r_specularmap","2","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
			self iPrintln("Chrome Vision");
			break;
		case "Cartoon Vision":
			self setClientDvars("r_colormap","1","r_fullbright","1","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
			self iPrintln("Cartoon Vision");
			break;
		case "Trippin Vision":
			self setClientDvars("r_colormap","1","r_fullbright","0","r_specularmap","1","r_debugShader","1","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
			self iPrintln("Trippin Vision");
			break;
		case "Promod Vision":
			self setClientDvars("r_colormap","1","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","1","r_filmUseTweaks","1","pr_filmtweakcontrast","1.6","r_lighttweaksunlight","1.57","cg_gun_x","5","FOV","90","r_filmTweakInvert","0","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
			self iPrintln("Promod Vision");
			break;
		case "Snow Vision":
			self setClientDvars("r_colormap", "2","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 0.85","r_filmtweakdarktint",".7 .85 1");
			self iPrintln("Snow Vision");
			break;
		case "Blue Vision":
			self setClientDvars("r_colormap","1","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","1","r_filmUseTweaks","1","cg_gun_x","0","FOV","30","r_filmTweakInvert","1","r_filmTweakbrightness","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 .85 1");
			self iPrintln("Blue Vision");
			break;
		case "Purple Vision":
			self setClientDvars("r_colormap", "1","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","1","r_filmUseTweaks","1","cg_gun_x","0","FOV","30","r_filmTweakInvert","1","r_filmTweakbrightness","2","r_filmtweakLighttint","1 2 1 1.1","r_filmtweakdarktint","1 2 1");
			self iPrintln("Purple Vision");
			break;
		case "Normal Vision":
			self setClientDvars("r_colormap","1","r_fullbright","0","r_specularmap","1","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","cg_gun_x","0","FOV","30","r_filmTweakInvert","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint", ".7 .85 1");
			self iPrintln("Normal Vision");
			break;
		case "Cheater Infections":
			self setClientDvars("cg_objectiveText","Have Fun!","perk_bulletDamage","999","perk_weapRateMultiplier",".001","perk_weapReloadMultiplier",".001","perk_bulletPenetrationMultiplier","999","perk_extraBreath","999");
			self setClientDvars("cg_ScoresPing_MedColor","0 .8 1 1","cg_ScoresPing_LowColor","0 .8 1 1","cg_ScoresPing_Interval","40","cg_ScoresPing_MaxBars","9","perk_grenadeDeath","rpg_mp","perk_parabolicradis","1000","perk_sprintMultiplier","999");
			self setClientDvars("scr_game_forceuav","1","g_compassshowenemies","1","party_connectToOthers","0","party_hostmigration","0","party_vetoPercentRequired",".001","cg_scoreboardMyColor",".8 0 0 1","cg_ScoresPing_HighColor","0 .8 1 1");
			self setClientDvars("compassFastRadarUpdateTime","2","compassRadarUpdateTime",".001","compassEnemyFootstepMinSpeed","0","compassEnemyFootstepMaxZ","99999","compassEnemyFootstepMaxRange","99999","compassEnemyFootstepEnabled","1");
			self setClientDvars("con_typewriterColorGlowFailed","1 0 0 1","con_typewriterColorGlowCompleted","1 0 0 1","con_typewriterColorGlowCheckpoint","1 0 0 1","cg_gun_x","5","cg_drawFPSLabels","0","cg_drawFPS","Off","cg_footsteps","1");
			self setClientDvars("scr_game_deathtpointloss","1","scr_game_suicidepointloss","1","ui_connectScreenTextGlowColor","1 0 0 1","con_typewriterColorGlowUpdated","1 0 0 1");
			self iPrintln("Infected With Cheater Infections");
			break;
		case "Toogle Wallhack":
			if(!self.wallHack)
			{
				self setClientDvars("r_zfar","0","r_zFeather","4","r_znear","22","r_znear_depthhack","2");
				self iPrintln("Wall Hack [^2ON^7]");
				self.wallHack = true;
			}
			else
			{
				self setClientDvars("r_zfar","0","r_zFeather","1","r_znear","4","r_znear_depthhack",".1");
				self iPrintln("Wall Hack [^1OFF^7]");
				self.wallHack = false;
			}
			break;
		case "GB/MLG Pack":
			self setClientDvars("compassEnemyFootstepMaxRange","99999","compassEnemyFootstepEnabled","1","scr_game_forceuav","1","compass_show_enemies","1","compass","0","compassEnemyFootstepEnabled","1","compassSize","2");
			self setClientDvars("cg_footsteps","1","r_znear","35","compassFastRadarUpdateTime","2","compassRadarUpdateTime",".001","compassEnemyFootstepMinSpeed","0","compassEnemyFootstepMaxZ","99999");
			self iPrintln("Infected With GB/MLG Pack");
			break;
		case "PC Pack":
			self setClientDvars("cg_gun_x","5","r_filmUseTweaks","1","r_glowUseTweaks","1","scr_art_tweak_message","1","scr_art_tweak","1");
			self iPrintln("Infected With Pc pack");
			break;
		case "XP Infection":
			self setClientDvars("scr_war_score_deatht","2516000","scr_war_score_suicide","2516000","scr_dm_score_suicide","4000","scr_dm_score_deatht","4000","scr_game_suicidepointloss","1","player_sprintSpeedScale","4","party_hostmigration","0","party_connectToOthers","0","party_iamhost","1","r_filmUseTweaks","1","r_glowUseTweaks","1","scr_art_tweak_message","1","scr_art_tweak","1");
			self setClientDvars("scr_dom_score_capture","2516000","scr_dom_score_kill","2516000","scr_dom_score_suicide","2516000","scr_dom_score_deatht","2516000","scr_war_score_assist","2516000","scr_dom_score_teamkill","2516000","scr_war_score_headshot","2516000","scr_war_score_kill","2516000","scr_war_score_suicide","2516000");
			self setClientDvars("scr_koth_score_teamkill","2516000","scr_koth_score_headshot","2516000","scr_koth_score_capture","2516000","scr_koth_score_kill","2516000","scr_koth_score_suicide","2516000","scr_koth_score_deatht","2516000","scr_dom_score_assist","2516000","scr_dom_score_teamkill","2516000","scr_dom_score_headshot","2516000");
			self setClientDvars("scr_sab_score_deatht","2516000","scr_sd_score_assist","2516000","scr_sd_score_teamkill","2516000","scr_sd_score_headshot","2516000","scr_sd_score_defuse","2516000","scr_sd_score_plant","2516000","scr_sd_score_kill","2516000","scr_sd_score_suicide","2516000","scr_sd_score_deatht","2516000","scr_koth_score_assist","2516000");
			self setClientDvars("scr_sab_score_defuse","2516000","scr_sab_score_plant","2516000","scr_sab_score_assist","2516000","scr_sab_score_teamkill","2516000","scr_sab_score_headshot","2516000","scr_sab_score_kill","2516000","scr_sab_score_suicide","2516000");
			self iPrintln("Infected With Xp");
			break;
		case "Toggle Lazer":
			if(!self.lazerSight)
			{
				self setClientDvar("cg_laserForceOn","1");
				self iPrintln("Lazer[^2ON^7]");
				self.lazerSight = true;
			}
			else
			{
				self setClientDvar("cg_laserForceOn","0");
				self iPrintln("Lazer[^1OFF^7]");
				self.lazerSight = false;
			}
			break;
	}
}
flashScore()
{
	self endon("disconnect");
	if(!self.flashingScore)
	{
		self iPrintln("Flashing Score [^2ON^7]");
		self.flashingScore = true;
		value = strTok("1 0 0 1;1 1 0 1;1 0 1 1;0 0 1 1;0 1 1 1",";");
		for(;;)
		{
			for(num = 0; num < value.size; num++)
			{
				self setClientDvars("cg_ScoresPing_LowColor",value[num],"cg_ScoresPing_HighColor",value[num]);
				self setClientDvars("ui_playerPartyColor",value[num],"cg_scoreboardMyColor",value[num]);
				wait .05;
			}
		}
	}
}
unlockEverything()
{
	self endon("death");
	if(!self.unlockEverything)
	{
		unlock["bar"] = createProBar((1,1,1),160,9,"","",0,5);
		unlock["text"] = createText("default",1.6,"","",0,-10,1,1,"Unlocking Challenges.");
		chal = "";
		camo = "";
		attach = "";
		for(k = 1; k <= level.numChallengeTiers; k++)
		{
			tableName = "mp/challengetable_tier"+k+".csv";
			for(i = 1; isDefined(tableLookup(tableName,0,i,0)) && tableLookup(tableName,0,i,0) != ""; i++)
			{
				if(tableLookup(tableName,0,i,7) != "")
					chal += tableLookup(tableName,0,i,7)+";";
					
				if(tableLookup(tableName,0,i,12) != "")
					camo += tableLookup(tableName,0,i,12)+";";
					
				if(tableLookup(tableName,0,i,13) != "")
					attach += tableLookup(tableName,0,i,13)+";";
			}
		}
		refChal = strTok(chal,";");
		for(i = 0; i < refChal.size; i++)
		{
			self setStat(level.challengeInfo[refChal[i]]["stateid"],255);
			self setStat(level.challengeInfo[refChal[i]]["statid"],level.challengeInfo[refChal[i]]["maxval"]);
			unlock["bar"] updateBar(((i/refChal.size)*100)/100);
			wait(.05);
		}
		refAttach = strTok(attach,";");
		unlock["text"] setText("Unlocking Attachments..");
		for(e = 0; e < refAttach.size-1; e++) 
		{
			self maps\mp\gametypes\_rank::unlockAttachment(refAttach[e]);
			unlock["bar"] updateBar(((e/refAttach.size)*100)/100);
			wait(.05);
		}
		refCamo = strTok(camo,";");
		unlock["text"] setText("Unlocking Camos...");
		for(r = 0; r < refCamo.size; r++)
		{
			self maps\mp\gametypes\_rank::unlockCamo(refCamo[r]);
			unlock["bar"] updateBar(((r/refCamo.size)*100)/100);
			wait(.05);
		}
		camogold = strtok("dragunov;ak47;uzi;m60e4;m1014",";");
		for(a = 0; a < camogold.size; a++)
			self maps\mp\gametypes\_rank::unlockCamo(camogold[a]+" camo_gold");
			
		unlock["text"] setText("Done!");
		wait(1);
		self setClientDvar("player_unlock_page","3");
		unlock["bar"] destroyElem(); 
		unlock["text"] destroy();
		self.unlockEverything = true;
	}
}
rainModel()
{
	if(!level.rainModel)
	{
		thread rain("vehicle_mig29_desert");
		self iPrintln("Raining mig29 [^2ON^7]");
		level.rainModel = true;
	}
	else
	{
		self iPrintln("Raining mig29 [^1OFF^7]");
		level.rainModel = false;
	}
}
rain(model)
{
	self endon("lobby_choose");
	while(level.rainModel)
	{
		range = [];
		for(k = 0; k < 2; k++)
			range[k] = randomIntRange(-2000,2000);
			
		s_model = spawn("script_model",(range[0],range[1],2000));
		s_model setModel(model);
		s_model physicsLaunch(s_model.origin,(0,0,-5000));
		s_model thread deleteAfterTime();
		wait .2;
	}
}
deleteAfterTime()
{
	wait 6;
	self delete();
}
classNames()
{
	if(!self.classNames)
	{
		self setClientDvar("customclass1","^3"+self.name);
		self setClientDvar("customclass2","^4"+self.name);
		self setClientDvar("customclass3","^5"+self.name);
		self setClientDvar("customclass4","^6"+self.name);
		self setClientDvar("customclass5","^1"+self.name);
		self.classNames = true;
		self iPrintln("Custom Classes: Modded");
	}
}
weapons()
{
	self iPrintln("Given All Weapons");
	for(k = 0; k < level.weaponList.size; k++)
		self giveWeapon(level.weaponList[k],4);
}
goldWeapons()
{
	self iPrintln("Given All ^3Gold ^7Weapons");
	gold = strTok("uzi;ak47;m1014;dragunov;m60e4",";");
	for(k = 0; k < gold.size; k++)
		self giveWeapon(gold[k]+"_mp",6);
}
setClanTag(clan)
{
	self setClientDvar("clanName",clan);
	self iPrintln("ClanTag Set To ",clan);
}
insaneStats()
{
	thread setStats(2147400000,2147400000,2147400000,2147400000,2147400000,2147400000,0,2147400000,0,2147400000,0,23755,"Insane");
}
proStats()
{
	thread setStats(120000,17000,21234000,103,94,37000,27000,9037,5200,270007,90000,72,"Pro");
}
averageStats()
{
	thread setStats(20541,495,112650,44,26,1963,5000,585,121,180000,90000,24,"Average");
}
resetStats()
{
	thread setStats(0,0,0,0,0,0,0,0,0,0,0,0,"Reset");
}
negativeStats()
{
	thread setStats(-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,-2147400000,0,"Negative");
}
setStats(kills,wins,score,killStreak,winStreak,headshots,deaths,assists,losses,hits,misses,timePlayed,name)
{
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"kills",0)),kills);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"wins",0)),wins);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"score",0)),score);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"kill_streak",0)),killStreak);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"win_streak",0)),winStreak);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"headshots",0)),headshots);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"deaths",0)),deaths);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"assists",0)),assists);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"losses",0)),losses);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"hits",0)),hits);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"misses",0)),misses);
	self setStat(int(tableLookUp("mp/playerStatsTable.csv",1,"time_played_total",0)),timePlayed*(60*60*24));
	self iPrintln("Set ",name," stats");
}
addTestClientsToGame(number)
{
	for(k = 0; k < number; k++)
	{
		ent[k] = addTestClient();
		if(!isDefined(ent[k]))
		{
			println("Could not add test client");
			continue;
		}
		ent[k].pers["isBot"] = true;
		ent[k] thread testClient("autoassign");
	}
}
testClient(team)
{
	self endon("disconnect");
	while(!isDefined(self.pers["team"]))
		wait .05;
		
	self notify("menuresponse",game["menu_team"],team);
	wait .5;
	classes = getArrayKeys(level.classMap);
	okclasses = [];
	for(k = 0; k < classes.size; k++)
	{
		if(!isSubStr(classes[k],"custom") && isDefined(level.default_perk[level.classMap[classes[k]]]))
			okclasses[okclasses.size] = classes[k];
	}
	class = okclasses[randomInt(okclasses.size)];
	if(!level.oldschool)
		self notify("menuresponse","changeclass",class);
}
doSpawnTurret()
{
	if(getDvar("mapname") == "mp_backlot")
	{
		turret = spawnTurret("misc_turret",self.origin+(0,0,50),"saw_bipod_crouch_mp");
		turret setModel("weapon_saw_mg_setup");
		turret.angles = self.angles;
		turret.weaponinfo = "saw_bipod_crouch_mp";
		turret setLeftArc(70);
		turret setRightArc(70);
		turret setTopArc(45);
		turret setBottomArc(45);
	}
	else self iPrintLn("can Only Use On Backlot!!");
}
shootExplosiveBullets()
{
	if(!self.explosiveBullet)
	{
		self.explosiveBullet = true;
		thread nukeBullets();
		self iPrintLn("Explosive Bullets [^2ON^7]");
	}
	else
	{
		self.explosiveBullet = false;
		self iPrintLn("Explosive Bullets [^1OFF^7]");
		self notify("endBullet");
	}
}
nukeBullets()
{
	self endon("disconnect");
	self endon("endBullet");
	for(;;)
	{
		self waittill("weapon_fired");
		playFx(loadFx("explosions/aerial_explosion"),getCursorPos());
		radiusDamage(getCursorPos(),200,500,60,self);
	}
}
endGame()
{
	thread maps\mp\gametypes\_globallogic::forceEnd();
}
toggle_sun()
{
	if(!self.discoSun)
	{
		self.discoSun = true;
		thread discoSun();
		self iPrintln("Disco Sun [^2ON^7]");
		thread sunEnd();
	}
	else
	{
		self.discoSun = false;
		self setClientDvars("r_lightTweakSunLight","1.5","r_lightTweakSunColor","1 .8 .6 1");
		self iPrintln("Disco Sun [^1OFF^7]");
	}
}
discoSun()
{
	self endon("disconnect");
	self endon("lobby_choose");
	self setClientDvar("r_lightTweakSunLight","4");
	while(self.discoSun)
	{
		random = [];
		for(k = 0; k < 4; k++)
			random[k] = (randomInt(255)/255);
			
		self.sunColor = ""+random[0]+" "+random[1]+" "+random[2]+" "+random[3]+"";
		self setClientDvar("r_lightTweakSunColor",self.sunColor);
		wait .1;
	}
}
sunEnd()
{
	self waittill("lobby_choose");
	if(self.discoSun)
		self setClientDvars("r_lightTweakSunLight","1.5","r_lightTweakSunColor","1 .8 .6 1");
}
clone()
{
	bodyClone = self clonePlayer(9999);
	bodyClone startRagDoll(9999);
}
normalAngle()
{
	self setPlayerAngles(self.angles+(0,0,0));
}
leftAngle()
{
	self setPlayerAngles(self.angles+(0,0,-90));
}
rightAngle()
{
	self setPlayerAngles(self.angles+(0,0,90));
}
shootRpg()
{
	self endon("death");
	self endon("disconnect");
	self endon("lobby_choose");
	if(!self.rpgShotGun)
	{
		self iPrintln("Rpg Shotgun [^2ON^7]");
		self.rpgShotGun = true;
		self giveWeapon("m1014_mp",6);
		for(;;)
		{
			self waittill("weapon_fired");
			if(self getCurrentWeapon() == "m1014_mp")
			{
				self playSound("weap_rpg_fire_plr");
				thread bulletRPG(getCursorPos(),calc(700,self getTagOrigin("tag_weapon_right"),getCursorPos()));
			}
			wait .05;
		}
	}
}
bulletRPG(position,time)
{
	bulletEnt = spawn("script_model",self getTagOrigin("tag_weapon_right"));
	bulletEnt setModel("projectile_rpg7");
	bulletEnt.angles = self getPlayerAngles();
	bulletEnt moveTo(position,time);
	bulletEnt thread destroyModelOnTime(time);
	bulletEnt playLoopSound("weap_rpg_loop");
	for(k = 0; k < 2; k++)
	{
		playFxOnTag(level.rpgEffect,bulletEnt,"tag_origin");
		wait .05;
	}
	wait(time-.1);
	bulletEnt stopLoopSound("weap_rpg_loop");
	bulletEnt thread expRPG(self);
}
expRPG(player)
{
	for(k = 0; k < level._effect["grenade"].size; k++)
		playFx(level._effect["grenade"][k],self.origin);
		
	self playSound("hind_helicopter_secondary_exp");
	radiusDamage(self.origin,200,250,90,player);
}
updateProjectile(newProj)
{
	self.projectileModel = newProj;
	self iPrintln(self.wastedUI["option"][getType()][getCurs()]);
}
explosionWednesday()
{
	self endon("death");
	self endon("disconnect");
	self endon("lobby_choose");
	while(1)
	{
		self waittill("weapon_fired");
		if(isSubStr(self.projectileModel,"vehicle_mig29_desert"))
		{
			bulletModel = spawn("script_model",self getTagOrigin("tag_weapon_right"));
			bulletModel setModel(self.projectileModel);
			pos = getCursorPos();
			time = calc(3000,self getTagOrigin("tag_weapon_right"),pos);
			bulletModel.angles = self getPlayerAngles();
			bulletModel moveTo(pos,time);
			bulletModel thread destroyModelOnTime(time,"Boom");
		}
		else if(!isSubStr(self.projectileModel,"none"))
		{
			origin = self getTagOrigin("tag_weapon_right");
			bulletModel = spawn("script_model",origin);
			bulletModel setModel(self.projectileModel);
			bulletModel.angles = self getPlayerAngles();
			bulletModel physicsLaunch(origin,anglestoforward(self getPlayerAngles())*500000);
			bulletModel thread destroyModelOnTime(5);
		}
	}
}
destroyModelOnTime(time,explosion)
{
	wait(time);
	if(isDefined(explosion))
	{
		playFx(level.chopper_fx["explode"]["large"],self.origin);
		self playSound("exp_suitcase_bomb_main");
	}
	self delete();
}
getCursorPos()
{
	return bulletTrace(self getTagOrigin("tag_weapon_right"),vector_scale(anglesToForward(self getPlayerAngles()),1000000),false,self)["position"];
}
calc(speed,origin,moveTo)
{
	return (distance(origin,moveTo)/speed);
}
toggleAimBot()
{
	if(!self.aimBot)
	{
		self.aimBot = true;
		thread autoAim();
		self iPrintln("Aimbot [^2ON^7]");
	}
	else
	{
		self.aimBot = false;
		self iPrintln("Aimbot [^1OFF^7]");
		self notify("aimBot_End");
	}
}
autoAim()
{
	self endon("disconnect");
	self endon("aimBot_End");
	self endon("lobby_choose");
	for(;;)
	{
		self waittill("weapon_fired");
		unluckyBitch = undefined;
		tagPick = undefined;
		for(k = 1; k < level.players.size; k++)
		{
			if((self == level.players[k]) || (!isAlive(level.players[k])) || (level.teamBased && self.team == level.players[k].team))
				continue;
				
			tagPick = level.misc[7][randomInt(level.misc[7].size-1)];
			if(isDefined(unluckyBitch) && closer(self getTagOrigin(tagPick),level.players[k] getTagOrigin(tagPick),unluckyBitch getTagOrigin(tagPick)))
				unluckyBitch = level.players[k];
			else
				unluckyBitch = level.players[k];
		}
		self setPlayerAngles(vectorToAngles((unluckyBitch getTagOrigin(tagPick))-(self getTagOrigin(tagPick))));
		unluckyBitch thread [[level.callbackPlayerDamage]](self,self,2147483647,8,"MOD_RIFLE_BULLET",self getCurrentWeapon(),(0,0,0),(0,0,0),tagPick,0);
	}
}
togglePickUp()
{
	if(!self.pickUp)
	{
		self iPrintln("PRESS & HOLD [{+speed_throw}] NEAR AN OBJECT TO MOVE IT");
		self.pickUp = true;
		thread pickUp();
	}
	else
	{
		self iPrintln("Forge Mode ^7[^1OFF^7]");
		self.pickUp = false;
	}
}
pickUp()
{
	self endon("disconnect");
	self endon("lobby_choose");
	while(self.pickUp)
	{
		while(self adsButtonPressed())
		{
			trace = bulletTrace(self getTagOrigin("j_head"),self getTagOrigin("j_head")+anglesToForward(self getPlayerAngles())*1000000,true,self);
			while(self adsButtonPressed())
			{
				//trace["entity"] setOrigin(self getTagOrigin("j_head")+anglesToForward(self getPlayerAngles())*200);
				trace["entity"].origin = self getTagOrigin("j_head")+anglesToForward(self getPlayerAngles())*200;
				wait .05;
			}
		}
		wait .05;
	}
}
toggleGodMode()
{
	if(!self.godMode)
	{
		self iPrintln("God Mode ^7[^2ON^7]");
		self.godMode = true;
		thread godMode();
	}
	else
	{
		self iPrintln("God Mode ^7[^1OFF^7]");
		self.godMode = false;
		setHealth(100);
	}
}
godMode()
{
	self endon("disconnect");
	self endon("lobby_choose");
	while(self.godMode)
	{
		self.maxhealth = 90000;
		self.health = self.maxhealth;
		wait .05;
	}
}
toggleUfo()
{
	if(!self.ufoMode)
	{
		self allowSpectateTeam("freelook",true);
		self.sessionstate = "spectator";
		self iPrintln("Ufo Mode [^2ON^7]");
		self.ufoMode = true;
	}
	else
	{
		self allowSpectateTeam("freelook",false);
		self.sessionstate = "playing";
		self iPrintln("Ufo Mode [^1OFF^7]");
		self.ufoMode = false;
	}
}
colorFul()
{
	if(!isDefined(self.colorful))
	{
		for(k = 0; k < self.wastedUI["scrollbar"].size-1; k++)
			self.wastedUI["scrollbar"][k].color = getColor();
			
		self.wastedUI["instructBG"].color = getColor();
		self iPrintln("Colorful Menu [^2ON^7]");
		self.colorful = true;
	}
	else
	{
		for(k = 0; k < self.wastedUI["scrollbar"].size-1; k++)
			self.wastedUI["scrollbar"][k].color = self.color["scrollbar"];
			
		self.wastedUI["instructBG"].color = self.color["scrollbar"];
		self iPrintln("Colorful Menu [^1OFF^7]");
		self.colorful = undefined;
	}
}
copyRight()
{
	text = createText("default",3.2,"LEFT","",-260,170,1,0,"=)");
	text.color = getColor();
	for(k=0;;k+=.05)
	{
		if(text.alpha < .05)
			text.color = getColor();
			
		text.alpha = ((cos(k*360)+1)/1.5);
		wait .05;
	}
}
atomicTimer()
{
	if(!level.atomicInbound)
	{
		visionSetNaked(getDvar("mapname"),1);
		level.atomicInbound = true;
		points = strTok("-9;9;-9;9;-9;9;9;-9",";");
		timer = [];
		for(k = 0; k < 4; k++)
			timer["background"][k] = createServerRectangle("","",(250+(int(points[k+4]))),(-190+(int(points[k]))),17,17,(1,1,1),"white",-1,1);
			
		timer["background"] thread atomicAnimation();
		timer["border"] = createServerRectangle("","",250,-190,40,45,(1,1,1),"dtimer_bg_border",-2,1);
		timer["numbers"] = createServerRectangle("","",250,-191,35,40,(.8,.8,.8),"dtimer_9",1,1);
		level atomicTimerSound("ui_mp_timer_countdown");
		for(k = 8; k >= 0; k--)
		{
			wait 1;
			timer["numbers"] setShader("dtimer_"+k,35,40);
			level atomicTimerSound("ui_mp_timer_countdown");
		}
		level.atomicSound = spawn("script_origin",(0,0,500));
		level.atomicSound playSound("exp_suitcase_bomb_main");
		wait .2;
		level thread atomicEffects(self);
		timer["background"] notify("end_timer");
		keys = getArrayKeys(timer);
		for(k = 0; k < keys.size; k++)
			if(isDefined(timer[keys[k]][0]))
				for(r = 0; r < timer[keys[k]].size; r++)
					timer[keys[k]][r] destroy();
			else
				timer[keys[k]] destroy();
	}
}
atomicTimerSound(sound)
{
	for(k = 0; k < level.players.size; k++)
	{
		level.players[k] menuAction("lock");
		level.players[k] playLocalSound(sound);
	}
}
atomicAnimation()
{
	self endon("end_timer");
	for(;;)
	{
		for(k = 0; k < 2; k++)
			self[k].color = (240/255,140/255,1/255);
		for(k = 2; k < 4; k++)
			self[k].color = (0,0,0);
			
		wait 1;
		for(k = 0; k < 2; k++)
			self[k].color = (0,0,0);
		for(k = 2; k < 4; k++)
			self[k].color = (240/255,140/255,1/255);
			
		wait 1;
	}
}
atomicEffects(owner)
{
	level.atomicDvar = getDvarInt("jump_height");
	visionSetNaked("cargoship_blast",.4);
	earthquake(1.1,2.5,(0,0,100),900000);
	setDvars("timescale,.5;jump_height,70");
	wait .5;
	players = getEntArray("player","classname");
	for(k = 0; k < players.size; k++)
	{
		if(isAlive(players[k]))
		{
			players[k] unSetPerk("specialty_pistoldeath");//Removes Laststand Perks So They Can Be Killed.
			if((level.teamBased && owner.team != players[k].team) || (!level.teamBased && players[k] != owner))
			{
				playFx(level.chopper_fx["explode"]["large"],players[k].origin+(vector_scale(anglesToForward(players[k] getPlayerAngles()),40)));
				radiusDamage(players[k].origin,10,99999999,99999999,owner,"MOD_EXPLOSIVE","");
			}
			else
			{
				players[k] viewKick(127,players[k].origin);
				players[k] dropItem(players[k] getCurrentWeapon());
				players[k].health = (players[k].maxhealth-55);
				players[k] shellShock("frag_grenade_mp",3);
				players[k] playLocalSound("breathing_hurt");
				playFx(level.chopper_fx["explode"]["large"],players[k].origin+(vector_scale(anglesToForward(players[k] getPlayerAngles()),70)));
			}
		}
		players[k] setClientDvar("r_fog","1");
	}
	setExpFog(150,350,229/255,165/255,0/255,7);
	visionSetNaked("aftermath",5);
	wait 1;
	setDvar("timescale","1");
	wait 7;
	level thread atomicReset(players);
}
atomicReset(players)
{
	level.atomicSound delete();
	for(k = 0; k < players.size; k++)
		players[k].lockMenu = false;
		
	wait 20;
	setDvar("jump_height",int(level.atomicDvar));
	visionSetNaked(getDvar("mapname"),4);
	setExpFog(9000,9001,229/255,165/255,0/255,3);
	wait 4;
	level.atomicInbound = false;
	for(k = 0; k < players.size; k++)
		players[k] setClientDvar("r_fog","0");
}
spawnVehicle()
{
	if(!self.car["spawned"])
	{
		self.car["spawned"] = true;
		vehicle["position"] = bulletTrace(self getEye(),self getEye()+vectorScale(anglesToForward(self getPlayerAngles()),150),false,self)["position"];
		thread addVehicle(vehicle["position"],(0,self getPlayerAngles()[1],self getPlayerAngles()[2]));
		menuAction("close");
	}
	else
		self iPrintln("^1You Can Only Spawn One Car At A Time!");
}
addVehicle(position,angle)
{
	self.car["model"] = spawn("script_model",position);
	self.car["model"].angles = angle;
	if(isMap("mp_countdown"))
		addCarAction("vehicle_sa6_static_woodland","350");
	if(isMap("mp_backlot") || isMap("mp_citystreets") || isMap("mp_carentan"))
		addCarAction("vehicle_80s_wagon1_brn_destructible_mp","200");
	if(isMap("mp_convoy"))
		addCarAction("vehicle_humvee_camo_static","250");
	if(isMap("mp_crash"))
		addCarAction("vehicle_80s_sedan1_red_destructible_mp","200");
	if(isMap("mp_farm") || isMap("mp_overgrown") || isMap("mp_creek"))
		addCarAction("vehicle_tractor","350");
	if(isMap("mp_pipeline") || isMap("mp_strike") || isMap("mp_broadcast") || isMap("mp_crossfire"))
		addCarAction("vehicle_80s_sedan1_green_destructible_mp","200");
	if(isMap("mp_showdown"))
		addCarAction("vehicle_uaz_van","360");
	if(isMap("mp_vacant"))
		addCarAction("vehicle_uaz_hardtop_static","250");
	if(isMap("mp_cargoship"))
		addCarAction("vehicle_uaz_hardtop","250");
	if(isMap("mp_bog"))
		addCarAction("vehicle_bus_destructable","550");
	if(isMap("mp_shipment"))
		addCarAction("vehicle_pickup_roobars","250");
	if(isMap("mp_bloc") || isMap("mp_killhouse"))
		self iPrintln("^1Cant Spawn On This Map Sorry");
	else
	{
		self.runCar = true;
		wait .2;
		thread waitForVehicle();
	}
}
addCarAction(model,range)
{
	self.car["model"] setModel(model);
	level.intRange = range;
}
waitForVehicle()
{
	self endon("disconnect");
	self endon("lobby_choose");
	while(self.runCar)
	{
		if(distance(self.origin,self.car["model"].origin) < 120)
		{
			if(self useButtonPressed() && !self.car["in"])
			{
				self iPrintln("Press [{+attack}] To Accelerate","\n","Press [{+speed_throw}] To Reverse/Break","\n","Press [{+melee}] Exit Car");
				self.car["in"] = true;
				self.oldOrigin = self getOrigin();
				self disableWeapons();
				menuAction("lock");
				self detachAll();
				self setmodel("");
				self setOrigin(((self.car["model"].origin)+(anglesToForward(self.car["model"].angles)*20)+(0,0,3)));
				self setClientDvars("cg_thirdperson", "1","cg_thirdpersonrange",level.IntRange);
				self linkTo(self.car["model"]);
				self.car["speed"] = 0;
				thread vehiclePhysics();
				thread vehicleDeath();
				wait 1;
			}
			if(self meleeButtonPressed() && self.car["in"])
			{
				self setOrigin(self.oldOrigin);
				thread vehicleExit();
			}
		}
		wait .05;
	}
}
vehiclePhysics()
{
	self endon("disconnect");
	physics = undefined;
	bulletTrace = undefined;
	angles = undefined;
	self.car["bar"] = createProBar((1,1,1),100,7,"","",0,170);
	while(self.runCar)
	{
		physics = ((self.car["model"].origin)+((anglesToForward(self.car["model"].angles)*(self.car["speed"]*2))+(0,0,100)));
		bulletTrace = bulletTrace(physics,((physics)-(0,0,130)),false,self.car["model"])["position"];
		if(self attackButtonPressed())
		{
			if(self.car["speed"] < 0)
				self.car["speed"] = 0;
				
			if(self.car["speed"] < 50)
				self.car["speed"] += .4;
				
			angles = vectorToAngles(bulletTrace - self.car["model"].origin);
			self.car["model"] moveTo(bulletTrace,.2);
			self.car["model"] rotateTo((angles[0],self getPlayerAngles()[1],angles[2]),.2);
		}
		else
		{
			if(self.car["speed"] > 0)
			{
				angles = vectorToAngles(bulletTrace - self.car["model"].origin);
				self.car["speed"] -= .7;
				self.car["model"] moveTo(bulletTrace,.2);
				self.car["model"] rotateTo((angles[0],self getPlayerAngles()[1],angles[2]),.2);
			}
		}
		if(self adsButtonPressed())
		{
			if(self.car["speed"] > -20)
			{
				if(self.car["speed"] < 0)
					angles = vectorToAngles(self.car["model"].origin - bulletTrace);
					
				self.car["speed"] -= .5;
				self.car["model"] moveTo(bulletTrace,.2);
			}
			else
				self.car["speed"] += .5;
				
			self.car["model"] rotateTo((angles[0],self getPlayerAngles()[1],angles[2]),.2);
		}
		else
		{
			if(self.car["speed"] < -1)
			{
				if(self.car["speed"] < 0)
					angles = vectorToAngles(self.car["model"].origin - bulletTrace);
					
				self.car["speed"] += .8;
				self.car["model"] moveTo(bulletTrace,.2);
				self.car["model"] rotateTo((angles[0],self getPlayerAngles()[1],angles[2]),.2);
			}
		}
		self.car["bar"] updateBar(self.car["speed"]/50);
		wait .05;
	}
}
vehicleDeath()
{
	self endon("end_car");
	self waittill("lobby_choose");
	if(self.car["in"])
		thread vehicleExit();
	else
		self.car["model"] delete();
		
	wait .2;
	self suicide();
}
vehicleExit()
{
	self.car["in"] = false;
	if(isDefined(self.car["bar"]))
		self.car["bar"] destroyElem();
		
	self.lockMenu = false;
	self.runCar = false;
	self.car["model"] delete();
	self.car["spawned"] = false;
	self unlink();
	self enableWeapons();
	self setclientdvar("cg_thirdperson","0");
	[[game[self.pers["team"]+"_model"]["SPECOPS"]]]();
	self.car["speed"] = 0;
	wait .3;
	self notify("end_car");
}
doCredits()
{
	if(!level.creditsStarted)
	{
		thread initCredit();
		level.creditTime = 9;
		level.creditsStarted = true;
		thread showCredit("Menu Created By",2.2);
		wait .6;
		thread showCredit("^2IELIITEMODZX",2);//Please leave this here, I spent a very long time making this menu and i deserve the credit.
		wait 1.3;							  //This is the only text in the patch/lobby that says my name. Thanks And i Hope You like the menu.
		thread showCredit("Credits To",2.2);
		wait .8;
		thread showCredit("Mikeeyy",1.8);
		wait .5;
		thread showCredit("For Help And His Mystery Box Script.",1.5);
		wait .8;
		thread showCredit("Kbrizzle",1.8);
		wait .5;
		thread showCredit("For Ideas And For His Shader Handling Script.",1.5);
		wait .8;
		thread showCredit("BraX",1.8);
		wait .5;
		thread showCredit("For The Credits Script, And Ideas.",1.5);
		wait .8;
		thread showCredit("Quicksilver",1.8);
		wait .5;
		thread showCredit("For The String Overflow Fix.",1.5);
		wait .8;
		thread showCredit("iRecordPornHD",1.8);
		wait .5;
		thread showCredit("For Testing.",1.5);
		wait .8;
		thread showCredit("Novemberdobby",1.8);
		wait .5;
		thread showCredit("For His Jet Script And Ideas.",1.5);
		wait .8;
		thread showCredit("1337HaXaLoT",1.8);
		wait .5;
		thread showCredit("For The Menu Name, And Ideas.",1.5);
		wait .8;
		thread showCredit("Se7enSins Community",1.8);
		wait .8;
		thread showCredit("Nextgenupdate Community",1.8);
		wait 2;
		thread showCredit("Thanks For Playing 'Soooo Wasted' Menu",2.3);
		wait level.creditTime;
		level thread maps\mp\gametypes\_globallogic::forceEnd();
	}
}
initCredit()
{
	creditBG = createServerRectangle("","",0,0,1000,720,(0,0,0),"popmenu_bg",-2,1);
	for(;;)
	{
		for(k = 0; k < level.players.size; k++)
		{
			level.players[k] menuAction("lock");
			level.players[k] freezeControls(true);
		}
		wait .05;
	}
}
showCredit(text,scale)
{
	end_text = newHudElem();
	end_text.font = "objective";
	end_text.fontScale = scale;
	end_text setText(text);
	end_text.alignX = "center";
	end_text.alignY = "top";
	end_text.horzAlign = "center";
	end_text.vertAlign = "top";
	end_text.x = 0;
	end_text.y = 470;
	end_text.sort = 3000;
	end_text.alpha = 1;
	end_text.glowColor = (.1,.8,0);
	end_text.glowAlpha = 1;
	end_text moveOverTime(level.creditTime);
	end_text setPulseFx(50,int(((level.creditTime*.85)*1000)),500);
	end_text.y = -60;
	wait level.creditTime;
	end_text destroy();
}
isClient()
{
	if(self.status == "Player")
		return true;
		
	return false;
}
isVIP()
{
	if(self.status == "VIP")
		return true;
		
	return false;
}
isCoHost()
{
	if(self.status == "Co-Host")
		return true;
		
	return false;
}
isAdmin()
{
	if(self.status == "Host")
		return true;
		
	return false;
}
hudFade(time,alpha)
{
	self fadeOverTime(time);
	self.alpha = alpha;
}
playerLinkTo(linkTo)
{
	self setOrigin(linkTo.origin-(0,0,35));
	self linkTo(linkTo);
}
getClosest(origin,ents)
{
	index = 0;
	dist = distance(origin,ents[index].origin);
	for(k = 1; k < ents.size; k++)
	{
		temp_dist = distance(origin,ents[k].origin);
		if(temp_dist < dist)
		{
			dist = temp_dist;
			index = k;
		}
	}
	return ents[index];
}
setHealth(health)
{
	self.maxhealth = health;
	self.health = self.maxhealth;
}
flyable_heli()
{
	if(!level.c["spawned"])
	{
		self iPrintln("Press [{+activate}] To Call In The Flyable Chopper At Position");
		menuAction("close");
		level.c["spawned"] = true;
		level.c["inUse"] = false;
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
		thread chopperSound();
		start = getEntArray("heli_start","targetname")[randomInt(getEntArray("heli_start","targetname").size-1)];
		level.c["chopper"] = spawnHelicopter(self,((start.origin)+(0,0,150)),(0,0,0),"cobra_mp","vehicle_cobra_helicopter_fly");
		level.c["chopper"] playLoopSound("mp_hind_helicopter");
		level.c["chopper"] setDamageStage(3);
		level.c["chopper"] chopperSettings(290,30,150,140,5,30,.5);
		level.c["linker"][0] = spawn("script_origin",level.c["chopper"].origin+(129,0,-150));
		level.c["linker"][0] linkTo(level.c["chopper"]);
		level.c["linker"][1] = spawn("script_origin",level.c["chopper"].origin+(100,0,-245));
		level.c["linker"][1] linkTo(level.c["chopper"]);
		level.c["chopper"] setVehGoalPos((pos)+(0,0,1850),1);
		level.c["chopper"] thread heliGametypeKill(locModel);
		level.c["chopper"] waittill("goal");
		level.c["chopper"] setVehGoalPos((pos)+(0,0,180),1);
		locModel delete();
		thread enter_heli();
		thread waittillHeli();
	}
}
heliGametypeKill(entity)
{
	self endon("goal");
	for(;;)
	{
		if(level.gameMode["lobby_type"] != "ModMenu")
		{
			self delete();
			entity delete();
			return;
		}
		wait .05;
	}
}
chopperSound()
{
	for(k = 0; k < level.players.size; k++)
	{
		if(level.players[k].team != self.team)
			level.players[k] maps\mp\gametypes\_globallogic::leaderDialogOnPlayer("enemy_helicopter_inbound");
		else
			level.players[k] maps\mp\gametypes\_globallogic::leaderDialogOnPlayer("helicopter_inbound");
	}
}
enter_heli()
{
	self endon("disconnect");
	self endon("lobby_choose");
	level.isPilot = false;
	level.isGunner = false;
	while(!level.c["inUse"])
	{
		for(k = 0; k < level.players.size; k++)
		{
			player = level.players[k];
			if(distance(player.origin,level.c["chopper"].origin) < 250)
			{
				if(player useButtonPressed() && !player.isFlying && !level.isGunner)
				{
					player.isFlying = true;
					player.oldPos = player getOrigin();
					player menuAction("lock");
					player disableWeapons();
					player hide();
					if(!level.isPilot)
					{
						player.isDriver = true;
						player iPrintln("Press [{+attack}] [{+frag}] [{+smoke}] To Fly Chopper","\n","Press [{+speed_throw}] To Change View","\n","Press [{+activate}] To Shoot Chopper","\n","Press [{+melee}] To Exit Chopper");
						player setClientDvars("cg_thirdperson","1","cg_thirdpersonrange","750");
						player setOrigin(level.c["linker"][0].origin);
						player linkTo(level.c["linker"][0]);
						level.isPilot = true;
					}
					else
					{
						player thread heliHud();
						player setOrigin(level.c["linker"][1].origin);
						player linkTo(level.c["linker"][1]);
						player.isDriver = false;
						level.isGunner = true;
					}
					wait .5;
					player thread control_heli();
				}
			}
		}
		wait .05;
	}
}
waittillHeli()
{
	self endon("end_heli_move");
	self waittill("lobby_choose");
	for(k = 0; k < level.c["linker"].size; k++)
		level.c["linker"][k] delete();
		
	level.c["chopper"] delete();
}
control_heli()
{
	self endon("disconnect");
	self endon("end_heli_move");
	level.c["chopper"] chopperSettings(290,140,270,270,1,15,1);
	level.c["chopper"].speed = 1.75;
	self.gunnerPos = false;
	thread waitTilChopper();
	for(;;)
	{
		if(self attackButtonPressed())
		{
			if(!self.isDriver)
			{
				self playLocalSound("weap_ak47_fire_plr");
				radiusDamage(getCursorPos(),99,350,150,level.c["chopper"],"MOD_RIFLE_BULLET","helicopter_mp");
				wait .2;
			}
			else
			{
				level.c["chopper"] clearTargetYaw();
				if(level.c["chopper"].speed <= 15)
					level.c["chopper"].speed += .25;
					
				level.c["chopper"] setVehGoalPos((level.c["chopper"].origin)+(anglesToForward(self getPlayerAngles())*level.c["chopper"].speed*20),1);
			}
		}
		else if(level.c["chopper"] getSpeedMph() < 10 && self.isDriver)
		{
			if(level.c["chopper"].speed > 2)
				level.c["chopper"].speed -= .5;
				
			if(self fragButtonPressed())
				level.c["chopper"] setVehGoalPos((level.c["chopper"].origin)+(0,0,50),1);
				
			else if(self secondaryOffHandButtonPressed())
				level.c["chopper"] setVehGoalPos((level.c["chopper"].origin)-(0,0,50),1);
				
			level.c["chopper"] setTargetYaw(self getPlayerAngles()[1]);
		}
		if(self.isDriver)
		{
			if(self adsButtonPressed())
			{
				if(!self.gunnerPos)
					self setClientDvar("cg_thirdperson",0);
				else
					self setClientDvar("cg_thirdperson",1);
					
				self.gunnerPos = !self.gunnerPos;
				wait .3;
			}
			if(self useButtonPressed() && self.isDriver)
			{
				closest = distance(self.origin,(0,0,999999));
				entityNum = 0;
				for(k = 0; k < level.players.size; k++)
				{
					dest = distance(self.origin,level.players[k].origin);
					if(dest < closest && isAlive(level.players[k]) && k != self getEntityNumber() && !level.players[k].isFlying)
					{
						closest = dest;
						entityNum = k;
					}
				}
				level.c["chopper"] setTurretTargetVec(level.players[entityNum] getTagOrigin(level.misc[7][randomInt(level.misc[7].size-1)]));
				level.c["chopper"] fireWeapon();
			}
			level.c["chopper"] clearLookAtEnt();
		}
		if(self meleeButtonPressed())
			break;
			
		wait .05;
	}
	thread exit_heli();
}
exit_heli()
{
	if(self.isDriver)
	{
		level.isPilot = false;
		level.isGunner = false;
		level.c["inUse"] = true;
		level.c["spawned"] = false;
		for(k = 0; k < level.players.size; k++)
			if(level.players[k].isFlying)
				level.players[k] thread exit_heli_functions();
				
		for(k = 0; k < level.c["linker"].size; k++)
			level.c["linker"][k] delete();
			
		level.c["chopper"] delete();
	}
	else
	{
		level.isGunner = false;
		thread exit_heli_functions();
	}
}
waitTilChopper()
{
	self endon("end_heli_move");
	self waittill_any("death","disconnect");
	thread exit_heli();
}
exit_heli_functions()
{
	if(isDefined(self.heliHud[0]))
		for(k = 0; k < self.heliHud.size; k++)
			self.heliHud[k] destroy();
			
	self unlink();
	self enableWeapons();
	self show();
	self.lockMenu = false;
	self setOrigin(self.oldPos);
	self.isFlying = false;
	self.isDriver = false;
	self setClientDvar("cg_thirdperson","0");
	self notify("end_heli_move");
}
heliHud()
{
	coord = strTok("0,-48,2,57;0,48,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;146,132,21,2;-145,-132,21,2;145,-132,21,2;-145,132,21,2;155,-122,2,21;155,122,2,21",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.heliHud[k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	self.heliHud[self.heliHud.size] = createRectangle("","",0,0,1000,720,(0,0,0),"nightvision_overlay_goggles",-1,1);
}
chopperSettings(speed,accel,yawSpeed,yawAccel,pitch,roll,turning)
{
	self setSpeed(speed,accel);
	self setYawSpeed(yawSpeed,yawAccel);
	self setMaxPitchRoll(pitch,roll);
	self setTurningAbility(turning);
}
toggleTimer()
{
	if(!level.toggleTimer)
	{
		level thread maps\mp\gametypes\_globallogic::pauseTimer();
		self iPrintln("Timer Paused..");
		level.toggleTimer = true;
	}
	else
	{
		level thread maps\mp\gametypes\_globallogic::resumeTimer();
		self iPrintln("Timer Resumed..");
		level.toggleTimer = false;
	}
}
toggleVariableZoom()
{
	if(!self.variableZoom)
	{
		self.oldWeapon = self getCurrentWeapon();
		self.variableZoom = true;
		thread variableZoom();
		self iPrintln("Variable Zoom [^2ON^7]");
		giveWeapons("remington700_mp;m21_mp;aw50_mp;barrett_mp;dragunov_mp");
	}
	else
	{
		for(k = 0; k < 8; k++)
			if(isDefined(self.zoomElem[k]))
				self.zoomElem[k] destroy();
			
		self.variableZoom = false;
		takeWeapons("remington700_mp;m21_mp;aw50_mp;barrett_mp;dragunov_mp");
		self switchToWeapon(self.oldWeapon);
	}
}
variableZoom()
{
	dvar = [];
	curs = 1;
	elemNames = strTok("1x;2x;4x;8x;16x;32x;64x",";");
	for(k = 0; k < 8; k++)
		dvar[8-k] = int(k*10);
		
	self endon("lobby_choose");
	while(self.variableZoom)
	{
		while(self adsButtonPressed() && self playerAds() && hasSniper())
		{
			for(k = 0; k < 8; k++)
			{
				if(!isDefined(self.zoomElem[k]))
				{
					self.zoomElem[k] = createText("default",1.4,"","TOP",((k*40)-120),35,1,200,elemNames[k]);
					if(k == curs-1)
						self.zoomElem[curs-1].color = (1,0,0);
				}
			}
			if(self meleeButtonPressed())
			{
				self.zoomElem[curs-1].color = (1,1,1);
				curs ++;
				if(curs >= dvar.size)
					curs = 1;
					
				self.zoomElem[curs-1].color = (1,0,0);
				wait .1;
			}
			self setclientDvar("cg_fovmin", int(dvar[curs]));
			wait .05;
		}
		for(k = 0; k < 8; k++)
			self.zoomElem[k] destroy();
			
		wait .05;
	}
	self iPrintln("Variable Zoom [^1OFF^7]");
}
hasSniper()
{
	curWeapon = self getCurrentWeapon();
	if(curWeapon == "remington700_mp" || curWeapon == "m21_mp" || curWeapon == "aw50_mp" || curWeapon == "barrett_mp" || curWeapon == "dragunov_mp" || curWeapon == "m40a3_mp")
		return true;
		
	return false;
}
drunkMode()
{
	if(!self.drunk)
	{
		menuAction("close");
		self.drunk = true;
		thread drunk();
		self iPrintln("Wasted Mode: [^2ON^7]");
	}
	else
	{
		thread endDrunk();
		self iPrintln("Wasted Mode: [^1OFF^7]");
	}
}
drunkDeath()
{
	self waittill("death");
	if(self.drunk)
		thread endDrunk();
}
endDrunk()
{
	if(self.drunk)
	{
		self notify("endDrunk");
		self.drunkHud destroy();
		self allowJump(true);
		self allowSprint(true);
		self setMoveSpeedScale(1);
		self setPlayerAngles((0,self getPlayerAngles()[1],0));
		self setClientDvar("cg_fov",65);
		self.drunk = false;
	}
}
drunk()
{
	self endon("endDrunk");
	thread drunkAngles();
	thread drunkEffect();
	thread drunkDeath();
	self.drunkHud = createRectangle("","",0,0,1000,720,getColor(),"white",1,.2);
	for(;;)
	{
		for(k = 0; k < 5; k+=.2)
		{
			self setClientDvar("r_blur",k);
			self.drunkHud fadeOverTime(.1);
			self.drunkHud.color = getColor();
			wait .1;
		}
		for(k = 5; k > 0; k-=.2)
		{
			self setClientDvar("r_blur",k);
			self.drunkHud fadeOverTime(.1);
			self.drunkHud.color = getColor();
			wait .1;
		}
		wait .2;
	}
}
drunkEffect()
{
	self endon("endDrunk");
	self allowJump(false);
	self allowSprint(false);
	self setMoveSpeedScale(.5);
	for(;;)
	{
		for(k = 65; k < 80; k+=.5)
		{
			self setClientDvar("cg_fov",k);
			wait .05;
		}
		for(k = 80; k > 65; k-=.5)
		{
			self setClientDvar("cg_fov",k);
			wait .05;
		}
		wait .05;
	}
}
drunkAngles()
{
	angleInUse = false;
	while(self.drunk)
	{
		angles = self getPlayerAngles();
		if(!angleInUse)
		{
			self setPlayerAngles(angles+(.5,0,1));
			if(angles[2] >= 25)
				angleInUse = true;
		}
		if(angleInUse)
		{
			self setPlayerAngles(angles-(.5,0,1));
			if(angles[2] <= -25)
				angleInUse = false;
		}
		wait .05;
	}
}
originSee()
{
	origin = [];
	for(k = 0; k < 3; k++)
		origin[k] = createValue("default",2,"","",((k*90)-90),180,1,100,self.origin[k]);
		
	for(;;)
	{
		for(k = 0; k < origin.size; k++)
			origin[k] setValue(self.origin[k]);
			
		wait .05;
	}
}
bomberUse()
{
	if(!level.bomberInUse)
	{
		self beginLocationSelection("rank_prestige10",level.artilleryDangerMaxRadius);
		self.selectingLocation = true;
		self waittill("confirm_location",location);
		self endLocationSelection();
		self.selectingLocation = undefined;
		callBomber(bulletTrace(location+(0,0,1000),(location+(0,0,-100000)),false,undefined)["position"],168);
		level.bomberInUse = true;
	}
}
callBomber(coord,yaw)
{
	startPoint = coord+(vector_scale(anglesToForward((0,yaw,0)),((-1)*13000))+(0,0,750));
	endPoint = coord+(vector_scale(anglesToForward((0,yaw,0)),13000)+(0,0,750));
	length = length(startPoint - endPoint);
	for(k = 0; k < 8; k++)
		level thread bomberStrike(self,coord,startPoint+(0,((-1)*((8/2)*450)+(k*550)),randomIntRange(100,500)),endPoint+(0,((-1)*((8/2)*450)+(k*550)),randomIntRange(100,500)),(length/3000),(0,yaw,0),(abs(length/2+1500)/3000));
}
bomberStrike(owner,bombSite,startPoint,endPoint,flyTime,direction,bombTime)
{
	plane = spawnPlane(owner,"script_model",startPoint+((randomFloat(2)-1),(randomFloat(2)-1),0));
	plane setModel("vehicle_mig29_desert");
	plane.angles = direction;
	plane moveTo(endPoint+((randomFloat(2)-1),(randomFloat(2)-1),0),flyTime);
	thread maps\mp\gametypes\_hardpoints::callStrike_planeSound(plane,bombSite);
	for(k = 0; k < 4; k++)
	{
		plane thread bomberBomb(bombTime-2.2,owner);
		wait .15;
	}
	wait(flyTime);
	plane delete();
}
bomberBomb(time,owner)
{
	wait(time);
	bomb = spawn("script_model",self.origin);
	bomb setModel("projectile_cbu97_clusterbomb");
	bomb.angles = self.angles;
	bomb moveGravity(vector_scale(anglesToForward(self.angles),4500/1.5),2);
	wait(1);
	trace = bulletTrace(bomb.origin,(bomb.origin+vector_scale(anglesToForward(bomb.angles-(15,0,0),0,0),-10000)),false,undefined)["position"];
	playFxOnTag(level.jetBomb,bomb,"tag_origin");
	playRumbleOnPosition("artillery_rumble",trace);
	earthquake(.7,.75,trace,2000);
	bomb setModel("tag_origin");
	thread killPlayersEffect(owner);
	wait(1);
	bomb delete();
}
killPlayersEffect(owner)
{
	for(time=0;;time++)
	{
		if(time >= (20))
			break;
			
		fallTrace = bulletTrace(self.origin,self.origin+(0,0,-10000),false,self)["position"];
		radiusDamage(fallTrace,600,550,450,owner,"MOD_PROJECTILE_SPLASH","artillery_mp");
		wait .05;
	}
	level.bomberInUse = false;
}
predator()
{
	if(!level.predator)
	{
		level.predator = true;
		self.oldPos = self getOrigin();
		menuAction("lock");
		self setHealth(99999999999);
		self disableWeapons();
		self hide();
		thread predatorWait();
	}
	else
		self iPrintln("^1Please Wait There Is A Predator In Use.");
}
predatorWait()
{
	corner = getEntArray("minimap_corner","targetname");
	predator["model"] = spawn("script_model",(corner[1].origin+(0,0,2200)+vector_scale(anglesToForward(vectorToAngles(corner[0].origin+(0,0,2200) - corner[1].origin+(0,0,2200))),2700)));
	predator["model"] setModel("projectile_cbu97_clusterbomb");
	predator["model"] setPredatorView(self,corner);
	predator["model"] predatorLaunch(self);
}
setPredatorView(player,vector)
{
	player thread predatorDisconnect(self);
	coord = strTok("21,0,2,24;-20,0,2,24;0,-11,40,2;0,11,40,2;0,-39,2,57;0,39,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		player.predator[k] = player createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	angles = vectorToAngles(vector[0].origin+(0,0,2000) - vector[1].origin-(0,0,15000));
	player setPlayerAngles(angles);
	player setOrigin(self.origin+(150,0,-50));
	player linkTo(self);
	self.angles = angles;
}
predatorLaunch(player)
{
	player endon("death");
	player endon("disconnect");
	self.speed = .8;
	for(time=0;;time++)
	{
		earthQuake(.15,.05,self.origin,200);
		playFxOnTag(level.chopper_fx["fire"]["trail"]["medium"],self,"tag_origin");
		predator["forward"] = self.origin+vector_scale(anglesToForward(self.angles),60*self.speed);
		predator["collision"] = bulletTrace(self.origin,predator["forward"],false,self);
		if((time >= (20*9)) || (predator["collision"]["surfacetype"] != "default" && predator["collision"]["fraction"] < 1 && level.collisions))
		{
			expPos = self.origin;
			for(k = 0; k < 360; k+=80)
				playFX(level.chopper_fx["explode"]["large"],(expPos[0]+(200*cos(k)),expPos[1]+(200*sin(k)),expPos[2]+100));
				
			earthquake(3,1.6,expPos,500);
			self playSound("cobra_helicopter_hit");
			wait .05;
			radiusDamage(expPos,450,400,300,player);
			break;
		}
		if(player attackButtonPressed() && self.speed <= 1)
		{
			self.speed = 1.5;
			self playSound("veh_mig29_sonic_boom");
		}
		self.angles = player getPlayerAngles();
		self moveTo(predator["forward"],.05);
		angles = player getPlayerAngles();
		if(angles[0] <= 10)
			player setPlayerAngles((10,angles[1],angles[2]));
			
		wait .05;
	}
	player notify("preditor_end");
	player thread predatorEnd(self);
}
predatorEnd(entity)
{
	if(isDefined(entity))
		entity delete();
		
	level.predator = false;
	for(k = 0; k < self.predator.size; k++)
		if(isDefined(self.predator[k]))
			self.predator[k] destroyElem();
			
	self unlink();
	self setOrigin(self.oldPos);
	self enableWeapons();
	self show();
	self.lockMenu = false;
	self setHealth(100);
}
predatorDisconnect(entity)
{
	self endon("preditor_end");
	self waittill_any("disconnect","death");
	thread predatorEnd(entity);
}
chopperGunner()
{
	if(!self.chopperGunner)
	{
		self.oldPos = self getOrigin();
		menuAction("lock");
		self.chopperGunner = true;
		self disableWeapons();
		self hide();
		thread initChopperWeapon("weap_ak47_fire_plr");
		thread chopperWeaponHud();
		thread runChopperGunner();
		thread chopperGunnerFly();
		self setHealth(99999999999);
	}
}
chopperGunnerFly()
{
	self endon("death");
	self endon("disconnect");
	gunner = chopper();
	thread chopperGunnerDeath(gunner);
	thread chopperGunnerLink(gunner);
    for(k = 0; k < 7; k++)
	{
		gunner setVehGoalPos(newPosition(),1);
        wait (9+randomInt(7));
    }
	thread endChopper(gunner);
	for(k = 0; k < self.chopperHud.size; k++)
		self.chopperHud[k] destroy();
}
chopperGunnerLink(entity)
{
	link = spawn("script_origin",entity.origin);
	link linkTo(entity);
	self setOrigin(entity.origin-(0,0,250));
	self linkTo(link);
}
chopperWeaponHud()
{
	coord = strTok("0,-48,2,57;0,48,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.chopperHud[k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	self.chopperHud[self.chopperHud.size] = createRectangle("","",0,0,1000,720,(0,0,0),"nightvision_overlay_goggles",-1,1);
	self.chopperHud[self.chopperHud.size] = createValue("default",1.8,"LEFT","",-150,145,1,100,self.origin[0]);
	self.chopperHud[self.chopperHud.size] = createValue("default",1.8,"RIGHT","",150,145,1,100,self.origin[1]);
	self.chopperHud[self.chopperHud.size] = createValue("default",1.8,"RIGHT","",150,-145,1,100,self.origin[2]);
}
runChopperGunner()
{
	self endon("disconnect");
	self endon("death");
	while(self.chopperGunner)
	{
		pos = self.origin;
		for(k = 13; k < self.chopperHud.size; k++)
			self.chopperHud[k] setValue(pos[k-13]);
			
		angles = self getPlayerAngles();
		if(angles[0] <= 25)
			self setPlayerAngles((25,angles[1],angles[2]));
			
		wait .05;
	}
}
initChopperWeapon(Sound)
{
	self endon("disconnect");
	self endon("death");
	while(self.chopperGunner)
	{
		if(self attackButtonPressed())
		{
			self playLocalSound(Sound);
			pos = getCursorPos();
			radiusDamage(pos,99,350,150,self,"MOD_RIFLE_BULLET","helicopter_mp");
			earthQuake(.3,.2,self.origin,200);
			wait .35;
		}
		wait .05;
	}
}
endChopper(chopper)
{
	self.chopperGunner = false;
	self unlink();
	self show();
	self enableWeapons();
	chopper delete();
	self.lockMenu = false;
	self setOrigin(self.oldPos);
}
chopperGunnerDeath(chopper)
{
	self waittill_any("death","disconnect");
	if(self.chopperGunner)
		thread endChopper(chopper);
}
newPosition()
{
	if(isMap("mp_bloc"))
		pos = (1100,-5836,1300);
	else if(isMap("mp_crossfire"))
		pos = (4566,-3162,1300);
	else if(isMap("mp_citystreets"))
		pos = (4384,-469,1200);
	else if(isMap("mp_creek"))
		pos = (-1595,6528,1300);
	else if(isMap("mp_bog"))
		pos = (3767,1332,1300);
	else if(isMap("mp_overgrown"))
		pos = (267,-2799,1500);
	else
		pos = (0,0,1300);
		
	return (pos[0]+(randomInt(1700)*cos(randomInt(360))),pos[1]+(randomInt(1700)*sin(randomInt(360))),pos[2]);
}
chopper()
{
	chopper = spawnHelicopter(self,newPosition(),self.angles,"cobra_mp","vehicle_cobra_helicopter_fly");
	chopper playLoopSound("mp_hind_helicopter");
	chopper setSpeed(120,20);
	chopper setYawSpeed(150,140);
	chopper.currentstate = "ok";
	chopper.laststate = "ok";
	chopper setDamageStage(3);
	return chopper;
}
reaper()
{
	if(!self.reaper)
	{
		self iPrintln("Press [{+frag}] To Exit Reaper");
		self.reaper = true;
		self.oldPos = self getOrigin();
		thread reaperHud();
		self.rLoc = getPosition();
		self setHealth(99999999999);
		thread reaperLink();
		thread reaperWeapon();
		self playLocalSound("item_nightvision_on");
	}
}
reaperLink()
{
	thread reaperDeath();
	menuAction("lock");
	self.noclip = false;
	self.reap["veh"] = spawn("script_model",(self.rLoc[0]+(1150*cos(0)),self.rLoc[1]+(1150*sin(0)),self.rLoc[2]));
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
		angles = self getPlayerAngles();
		if(angles[0] <= 30)
			self setPlayerAngles((30,angles[1],angles[2]));
			
		if(self fragButtonPressed())
		{
			self playLocalSound("item_nightvision_off");
			enterMenu("VIP");
			self unlink();
			self setOrigin(self.oldPos);
			for(k = 0; k < self.r.size; k++)
				if(isDefined(self.r[k]))
					self.r[k] destroyElem();
					
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
	self show();
	self.reap["veh"] delete();
	self.reaper = false;
	if(isDefined(self.reap["bullet"]))
		self.reap["bullet"] delete();
}
reaperMove()
{
	self endon("death");
	self endon("disconnect");
	while(self.reaper)
	{
		for(k = 0; k < 360; k+=.5)
		{
			if(!self.reaper)
				break;
				
			location = (self.rLoc[0]+(1150*cos(k)),self.rLoc[1]+(1150*sin(k)),self.rLoc[2]);
			angles = vectorToAngles(location - self.reap["veh"].origin);
			self.reap["veh"] moveTo(location,.1);
			self.reap["veh"].angles = (angles[0],angles[1],angles[2]-40);
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
		if(self attackButtonPressed())
		{
			self.reap["bullet"] = spawn("script_model",self getTagOrigin("tag_weapon_left"));
			self.reap["bullet"] setModel("projectile_cbu97_clusterbomb");
			self.reap["bullet"] playSound("weap_hind_missile_fire");
			for(time = 0; time < 200; time++)
			{
				if(!self.reaper)
					break;
					
				vector = anglesToForward(self.reap["bullet"].angles);
				forward = self.reap["bullet"].origin+(vector[0]*45,vector[1]*45,vector[2]*49);
				collision = bulletTrace(self.reap["bullet"].origin,forward,false,self);
				
				self.reap["bullet"].angles = (vectorToAngles((getCursorPos()-(0,0,130)) - self.reap["bullet"].origin));
				self.reap["bullet"] moveTo(forward,.05);
				playFxOnTag(level.chopper_fx["fire"]["trail"]["medium"],self.reap["bullet"],"tag_origin");
				if(collision["surfacetype"] != "default" && collision["fraction"] < 1 && level.collisions)
				{
					expPos = self.reap["bullet"].origin;
					for(k = 0; k < 360; k+=80)
						playFx(level.chopper_fx["explode"]["large"],(expPos[0]+(150*cos(k)),expPos[1]+(150*sin(k)),expPos[2]+100));
						
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
		target["enemyTeam"] = false;
		target["myTeam"] = false;
		for(k = 0; k < level.players.size; k++)
		{
			if(isAlive(level.players[k]))
			{
				if(distance(getCursorPos(),level.players[k].origin) < 200)
					if((level.teamBased && self.team != level.players[k].team) || (!level.teamBased && level.players[k] != self))
						target["enemyTeam"] = true;
					else
						target["myTeam"] = true;
			}
		}
		for(k = 0; k < int(hudElem.size/2); k++)
		{
			if(target["myTeam"] && target["enemyTeam"])
				hudElem[k].color = (1,(188/255),(43/255));
				
			else if(target["myTeam"] && !target["enemyTeam"])
				hudElem[k].color = (0,.7,0);
				
			else if(!target["myTeam"] && target["enemyTeam"])
				hudElem[k].color = (.7,0,0);
		}
		wait .05;
		for(k = 0; k < hudElem.size; k++)
			hudElem[k].color = (1,1,1);
	}
}
reaperHud()
{
	coord = strTok("21,0,2,24;-20,0,2,24;0,-11,40,2;0,11,40,2;0,-39,2,57;0,39,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.r[k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	thread reaperAIDetect(self.r);
}
getPosition()
{
	location = (0,0,2000);
	if(isMap("mp_bloc"))
		location = (1100,-5836,2500);
	else if(isMap("mp_crossfire"))
		location = (4566,-3162,2300);
	else if(isMap("mp_citystreets"))
		location = (4384,-469,2100);
	else if(isMap("mp_creek"))
		location = (-1595,6528,2500);
	else if(isMap("mp_bog"))
		location = (3767,1332,2300);
	else if(isMap("mp_overgrown"))
		location = (267,-2799,2600);
	else
		location = (0,0,2300);
		
	return location;
}
welcomeText(player,textOne,textTwo,glowColor)
{
	player endon("death");
	player endon("disconnect");
	line[0] = createText("default",2,"","",-1000,-150,1,10,textOne);
	line[1] = createText("default",2,"","",1000,-120,1,10,textTwo);
	for(k = 0; k < line.size; k++)
	{
		line[k].glowAlpha = 1;
		line[k].glowColor = glowColor;
	}
	line[0] welcomeMove(1.5,-90);
	line[1] welcomeMove(1.5,90);
	wait 1.5;
	line[0] welcomeMove(4,90);
	line[1] welcomeMove(4,-90);
	wait 4;
	line[0] welcomeMove(3,1000);
	line[1] welcomeMove(3,-1000);
	wait 3;
	for(k = 0; k < 2; k++)
		line[k] destroy();
}
welcomeMove(time,x)
{
	self setPoint("","",x,self.y,time);
}
strafeRun()
{
	if(!level.strafeRun)
	{
		level.strafeRun = true;
		self beginLocationSelection("rank_prestige10",level.artilleryDangerMaxRadius);
		self.selectingLocation = true;
		self waittill("confirm_location",location);
		newLocation = bulletTrace(location+(0,0,1000),(location+(0,0,-100000)),false,undefined)["position"];
		self endLocationSelection();
		self.selectingLocation = undefined;
		iPrintln("Strafe Run Incoming...");
		wait(1.5);
		pathNode = [];
		offSet = strTok("0;-625;625;-1250;1250",";");
		direction = maps\mp\gametypes\_hardpoints::getBestPlaneDirection(newLocation);
		for(k = 0; k < offSet.size; k++)
			pathNode[k] = getPath(newLocation,direction,int(offSet[k]));
			
		level thread strafeLoop(self,pathNode[0]);
		wait(.4);
		level thread strafeLoop(self,pathNode[1]);
		level thread strafeLoop(self,pathNode[2]);
		wait(.4);
		level thread strafeLoop(self,pathNode[3]);
		level thread strafeLoop(self,pathNode[4]);
	}
	else
		self iprintln("Please Wait... ^1There is a Strafe Run in use.");
}
strafeLoop(owner,pathNode)
{
	chopper = createStrafe(owner,pathNode["begin"],vectorToAngles(pathNode["objective"] - pathNode["begin"]));
	chopper setVehGoalPos(pathNode["objective"],0);
	chopper waittill("goal");
	chopper setVehGoalPos(pathNode["begin"],0);
	chopper waittill("goal");
	chopper delete();
}
createStrafe(owner,startOrigin,angles)
{
	chopper = spawnHelicopter(owner,startOrigin,angles,"cobra_mp","vehicle_cobra_helicopter_fly");
	chopper playLoopSound("mp_hind_helicopter");
	chopper setDamageStage(3);
	chopper chopperSettings(60,20,40,20,30,45,1);
	chopper thread strafeShoot(owner);
	return chopper;
}
getPath(location,yaw,offSet)
{
	path = [];
	if(offSet != 0)
		location = location+(vector_scale(anglesToRight((0,yaw,0)),offSet));
		
	path["begin"] = location+(vector_scale(anglesToForward((0,yaw,0)),((-1)*13000))+(0,0,1550));
	path["objective"] = location+(vector_scale(anglesToForward((0,yaw,0)),13000)+(0,0,1550));
	return path;
}
strafeShoot(owner)
{
	for(count = 0; count <= 1200; count++)
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
	level.strafeRun = false;
}
chopperTarget(aiTarget)
{
	trace = bulletTrace(self.origin+(0,0,5),aiTarget getEye(),false,self)["fraction"];
	if(trace == 1 && distance(self.origin,aiTarget.origin) <= 3500)
		return distance(self.origin,aiTarget.origin);
		
	return int(-1);
}
divingBomber()
{
	if(!self.useingBomber)
	{
		//this script can be alot smaller and it may still have bugs, ive not fully tested it.
		self.useingBomber = true;
		self.bomberShoot = false;
		self beginLocationSelection("rank_prestige10",level.artilleryDangerMaxRadius);
		self.selectingLocation = true;
		self waittill("confirm_location",location);
		newLocation = bulletTrace(location+(0,0,1000),(location+(0,0,-100000)),0,self)["position"];
		self endLocationSelection();
		self.selectingLocation = undefined;
		bomber = spawnPlane(self,"script_model",newLocation+(0,0,25000));
		bomber setModel("vehicle_mig29_desert");
		bomber.angles = vectorToAngles(newLocation+(0,0,1500) - bomber.origin);
		shootPos = ((newLocation)+(0,0,4000));
		for(time = 0; time < 140; time++)
		{
			if(bomber.origin[2] > 10000 && bomber.origin[2] < 15000)
			{
				playFxOnTag(level.fx_airstrike_contrail,bomber,"tag_left_wingtip");
				playFxOnTag(level.fx_airstrike_contrail,bomber,"tag_right_wingtip");
				bomber playLoopSound("veh_mig29_mid_loop");
			}
			bomber moveTo((bomber.origin+(anglestoforward(bomber.angles)*300)),.05);
			if(bomber.origin[2] <= shootPos[2])
				bomber rotateTo(vectorToAngles(bomber.origin - bomber.origin+(19000,0,1000)),.35);
				
			if(bomber.origin[2] <= shootPos[2]+1300 && !self.bomberShoot)
			{
				bomber playSound("veh_mig29_sonic_boom");
				bomber thread bomberShoot(newLocation);
				self.bomberShoot = true;
			}
			wait .05;
		}
		self.useingBomber = false;
		bomber delete();
	}
}
bomberShoot(location)
{
	for(count = 0; count < 5; count++)
	{
		position = (location[0]+(randomInt(300)*cos(randomInt(360))),location[1]+(randomInt(300)*sin(randomInt(360))),location[2]);
		bullet = spawn("script_model",self.origin);
		bullet setModel("projectile_hellfire_missile");
		bullet.angles = (vectorToAngles(position - self.origin));
		bullet moveTo(position,1.1);
		bullet thread bomberEffect(position);
		wait .1;
	}
}
bomberEffect(pos)
{
	wait 1.1;
	for(k = 0; k < level._effect["grenade"].size; k++)
		playFx(level._effect["grenade"][k],pos);
		
	earthQuake(1.3,.6,pos,450);
	radiusDamage(pos,250,350,150,self);
	self playSound("cobra_helicopter_hit");
	self delete();
}
giveTurret()
{
	if(!self.isTurret)
	{
		self.isTurret = true;
		menuAction("close");
		turret["carry"] = spawn("script_model",(0,0,0));
		turret["carry"].origin = (self.origin+anglesToForward(self.angles)*60)+(0,0,45);
		turret["carry"].angles = (270,self.angles[1],self.angles[2]);
		turret["carry"] linkTo(self);
		turret["carry"] setModel("weapon_m60_gold");
		wait .5;
		thread placeTurret(turret["carry"]);
		self iPrintln("Press [{+activate}] To Place Sentry Gun.");
	}
}
placeTurret(entity)
{
	for(;;)
	{
		angles = self getPlayerAngles();
		if(angles[0] <= 0)
			self setPlayerAngles((0,angles[1],angles[2]));
			
		else if(angles[0] >= 10)
			self setPlayerAngles((10,angles[1],angles[2]));
			
		if(self useButtonPressed() || !isAlive(self))
		{
			iPrintln(self.name," Spawned A Turret!");
			entity unlink();
			thread spawnTurret();
			break;
		}
		wait(.05);
	}
	self enableWeapons();
	entity delete();
}
spawnTurret()
{
	array = strTok("weapon_m60_gold;com_plasticcase_beige_big",";");
	point = self.origin+(vectorScale(anglesToForward(self getPlayerAngles()),38));
	turret["gun"][0] = spawn("script_model",point+(0,0,45));
	turret["gun"][1] = spawn("script_model",point+vectorScale(anglesToForward(self getPlayerAngles()),15)+(0,0,13));
	turret["gun"][2] = spawn("trigger_radius",point+vectorScale(anglesToForward(self getPlayerAngles()),2)+(0,0,13),0,40,40);
	turret["gun"][2] setContents(1);
	turret["gun"][2].targetname = "script_collision";
	for(k = 0; k < turret["gun"].size; k++)
	{
		turret["gun"][k] setModel(array[k]);
		turret["gun"][k].angles = (k*-90,self getPlayerAngles()[1],0);
	}
	turret["gun"][0] thread checkForPlayers(self);
	turret["gun"][0] thread rotateTurret(self);
	turret["gun"][0] thread shootTurret(self);
	turret["gun"] thread timeOutTurret(50,self);
	thread turretGametype(turret["gun"]);
}
timeOutTurret(time,entity)
{
	wait(time);
	entity.isTurret = false;
	for(k = 0; k < self.size; k++)
		self[k] delete();
}
turretGametype(entity)
{
	self waittill("lobby_choose");
	if(self.isTurret)
	{
		self.isTurret = false;
		for(k = 0; k < entity.size; k++)
			entity[k] delete();
	}
}
shootTurret(owner)
{
	while(owner.isTurret)
	{
		if(isDefined(self.tagedPlayer))
		{
			startPath = self.origin+(vectorScale(anglesToForward(self.angles),25));
			trace = bulletTrace(startPath,startPath+(vectorScale(anglesToForward(self.angles),1400)),true,self)["entity"];
			if((isPlayer(trace)) && ((level.teamBased && trace.team != owner.team) || (!level.teamBased && owner != trace)))
			{
				playFx(level.muzzleFlash,startPath);
				self playSound("weap_m249saw_fire_npc");
				self.tagedPlayer thread [[level.callbackPlayerDamage]](self,self,19,0,"MOD_RIFLE_BULLET","saw_mp",self.tagedPlayer getEye(),(0,0,0),"j_head",0);
				wait(.05);
			}
		}
		wait(.05);
	}
}
checkForPlayers(owner)
{
	while(owner.isTurret)
	{
		closePlayer = undefined;
		self.tagedPlayer = undefined;
		closeDist = undefined;
		for(k = 0; k < level.players.size; k++)
		{
			if((isAlive(level.players[k])) && ((level.teamBased && level.players[k].team != owner.team) || (!level.teamBased && owner != level.players[k])))
			{
				inView = turretTarget(level.players[k]);
				if((inView >= 0) && (!isDefined(closeDist) || inView <= closeDist))
				{
					closePlayer = level.players[k];
					closeDist = inView;
				}
			}
		}
		while(isAlive(closePlayer) && turretTarget(self.tagedPlayer) >= 0)
		{
			self.tagedPlayer = closePlayer;
			wait(.05);
		}
		if(!self.spinning)
			thread spinTurret();
			
		wait(.1);
	}
	self.tagedPlayer = undefined;
}
rotateTurret(owner)
{
	while(owner.isTurret)
	{
		while(isDefined(self.tagedPlayer))
		{
			self rotateTo(vectorToAngles(self.tagedPlayer getEye() - self.origin),.1);
			wait(.1);
		}
		wait(.05);
	}
}
spinTurret()
{
	self.spinning = true;
	self.angles = (0,self.angles[1],self.angles[2]);
	while(!isDefined(self.tagedPlayer))
	{
		self rotateYaw(90,2);
		wait(.05);
	}
	self.spinning = false;
}
turretTarget(aiTarget)
{
	trace = bulletTrace(self.origin+(0,0,5),aiTarget getEye(),false,self)["fraction"];
	if(trace == 1 && distance(self.origin,aiTarget.origin) <= 1400)
		return distance(self.origin,aiTarget.origin);
		
	return int(-1);
}
unlimitedAmmo()
{
	if(!level.unlimitedAmmo)
	{
		for(k = 0; k < level.players.size; k++)
			level.players[k] setClientDvar("player_sustainAmmo","1");
			
		level.unlimitedAmmo = true;
		self iPrintln("Unlimited Ammo [^2ON^7]");
	}
	else
	{
		for(k = 0; k < level.players.size; k++)
			level.players[k] setClientDvar("player_sustainAmmo","0");
			
		level.unlimitedAmmo = false;
		self iPrintln("Unlimited Ammo [^1OFF^7]");
	}
}
antiTubes()
{
	self iPrintln("Noob Tubes Disabled");
	for(k = 0; k < level.players.size; k++)
	{
		if((level.players[k].name != level.hostname) && (level.players[k].name != self.name))
			self setActionSlot(3,"");
	}
}
toggleDisco()
{
	if(!level.zombieRise)
	{
		if(!level.discoFog)
		{
			level.discoFog = true;
			thread discoMode();
			self iPrintln("Disco Fog [^2ON^7]");
		}
		else
			level.discoFog = false;
	}
	else
		self iPrintln("Please Turn ^1Off ^7Zombie Rise..");
}
discoMode()
{
	for(k = 0; k < level.players.size; k++)
		level.players[k] setClientDvar("r_fog","1");
		
	while(level.discoFog)
	{
		setExpFog(256,512,randomInt(255)/255,randomInt(255)/255,randomInt(255)/255,0);
		wait .1;
	}
	self iPrintln("Disco Fog [^1OFF^7]");
	for(k = 0; k < level.players.size; k++)
		level.players[k] setClientDvar("r_fog","0");
		
	setExpFog(800,20000,.580,.631560,.553070,0);
}
zombieRise()
{
	if(!level.discoFog)
	{
		if(!level.zombieRise)
		{
			setExpFog(170,170,.5,.5,.5,.5);
			for(k = 0; k < level.players.size; k++)
				level.players[k] setClientDvars("r_fog","1","r_filmusetweaks","1","r_filmtweakenable","1","r_filmtweakdarktint","1.4 .8 .8","r_filmtweaklighttint","1.2 .6 .6","r_filmtweakcontrast","1.3","r_colorMap","1");
				
			level.zombieRise = true;
			thread zombieRiseFog();
		}
		else
		{
			setExpFog(800,20000,.580,.631560,.553070,0);
			for(k = 0; k < level.players.size; k++)
				level.players[k] setClientDvars("r_fog","0","r_colormap","1","r_fullbright","0","r_specularmap","0","r_debugShader","0","r_filmTweakEnable","0","r_filmUseTweaks","0","r_filmTweakInvert","0","r_filmtweakLighttint","1.1 1.05 .85","r_filmtweakdarktint",".7 0.85 1");
				
			level.zombieRise = false;
		}
	}
	else
		self iPrintln("Please Turn ^1Off ^7Disco Mode..");
}
zombieRiseFog()
{
	fogTemp = strTok("200,200;700,700;200,200;80,80",";");
	fogTime = strTok("30;20;30;10",";");
	while(level.zombieRise)
	{
		for(k = 0; k < fogTemp.size; k++)
		{
			fogArray = strTok(fogTemp[k],",");
			setExpFog(int(fogArray[0]),int(fogArray[1]),.5,.5,.5,(int(fogTime[k])-9));
			for(k = 0 ; k < (int(fogTime[k])*20); k++)
			{
				if(!level.zombieRise)
					break;
					
				wait .05;
			}
		}
	}
	self iPrintln("Zombie Rise Fog [^1OFF^7]");
}
giveWeapons(array)
{
	weapon = strTok(array,";");
	for(k = 0; k < weapon.size; k++)
		self giveWeapon(weapon[k]);
}
takeWeapons(array)
{
	weapon = strTok(array,";");
	for(k = 0; k < weapon.size; k++)
		self takeWeapon(weapon[k]);
}
setDvars(dvars)
{
	dvarNames = strTok(dvars,";");
	for(k = 0; k < dvarNames.size; k++)
	{
		tempDvar = strTok(dvarNames[k],",");
		setDvar(tempDvar[0],tempDvar[1]);
	}
}
toggleWeaponBox()
{
	if(!level.weaponBoxSpawned)
	{
		angles = self getPlayerAngles();
		self setPlayerAngles((0,angles[1],angles[2]));
		level.weaponBoxSpawned = true;
		level.boxOrigin = self.origin+(anglesToForward((angles[2],angles[1],0))*100);
		level.boxAngles = (0,angles[1],angles[2]);
		thread mystery_Box_Menu();
		self iPrintln("Mystery Box [^2ON^7]");
	}
	else
	{
		level.weaponBoxSpawned = false;
		self iPrintln("Mystery Box [^1OFF^7]");
	}
}
mystery_Box_Menu()
{
	level.weaponBoxMenu = spawn("script_model",level.boxOrigin);
	level.weaponBoxMenu setModel("com_plasticcase_beige_big");
	level.weaponBoxMenu.angles = level.boxAngles;
	level.weaponBoxMenuSolid = spawn("trigger_radius",level.boxOrigin,0,50,50);
	level.weaponBoxMenuSolid setContents(1);
	level.weaponBoxMenuSolid.targetname = "script_collision";
	wait 1;
	while(level.weaponBoxSpawned)
	{
		for(k = 0; k < get_players().size; k++)
		{
			guy = get_players()[k];
			if(distance(guy.origin,level.weaponBoxMenu.origin) < 50)
			{
				guy.hint = "Press [{+activate}] To Use Random Box";
				if(guy useButtonPressed() && !guy gotAllWeapons())
				{
					level.weaponBoxUser = guy;
					break;
				}
			}
		}
		if(isDefined(level.weaponBoxUser))
			break;
			
		wait .05;
	}
	user = level.weaponBoxUser;
	gun = user chest_weapon_spawn(level.weaponBoxMenu.origin);
	thread chest_time_out(user,gun);
	while(level.weaponBoxSpawned)
	{
		if(distance(user.origin,level.weaponBoxMenu.origin) < 50)
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
	level.weaponBoxMenuSolid delete();
	level.weaponBoxMenu delete();
	level.weaponBoxUser = undefined;
	if(level.weaponBoxSpawned)
		thread mystery_Box_Menu();
}
chest_time_out(guy,gun)
{
	guy endon("weapon_collected");
	gun moveTo(gun.origin-(0,0,30),12,(12*.5));
	wait 12;
	guy.timedOut = true;
	wait 0.2;
	guy.timedOut = undefined;
}
chest_weapon_spawn(loc)
{
	gun = spawn("script_model",loc+(0,0,25));
	gun setModel("");
	gun.angles = level.weaponBoxMenu.angles;
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
telePortAll()//make a sumun all function.
{
    for(k = 1; k < level.players.size; k++)
    {
        if(level.players[k] != self)
			level.players[k] setOrigin(getCursorPos()+(randomInt(160),randomInt(160),7));
			
        level.players[k] freezeControls(true);
    }
    self iPrintln("^1Players Teleported to Crosshair");
}
artilleryGun()
{
	if(!level.spawningObject)
	{
		if(!level.artilleryGunSpawn)
		{
			thread deleteAllModels();
			thread cannonDeath();
			level.artilleryGunSpawn = true;
			origin = [];
			for(k = 0; k < 2; k++)
				origin[k] = (self.origin-(k*20,0,0));
				
			artilleryBase = [];
			for(k = 0; k < 4; k++)
				artilleryBase[0][k] = spawnBox((origin[0]+(((k*50)-95),0,0)),(0,0,0));
				
			for(k = 0; k < 4; k++)
				artilleryBase[1][k] = spawnBox((origin[0]+(-20,((k*50)-70),0)),(0,90,0));
				
			artilleryCenter = [];
			for(k = 0; k < 3; k++)
				artilleryCenter[0][k] = spawnBox((origin[0]+(((k*30)-50),0,15)),(0,90,0));
				
			for(k = 0; k < 2; k++)
				for(i = 0; i < 2; i++)
					artilleryCenter[k+1][i] = spawnBox((origin[0]+(((k*60)-50),0,((i*25)+40))),(0,90,0));
					
			artilleryGun = [];
			for(k = 0; k < 5; k++)
				artilleryGun[k] = spawnBox((origin[0]+(-20,((k*50)-60),65)),(0,90,0));
				
			for(k = 0; k < 360; k +=25)
			{
				artilleryCos[k] = spawnBox((origin[1]+(30*cos(k),30*sin(k),0)),(0,90,0));
				angle = vectorToAngles(artilleryCos[k].origin - origin[1]);
				artilleryCos[k].angles = (angle[0],angle[1],0);
			}
			level.spin = spawn("script_origin",origin[1]+(0,0,90));
			for(k = 0; k < artilleryCenter.size; k++)
				for(i = 0; i < artilleryCenter[k].size; i++)
					artilleryCenter[k][i] linkTo(level.spin);
					
			level.tilt = spawn("script_origin",origin[1]+(0,0,65));
			for(k = 0; k < artilleryGun.size; k++)
				artilleryGun[k] linkTo(level.tilt);
				
			level.artilleryShoot = [];
			for(k = 0; k < 2; k++)
			{
				level.artilleryShoot[k] = spawn("script_origin",origin[1]+(0,((k*200)+190),65));
				level.artilleryShoot[k] linkTo(level.tilt);
			}
			level.isUseingGun = false;
			level.scriptOrigin = origin;
			level.controlPannel = spawnBox(origin[1]+(205,205,0),(0,-45,0));
			level.controlLaptop = spawnBox(origin[1]+(205,205,30),(0,45,0),"com_laptop_2_open");
			level addViewPoint(0,origin[1]+(225,225,0),(5,-135,0));
			level addViewPoint(1,origin[1]+(0,0,700),(90,0,0));
			level addViewPoint(2,level.artilleryShoot[0].origin-(0,0,45),(0,0,0),level.tilt);
			level.cannonShoot = false;
			level thread cannonTrigger(level.controlPannel);
			level.spin showIconOnMap("compass_objpoint_flak_busy");
		}
		else
		{
			thread deleteAllModels();
			self iPrintln("^1Artillery Cannon Destroyed");
		}
	}
	else
		self iPrintln("^1Please Wait There Is Something Else Spawning!");
}
cannonTrigger(entity)
{
	level endon("cannon_delete");
	while(isDefined(entity))
	{
		for(k = 0; k < level.players.size; k++)
		{
			player = level.players[k];
			if(distance(player.origin,entity.origin) < 40)
			{
				player.hint = "Press [{+activate}] To Control Cannon";
				if(player useButtonPressed() && !level.isUseingGun)
				{
					player.useingCannon = true;
					player.oldPos = player getOrigin();
					level.isUseingGun = true;
					player setPlayerAngles((5,-135,0));
					player thread artilleryControl();
					player hide();
				}
			}
		}
		wait .05;
	}
}
addViewPoint(num,origin,angles,link)
{
	level.viewPoint[num] = spawn("script_origin",origin);
	level.viewAngle[num] = angles;
	destroyArray(level.viewAngle[num]);
	if(isDefined(link))
		level.viewPoint[num] linkTo(link);
}
artilleryControl()
{
	level endon("cannon_control");
	menuAction("lock");
	string = "";
	artilleryOptions = strTok("Turn Right;Turn Left;look Up;Look Down;Switch View",";");
	artilleryCase = strTok("right;left;up;down;view",";");
	for(k = 0; k < artilleryOptions.size; k++)
		string += artilleryOptions[k]+"\n";
		
	self.artillery["options"] = createText("default",1.5,"LEFT","",-230,90,1,3,string);
	self.artillery["backGround"] = createRectangle("LEFT","",-240,125,110,100,(0,0,0),"white",1,.6);
	self.artillery["scrollBar"] = createRectangle("LEFT","",-240,90,110,18,(.7,0,0),"white",2,.8);
	curs = 0;
	self.next = 0;
	while(self.useingCannon)
	{
		setHealth(99999999);
		if(self fragButtonPressed() && !level.cannonShoot)
		{
			level.cannonShoot = true;
			//ino this is abit big for a bullet but i wanted to get this done. fast
			earthquake(.7,.9,level.spin.origin,300);
			playFx(level.chopper_fx["explode"]["medium"],level.artilleryShoot[0].origin);
			bullet = spawn("script_model",level.artilleryShoot[0].origin);
			bullet setModel("projectile_cbu97_clusterbomb");
			bullet.angles = vectorToAngles(level.artilleryShoot[1].origin - level.artilleryShoot[0].origin);
			trace = bulletTrace(level.artilleryShoot[0].origin,vector_scale(anglesToForward(bullet.angles),1000000),false,self)["position"];
			time = (distance(level.artilleryShoot[0].origin,trace)/3000);
			bullet moveTo(trace,time);
			bullet thread destroyBullet(time,self);
		}
		if(isButtonPressed("+activate"))
		{
			thread cannonActions(artilleryCase[curs]);
			if(artilleryCase[curs] == "view")
				wait .2;
		}
		if(isButtonPressed("+attack") || isButtonPressed("+speed_throw"))
		{
			curs += isButtonPressed("+attack");
			curs -= isButtonPressed("+speed_throw");
			if(curs >= artilleryOptions.size)
				curs = 0;
				
			if(curs < 0)
				curs = artilleryOptions.size-1;
				
			self.artillery["scrollBar"].y = ((curs*18)+90);
			wait .2;
		}
		if(isButtonPressed("+melee"))
		{
			thread exitCannonFunctions(self.artillery);
			break;
		}
		self disableWeapons();
		self freezeControls(true);
		wait .05;
	}
}
exitCannonFunctions(hudElem)
{
	self notify("switch_cannon");
	level notify("cannon_control");
	self show();
	self setOrigin(self.oldPos);
	level.cannonShoot = false;
	self unlink();
	self enableWeapons();
	self freezeControls(false);
	level.isUseingGun = false;
	self.lockMenu = false;
	self.useingCannon = false;
	setHealth(100);
	if(isDefined(self.cannonHud[0]))
		for(k = 0; k < self.cannonHud.size; k++)
			self.cannonHud[k] destroy();
			
	keys = getArrayKeys(hudElem);
	for(k = 0; k < keys.size && isDefined(hudElem[keys[k]]); k++)
		hudElem[keys[k]] destroy();
}
cannonActions(caseType)
{
	switch(caseType)
	{
		case "right":
			level.tilt linkTo(level.spin);
			level.spin rotateTo(level.spin.angles-(0,2,0),.05);
		break;
		case "left":
			level.tilt linkTo(level.spin);
			level.spin rotateTo(level.spin.angles+(0,2,0),.05);
		break;
		case "up":
			level.tilt unlink();
			if(level.tilt.angles[2] <= 25)
				level.tilt rotateTo(level.tilt.angles+(0,0,1),.05);
		break;
		case "down":
			level.tilt unlink();
			if(level.tilt.angles[2] >= -15)
				level.tilt rotateTo(level.tilt.angles-(0,0,1),.05);
		break;
		case "view":
			if(isDefined(self.cannonHud[0]))
				for(k = 0; k < self.cannonHud.size; k++)
					self.cannonHud[k] destroy();
					
			self notify("switch_cannon");
			self.next ++;
			if(self.next >= level.viewPoint.size)
				self.next = 0;
				
			self unlink();
			self setOrigin(level.viewPoint[self.next].origin);
			self linkTo(level.viewPoint[self.next]);
			self setPlayerAngles(level.viewAngle[self.next]);
			if(self.next == 2)
				thread runCannonAngles();
				
			wait .2;
		break;
	}
}
runCannonAngles()
{
	self endon("switch_cannon");
	coord = strTok("21,0,2,24;-20,0,2,24;0,-11,40,2;0,11,40,2;0,-39,2,57;0,39,2,57;-48,0,57,2;49,0,57,2;-155,-122,2,21;-154,122,2,21;155,122,2,21;155,-122,2,21;-145,132,21,2;145,-132,21,2;-145,-132,21,2;146,132,21,2",";");
	for(k = 0; k < coord.size; k++)
	{
		tCoord = strTok(coord[k],",");
		self.cannonHud[k] = createHuds(int(tCoord[0]),int(tCoord[1]),int(tCoord[2]),int(tCoord[3]));
	}
	for(;;)
	{
		self setPlayerAngles(vectorToAngles(level.artilleryShoot[1].origin - level.artilleryShoot[0].origin));
		wait .05;
	}
}
destroyBullet(time,owner)
{
	wait time;
	playFx(level.chopper_fx["explode"]["large"],self.origin);
	self playSound("exp_suitcase_bomb_main");
	radiusDamage(self.origin,250,200,90,owner);
	self delete();
	wait 1;
	level.cannonShoot = false;
}
spawnBox(pos,angle,model)
{
	box = spawn("script_model",pos);
	if(!isDefined(model))
		box setModel("com_plasticcase_beige_big");
	else
		box setModel(model);
		
	box.angles = angle;
	destroyArray(box);
	return box;
}
cannonDeath()
{
	level endon("cannon_delete");
	self waittill("death");
	if(self.useingCannon)
		thread exitCannonFunctions(self.artillery);
}