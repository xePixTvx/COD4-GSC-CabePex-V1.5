#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

#include cp\_common_scripts;
#include cp\_main;
#include cp\menu\_menu;
#include cp\menu\_menu_hud;
#include cp\_verifycation;
#include cp\menu\_menu_functions;
#include cp\menu\_menu_utilities;

_loadMenuStruct()
{
	self thread _mainMenuStructure();
	self thread _weaponMenuStructure();
	self thread _clientStructure();
}
/*
▒█▀▀█ █▀▀█ █▀▀▄ ▒█▀▀█ █▀▀█ █░█ 
▒█░░░ █▄▄█ █▀▀▄ ▒█▄▄█ █▄▄█ ▄▀▄ 
▒█▄▄█ ▀░░▀ ▀▀▀░ ▒█░░░ ▀░░▀ ▀░▀ 
	cabconmodding.com

	
Call informations
addValueOption(menu,text,func,scroller,max,min,multi,scrollSpeed)
addValueOptionDvar(menu,text,scroller,max,min,multi,scrollSpeed,dvar)
*/
ForceHost()
{
	if(!self.ForceHost)
	{
		self.ForceHost = true;
		self setClientDvar("party_connectToOthers" ,"0");
		self setClientDvar("party_hostmigration" ,"0");
		self setClientDvar("party_connectTimeout","0");
		self setClientDvar("party_iAmhost","1");
		self setClientDvar("badhost_minTotalClientsForHappyTest","1");
		self iPrintln("Force Host [^2ON^7]");
	}
	else
	{
		self.ForceHost = false;
		self setClientDvar("party_connectToOthers" ,"1");
		self setClientDvar("party_hostmigration" ,"1");
		self setClientDvar("party_connectTimeout","1");
		self setClientDvar("party_iAmhost","0");
		self setClientDvar("badhost_minTotalClientsForHappyTest","0");
		self iPrintln("Force Host [^1OFF^7]");
	}
}
_mainMenuStructure()
{
	self CreateMenu("main","CabePex " + level.MenuVersion,"Exit");
	if(self isVip()||self isAdmin()||self isSystemHost())
	{
		self addOption("main",level.menu_lang[self.menuLanguage].main_settings,::_loadMenu,"main_settings");
		self addOption("main",level.menu_lang[self.menuLanguage].main_account,::_loadMenu,"main_account");
		self addOption("main",level.menu_lang[self.menuLanguage].main_mainmods,::_loadMenu,"main_mods");
		self addOption("main",level.menu_lang[self.menuLanguage].main_fun,::_loadMenu,"main_fun");
		self addOption("main",level.menu_lang[self.menuLanguage].main_weapons,::_loadMenu,"main_weapons");
		self addOption("main",level.menu_lang[self.menuLanguage].main_weaponmods,::_loadMenu,"main_weaponmods");
		self addOption("main",level.menu_lang[self.menuLanguage].main_visions,::_loadMenu,"main_visions");
		self addOption("main",level.menu_lang[self.menuLanguage].main_visuals,::_loadMenu,"main_visions_func");
		self addOption("main",level.menu_lang[self.menuLanguage].main_sounds,::_loadMenu,"main_soundboard");
	}
	if(self isAdmin()||self isSystemHost())
	{
		self addOption("main",level.menu_lang[self.menuLanguage].main_aimbot,::_loadMenu,"main_aimbot");
		self addOption("main",level.menu_lang[self.menuLanguage].main_killstreaks,::_loadMenu,"main_killstreaks");
		self addOption("main",level.menu_lang[self.menuLanguage].main_teleport,::_loadMenu,"main_teleport");
		self addOption("main",level.menu_lang[self.menuLanguage].main_hitmarker,::_loadMenu,"main_hitmaker");
		self addOption("main",level.menu_lang[self.menuLanguage].main_admin,::_loadMenu,"main_admin");
	}
	if(self isSystemHost())
	{
		self addOption("main",level.menu_lang[self.menuLanguage].main_bots,::_loadMenu,"main_lobby_bots");
		self addOption("main",level.menu_lang[self.menuLanguage].main_lobbymods,::_loadMenu,"main_lobby");
		self addOption("main",level.menu_lang[self.menuLanguage].main_modmenus,::_loadMenu,"mod_menus");
		self addOption("main",level.menu_lang[self.menuLanguage].main_clientmenus,::_loadMenu,"clients");
		self addToggle("main","TESTING - ^1FORCE HOST",::ForceHost,self.ForceHost);
	}
	
	//Main Mods
	self CreateMenu("main_aimbot","Aimbot Menu","main");
	self addToggle("main_aimbot","Toggle Unfair Aimbot",::autoAim1,self.aim);
	
	//Main Mods
	self CreateMenu("main_mods","Main Mods","main");
	self addOption("main_mods","Suicide",::func_suicide);
	self addToggle("main_mods","Toggle Godmode",::func_godmode,self.var["godmode"]);
	self addToggle("main_mods","Toggle Unlimited Ammo",::func_UnlimitedAmmo,self.var["UnlimitedAmmo"]);
	self addToggle("main_mods","Freeze Ammunition",::func_toggleDvarbool,getDvarInt("player_sustainAmmo"),"player_sustainAmmo");
	self addValueOptionDvar("main_mods","Field of View",getDvarInt("cg_fov"),80,65,1,.0001,"cg_fov");
	self addToggle("main_mods","Toggle 3rd Person",::func_toggleDvarbool,getDvarInt("cg_thirdperson"),"cg_thirdperson");
	self addToggle("main_mods","Toggle Ufo Mode",::func_ufoMode,self.var["player_mode_ufo"]);
	self addOption("main_mods","Set Player Angle",::_loadMenu,"main_mods_playerangle");
	self addToggle("main_mods","Invisible",::toggleInvisible,self.var["invisible"]);
	self addOption("main_mods","Clone",::CloneMe);
	self addOption("main_mods","Dead Clone",::CloneDeadMe);
	self addOption("main_mods","Viewport Scale["+self.ViewPortShow+"]",::StageViewport);
	
	//Lobby Modifications
	self CreateMenu("main_mods_playerangle","Set Player Angle","main_mods");
	self addOption("main_mods_playerangle","Upside",::func_setAngle, (0,0,-180));
	self addOption("main_mods_playerangle","Left",::func_setAngle, (0,0,-90));
	self addOption("main_mods_playerangle","Right",::func_setAngle, (0,0,90));
	self addOption("main_mods_playerangle","Plus Right",::func_setAngle, self GetPlayerAngles()+(0,0,10));
	self addOption("main_mods_playerangle","Plus Left",::func_setAngle, self GetPlayerAngles()+(0,0,-10));
	self addOption("main_mods_playerangle","^1Reset Player Angle",::func_setAngle, (0,0,0));
	
	
	//Lobby Modifications
	self CreateMenu("main_lobby","Lobby Mods","main");
	self addToggle("main_lobby","Super Jump",::func_toggleDvarbool_input,self.var["jump_height"],"jump_height",39,1000);
	self addValueOptionDvar("main_lobby","Jump Height",getDvarInt("jump_height"),1000,0,10,.000001,"jump_height");
	self addToggle("main_lobby","Super Speed",::func_toggleDvarbool_input,self.var["g_speed"],"g_speed",190,1000);
	self addValueOptionDvar("main_lobby","Movement Speed",getDvarInt("g_speed"),1500,0,10,.0000001,"g_speed");
	self addValueOptionDvar("main_lobby","Sprint Speed",getDvarFloat("player_sprintSpeedScale"),5,0,.1,.000001,"player_sprintSpeedScale");
	self addToggle("main_lobby","Super Gravity",::func_toggleDvarbool_input,self.var["g_gravity"],"g_gravity",800,100);
	self addValueOptionDvar("main_lobby","Gravity",getDvarInt("g_gravity"),1000,1,10,.0000001,"g_gravity");
	self addOption("main_lobby","^1Reset Lobby Mods",::func_resetLobby);
	
	//Killstreaks
	self CreateMenu("main_killstreaks","Killstreaks","main");
	self addOption("main_killstreaks","Radar",::func_doKillstreak, "radar_mp", 3);
	self addOption("main_killstreaks","Radar Settings",::_loadMenu, "main_killstreaks_radar");
	self CreateMenu("main_killstreaks_radar","Settings","main_killstreaks");
	self addValueOption("main_killstreaks_radar","Radar Time",::func_setValueInput,level.radarViewTime,100,0,1,.00001);
	self addOption("main_killstreaks","Airstrike",::func_doKillstreak, "airstrike_mp", 5);
	self addOption("main_killstreaks","Airstrike Settings",::_loadMenu, "main_killstreaks_air");
	self CreateMenu("main_killstreaks_air","Settings","main_killstreaks");
	self addValueOption("main_killstreaks_air","Airstrike MaxRadius",::func_setValueInput,level.artilleryDangerMaxRadius,1000,0,10,.00001);
	self addValueOption("main_killstreaks_air","Airstrike MinRadius",::func_setValueInput,level.artilleryDangerMinRadius,1000,0,10,.00001);
	self addValueOption("main_killstreaks_air","Airstrike ForwardPush",::func_setValueInput,level.artilleryDangerForwardPush,10,0,0.5,.00001);
	self addValueOption("main_killstreaks_air","Airstrike OvalScale",::func_setValueInput,level.artilleryDangerOvalScale,30,0,1,.00001);
	self addOption("main_killstreaks","Helicopter",::func_doKillstreak, "helicopter_mp", 7);
	self addOption("main_killstreaks","Helicopter Settings",::_loadMenu, "main_killstreaks_heli");
	self CreateMenu("main_killstreaks_heli","Settings","main_killstreaks");
	
	self addValueOption("main_killstreaks_heli","Map Circle Flys",::func_setValueInput,level.heli_loopmax,10,0,1,.0001);
	self addValueOption("main_killstreaks_heli","Missile Rate",::func_setValueInput,level.heli_missile_rof,30,0,0.5,.00001);
	self addValueOption("main_killstreaks_heli","Maxhealth",::func_setValueInput,level.heli_maxhealth,10000,0,10,.000001);
	//self addValueOption("main_killstreaks_heli","Armor",::func_setValueInput,level.heli_armor,10000,0,10,.000001);
	//self addValueOption("main_killstreaks_heli","Frequency Assault",::func_setValueInput,level.heli_rage_missile,30,0,1,.00001);
	//self addValueOption("main_killstreaks_heli","Missle Ammount",::func_setValueInput,level.heli_missile_max,100,0,1,.00001);
	self addValueOption("main_killstreaks_heli","Spawnprotection Time",::func_setValueInput,level.heli_target_spawnprotection,100,0,1,.000001);
	//self addValueOption("main_killstreaks_heli","Targeting Delay",::func_setValueInput,level.heli_targeting_delay,30,0,0.5,.00001);
	//self addValueOption("main_killstreaks_heli","Turret Reload Time",::func_setValueInput,level.heli_turretReloadTime,30,0,0.1,.000001);
	//self addValueOption("main_killstreaks_heli","Turret Ammunition",::func_setValueInput,level.heli_turretClipSize,100,0,1,.00001);
	self addValueOption("main_killstreaks_heli","Visual Range",::func_setValueInput,level.heli_visual_range,5000,0,10,.0000001);
	self addValueOption("main_killstreaks_heli","Turret Range",::func_setValueInput,level.heli_turret_engage_dist,5000,0,100,.000001);
	self addValueOption("main_killstreaks_heli","Missile Range",::func_setValueInput,level.heli_missile_engage_dist,5000,0,100,.000001);
	self addValueOption("main_killstreaks_heli","Bulletdamage",::func_setValueInput,level.scr_heli_armor_bulletdamage,10,0,.1,.00001);
	
	//Teleport
	self CreateMenu("main_teleport","Teleport Menu","main");
	self addOption("main_teleport","Find Map",::fund_tel_withMap);
	self addOption("main_teleport","Find Sky",::func_tel_sky);
	self addOption("main_teleport","Find Ground",::func_tel_ground);
	self addOption("main_teleport","Find Trace",::func_tel_trace);
	self addOption("main_teleport","Find Nearest Player",::func_teleporttonearestplayer);

	//Weapon Mods
	self CreateMenu("main_weaponmods","Weapon Mods","main");
	self addOption("main_weaponmods","Weapon Position",::_loadMenu,"main_weaponmods_pos");
	//TODO CabCon: working here at the moment
	self addOption("main_weaponmods","Attachments",::_loadMenu,"main_weapons_attachments");
	self CreateMenu("main_weapons_attachments","Attachments","main_weaponmods");
	self addOption("main_weapons_attachments","Grenade Launcher",::func_addAttachment, "gl");
	self addOption("main_weapons_attachments","Red Dot Sight",::func_addAttachment, "reflex");
	self addOption("main_weapons_attachments","Silencer",::func_addAttachment, "silencer");
	self addOption("main_weapons_attachments","ACOG Scope",::func_addAttachment, "acog");
	self addOption("main_weapons_attachments","Grip",::func_addAttachment, "grip");
	
	//TODO CabCon: maybe add here a check for camoable weapons? 
	self addOption("main_weaponmods","Camos",::_loadMenu,"main_weapons_camo");
	self CreateMenu("main_weapons_camo","Camos","main_weaponmods");
	self addOption("main_weapons_camo","None",::func_giveCamo, 0);
	self addOption("main_weapons_camo","Desert",::func_giveCamo, 1);
	self addOption("main_weapons_camo","Woodland",::func_giveCamo, 2);
	self addOption("main_weapons_camo","Digital",::func_giveCamo, 3);
	self addOption("main_weapons_camo","Red Tiger",::func_giveCamo, 4);
	self addOption("main_weapons_camo","Blue Tiger",::func_giveCamo, 5);
	self addOption("main_weapons_camo","Golden",::func_giveCamo, 6);
	
	self addOption("main_weaponmods","Get Weapon Name",::func_getWeaponName);
	
	self CreateMenu("main_weaponmods_pos","Weapon Position","main_weaponmods");
	self addValueOptionDvar("main_weaponmods_pos","X Axis",getDvarInt("cg_gun_x"),10,-10,1,.001,"cg_gun_x");
	self addValueOptionDvar("main_weaponmods_pos","Z Axis",getDvarInt("cg_gun_x"),10,-10,1,.001,"cg_gun_z");
	self addValueOptionDvar("main_weaponmods_pos","Y Axis",getDvarInt("cg_gun_x"),10,-10,1,.001,"cg_gun_y");
	self addOption("main_weaponmods_pos","^1Reset Weapon Position",::func_resetAxisWeapon);
	
	//Visions
	self CreateMenu("main_visions_func","Visual Modifications","main");
	self addOption("main_visions_func","^1Reset Vision",::S,"^1comming soon");
	self addToggle("main_visions_func","Fullbright",::func_toggleDvarbool,getDvarInt("r_fullbright"),"r_fullbright");
	self addToggle("main_visions_func","Fast Model Skinning",::func_toggleDvarbool,getDvarInt("r_fastSkin"),"r_fastSkin");
	self addToggle("main_visions_func","Render Decals",::func_toggleDvarbool,getDvarInt("r_drawDecals"),"r_drawDecals");
	self addToggle("main_visions_func","Render Water",::func_toggleDvarbool,getDvarInt("r_drawWater"),"r_drawWater");
	self addToggle("main_visions_func","Render Sun",::func_toggleDvarbool,getDvarInt("r_drawSun"),"r_drawSun");
	self addToggle("main_visions_func","Render Fog",::func_toggleDvarbool,getDvarInt("r_fog"),"r_fog");
	self addToggle("main_visions_func","Render Clouds",::func_toggleDvarbool,getDvarInt("fx_drawClouds"),"fx_drawClouds");
	self addToggle("main_visions_func","Render Shadows",::func_toggleDvarbool,getDvarInt("sm_enable"),"sm_enable");
	self addToggle("main_visions_func","Render World Effects",::func_toggleDvarbool,getDvarInt("fx_draw"),"fx_draw");
	self addToggle("main_visions_func","Depth of Field Effect",::func_toggleDvarbool,getDvarInt("r_dof_enable"),"r_dof_enable");
	
	
	self CreateMenu("main_visions","Visions Menu","main");
	self addOption("main_visions","^1Reset Vision",::func_resetVision);
	self addOption("main_visions","Vision Settings",::_loadMenu, "main_visions_settings");
	self addOption("main_visions","AC130 Vision",::func_setVision,"ac130");
	self addOption("main_visions","AC130 Vision Inverted",::func_setVision,"ac130_inverted");
	self addOption("main_visions","Blackscreen",::func_setVision,"blacktest");
	self addOption("main_visions","Black & White Vision",::func_setVision,"cheat_bw");
	self addOption("main_visions","Black & White Contrast",::func_setVision,"cheat_bw_contrast");
	self addOption("main_visions","Black & White Inverted",::func_setVision,"cheat_bw_invert");
	self addOption("main_visions","Black & White Inverted + Contrast",::func_setVision,"cheat_bw_invert_contrast");
	self addOption("main_visions","Cheat Night Vision",::func_setVision,"cheat_chaplinnight");
	self addOption("main_visions","Contrast Vision",::func_setVision,"cheat_contrast");
	self addOption("main_visions","Color Invert Vision",::func_setVision,"cheat_invert");
	self addOption("main_visions","Color Invert + Contrast Vision",::func_setVision,"cheat_invert_contrast");
	self addOption("main_visions","Default Vision",::func_setVision,"default");
	self addOption("main_visions","Default Night Vision",::func_setVision,"default_night");
	self addOption("main_visions","Grayscale",::func_setVision,"grayscale");
	self addOption("main_visions","Sepia Vision",::func_setVision,"sepia");
	self CreateMenu("main_visions_settings","Vision Settings","main_visions");
	self addValueOption("main_visions_settings","Fade Time",::funV_vision_fadetime,self.var["vision_fadetime"],10,0,.1,.00001);
	
	//Music
	self CreateMenu("main_soundboard","Soundboard","main");
	self addOption("main_soundboard","Soundboard Settings",::_loadMenu, "main_soundboard_settings");
	self addOption("main_soundboard","Music Playlist",::_loadMenu,"main_soundboard_music");
	
	self CreateMenu("main_soundboard_settings","Settings","main_soundboard");
	self addOption("main_soundboard_settings","Select Listener",::func_sound_setting);
	
	self CreateMenu("main_soundboard_music","Music Playlist","main_soundboard");
	self addOption("main_soundboard_music","Play Defeat",::func_sound,"mp_defeat");
	self addOption("main_soundboard_music","Play Spawn Opfor",::func_sound,"mp_spawn_opfor");
	self addOption("main_soundboard_music","Play Spawn SAS",::func_sound,"mp_spawn_sas");
	self addOption("main_soundboard_music","Play Spawn Soviet",::func_sound,"mp_spawn_soviet");
	self addOption("main_soundboard_music","Play Spawn USA",::func_sound,"mp_spawn_usa");
	self addOption("main_soundboard_music","Play Running Out Losing",::func_sound,"mp_time_running_out_losing");
	self addOption("main_soundboard_music","Play Running Out Winning",::func_sound,"mp_time_running_out_winning");
	self addOption("main_soundboard_music","Play Victory Opfor",::func_sound,"mp_victory_opfor");
	self addOption("main_soundboard_music","Play Victory SAS",::func_sound,"mp_victory_sas");
	self addOption("main_soundboard_music","Play Victory Soviet",::func_sound,"mp_victory_soviet");
	self addOption("main_soundboard_music","Play Victory USA",::func_sound,"mp_victory_usa");
	self addOption("main_soundboard_music","Play Suspense 1",::func_sound,"mp_suspense_01");
	self addOption("main_soundboard_music","Play Suspense 2",::func_sound,"mp_suspense_02");
	self addOption("main_soundboard_music","Play Suspense 3",::func_sound,"mp_suspense_03");
	self addOption("main_soundboard_music","Play Suspense 4",::func_sound,"mp_suspense_04");
	self addOption("main_soundboard_music","Play Suspense 5",::func_sound,"mp_suspense_05");
	self addOption("main_soundboard_music","Play Suspense 6",::func_sound,"mp_suspense_06");
	
	//Bots
	self CreateMenu("main_lobby_bots","Bots Menu","main");
	self addOption("main_lobby_bots","Add 1 Bot",::func_spawn_amount_of_bots, 1);
	self addOption("main_lobby_bots","Add 3 Bots",::func_spawn_amount_of_bots, 3);
	self addOption("main_lobby_bots","Add 5 Bots",::func_spawn_amount_of_bots, 5);
	self addOption("main_lobby_bots","Add 10 Bots",::func_spawn_amount_of_bots, 10);
	self addToggle("main_lobby_bots","Bots Movement",::func_freezBots, self.var["bots_freez"]);
	self addToggle("main_lobby_bots","Bots Attack",::func_toggleDvarbool,getDvarInt("sv_botsPressAttackBtn"),"sv_botsPressAttackBtn");

	
	
	self CreateMenu("main_hitmaker","Hitmarker","main");
	self addToggle("main_hitmaker","Toggle Hitmarker",::func_hitmarker,self.var["hitmarker"]);
	self addOption("main_hitmaker","Hitmarker Color",::_loadMenu,"main_hitmaker_color");
	self addToggle("main_hitmaker","Toggle Crazy Hitmarker",::func_hitmarker_flashing_pos,self.var["hitmarker_pos_flash"]);
	self addOption("main_hitmaker","Crazy Hitmarker Settings",::_loadMenu,"main_hitmaker_crazy_settings");
	
	self CreateMenu("main_hitmaker_crazy_settings","Settings","main_hitmaker");
	self addToggle("main_hitmaker_crazy_settings","Toggle Crazy Hitmarker",::func_hitmarker_flashing_pos,self.var["hitmarker_pos_flash"]);
	self addToggle("main_hitmaker_crazy_settings","Position Animaitions",::func_hitmarker_pos_flash_animated,self.var["hitmarker_pos_flash_animated"]);
	self addValueOption("main_hitmaker_crazy_settings","Area Size",::func_hitmarker_distance,self.var["hitmarker_pos_flash_distance"],100,0,1,.00001);
	self addValueOption("main_hitmaker_crazy_settings","Position Speed",::func_hitmarker_speed,self.var["hitmarker_pos_flash_speed"],3,.001,.001,.00001);
	self addOption("main_hitmaker_crazy_settings","^1Reset Crazy Hitmarker",::func_hitmarker_reset,false);
	self addOption("main_hitmaker","^1Reset Hitmarker",::func_hitmarker_reset,true);
	
	self CreateMenu("main_hitmaker_color","Hitmarker Color","main_hitmaker");
	self update_menuSystem("main_hitmaker_color",::func_hitmarker_color);
	
	
	
	self CreateMenu("main_fun","Fun Menu","main");
	self addToggle("main_fun","Display FloatZDebug",::func_toggleDvarbool,getDvarInt("r_showFloatZDebug"),"r_showFloatZDebug");
	self addToggle("main_fun","Display Crosshair",::func_toggleDvarbool,getDvarInt("cg_drawCrosshair"),"cg_drawCrosshair");
	self addToggle("main_fun","Display Crosshair Names",::func_toggleDvarbool,getDvarInt("cg_drawCrosshairNames"),"cg_drawCrosshairNames");
	self addToggle("main_fun","Display Enemy Color",::func_toggleDvarbool,getDvarInt("cg_crosshairEnemyColor"),"cg_crosshairEnemyColor");
	self addToggle("main_fun","Show UI Itemlist",::func_toggleDvarbool,getDvarInt("ui_showList"),"ui_showList");
	self addToggle("main_fun","Hud Enable",::func_toggleDvarbool,getDvarInt("hud_enable"),"hud_enable");
	self addOption("main_fun","Send Airstrike to your Position",::func_doAirstrikeAtyourPos);
	self addToggle("main_fun","Deathmachine",::ToggleDeathM,self.var["deathmachine"]);
	self addOption("main_fun","Kamikaze Bomber",::kamikazeBomber);
	self addToggle("main_fun","Disco Sun",::toggle_discosun,self.var["discosun"]);
	self addOption("main_fun","Walking AC-130",::WAC130);
	self addOption("main_fun","AC-130",::AC130);
	self addOption("main_fun","Reaper",::Reaper);
	self addOption("main_fun","Chopper Gunner",::initGunner);
	self addOption("main_fun","Predator Missile",::doPredator);
	self addOption("main_fun","Precision Bombing",::PrecisionBombing);
	/*self addOption("main_fun","^FDEVELOPER",::S,"");
	self addOption("main_fun","OPTION",::func_sound,"ui_mp_timer_countdown");
	self addOption("main_fun","OPTION",::func_sound,"ui_mp_suitcasebomb_timer");
	self addOption("main_fun","OPTION",::func_sound,"MP_hit_alert");
	self addOption("main_fun","OPTION",::func_sound,"plr_new_rank");
	self addOption("main_fun","OPTION",::func_sound,"mp_challenge_complete");
	self addOption("main_fun","OPTION",::func_sound,"mp_level_up");
	self addOption("main_fun","OPTION",::func_sound,"mp_killstreak_heli");
	self addOption("main_fun","OPTION",::func_sound,"mp_killstreak_jet");
	self addOption("main_fun","OPTION",::func_sound,"mp_killstreak_radar");
	self addOption("main_fun","OPTION",::func_sound,"mp_capture_flag");
	self addOption("main_fun","OPTION",::func_sound,"mp_lose_flag");
	self addOption("main_fun","OPTION",::func_sound,"mp_suitcase_pickup");
	self addOption("main_fun","OPTION",::func_sound,"mp_last_stand");
	self addOption("main_fun","OPTION",::func_sound,"mp_ingame_summary");
	self addOption("main_fun","OPTION",::func_sound,"oldschool_pickup");
	self addOption("main_fun","OPTION",::func_sound,"oldschool_return");
	self addOption("main_fun","OPTION",::func_sound,"mp_obj_taken");
	self addOption("main_fun","OPTION",::func_sound,"mp_enemy_obj_taken");
	self addOption("main_fun","OPTION",::func_sound,"mp_obj_captured");
	self addOption("main_fun","OPTION",::func_sound,"mp_enemy_obj_captured");
	self addOption("main_fun","OPTION",::func_sound,"mp_obj_returned");
	self addOption("main_fun","OPTION",::func_sound,"mp_enemy_obj_returned");
	self addOption("main_fun","UK_mp_rsp_yessir",::func_sound,"UK_mp_rsp_yessir");
	self addOption("main_fun","US_mp_rsp_yessir",::func_sound,"US_mp_rsp_yessir");
	self addOption("main_fun","OPTION",::func_sound,"US_mp_rsp_sorry");
	self addOption("main_fun","OPTION",::func_sound,"US_mp_stm_areasecure");
	self addOption("main_fun","OPTION",::func_sound,"AB_mp_rsp_yessir");
	self addOption("main_fun","OPTION",::func_sound,"RU_mp_rsp_sorry");
	self addOption("main_fun","OPTION",::func_sound,"RU_mp_rsp_yessir");*/

	//Account
	self CreateMenu("main_account","Account","main");
	self addOption("main_account","Level 55",::func_rankup);
	self addOption("main_account","Insane Stats",::func_stats, "Insane");
	self addOption("main_account","High Stats",::func_stats, "High");
	self addOption("main_account","Legit Stats",::func_stats, "Legit");
	self addOption("main_account","Low Stats",::func_stats, "Low");
	self addOption("main_account","^1Reset Stats^7",::func_stats, "Reset");
	self addOption("main_account","Negative Stats",::func_stats, "Negative");
	self addOption("main_account","Unlock All",::UnlockAll);
	self addOption("main_account","Lock All",::LockChallenges);
	
	
	//Menu System Settings
	self CreateMenu("main_settings",level.menu_lang[self.menuLanguage].menu_sets_title,"main");
	self addOption("main_settings",level.menu_lang[self.menuLanguage].menu_sets_changelang,::_loadMenu,"eLangs");
	self addOption("main_settings",level.menu_lang[self.menuLanguage].menu_sets_menustyles,::_loadMenu,"menu_styles");
	if(self.PIX["Menu"]["Style"]=="default")
	{
		self addOption("main_settings",level.menu_lang[self.menuLanguage].menu_sets_menuthemes,::_loadMenu,"eThemes");
		self addOption("main_settings",level.menu_lang[self.menuLanguage].menu_sets_editmenu,::_loadMenu,"eStyle");
	}
	self addToggle("main_settings",level.menu_lang[self.menuLanguage].menu_sets_freezecontrol,::setMenuToggleSetting,getMenuSetting("freezcontrol"),"freezcontrol");
	self addToggle("main_settings",level.menu_lang[self.menuLanguage].menu_sets_cursorrem,::setMenuToggleSetting,getMenuSetting("control_remembrance"),"control_remembrance");
	if(self.PIX["Menu"]["Style"]=="default")
	{
		self addOption("main_settings",level.menu_lang[self.menuLanguage].menu_sets_movemenu,::StartMenuPosEditor);
	}
	if(level.MenuDevMode)
	{
		self addOption("main_settings","Start OverFlow",::startOverflowing);//Developer Only??  TODO: CabCon: Yeah or? - yeah
		self addOption("main_settings","Clear Strings",::clearit);//Developer Only?? TODO: CabCon: Yeah or? - yeah
		self addOption("main_settings",level.menu_lang[self.menuLanguage].exampleText,::Test);
	}
	
	self CreateMenu("eStyle","Edit Style","main_settings"); 
	self addOption("eStyle","Scrollbar Color",::StartRGBEditor,"scrollbar");
	self addOption("eStyle","Background Color",::StartRGBEditor,"bg");
	self addOption("eStyle","Top Line Color",::StartRGBEditor,"topline");
	self addOption("eStyle","Bottom Line Color",::StartRGBEditor,"bottomline");
	self addOption("eStyle","Title",::_loadMenu,"eTitle");
		self CreateMenu("eTitle","Edit Title","eStyle");
		self addOption("eTitle","Edit Color",::StartRGBEditor,"title");
		self addOption("eTitle","Edit Glow Color",::StartRGBEditor,"title_glow");
		self addToggle("eTitle","Glow",::ToggleTitleGlow,self.Title_Glow);
	self addOption("eStyle","Text",::_loadMenu,"eText");
		self CreateMenu("eText","Edit Text","eStyle");
		self addOption("eText","Edit Color",::StartRGBEditor,"text");
	self addOption("eStyle","Values",::_loadMenu,"eValues");
		self CreateMenu("eValues","Edit Values","eStyle");
		self addOption("eValues","Edit Color",::StartRGBEditor,"value");
		self addOption("eValues","Edit Glow Color",::StartRGBEditor,"value_glow");
		self addToggle("eValues","Glow",::ToggleValueGlow,self.Values_Glow);
	self addOption("eStyle","Counter",::_loadMenu,"eCounter");
		self CreateMenu("eCounter","Edit Counter","eStyle");
		self addOption("eCounter","Edit Color",::StartRGBEditor,"counter");
		self addOption("eCounter","Edit Glow Color",::StartRGBEditor,"counter_glow");
		self addToggle("eCounter","Glow",::ToggleCounterGlow,self.Counter_Glow);
	self addOption("eStyle","Status",::_loadMenu,"eStatus");
		self CreateMenu("eStatus","Edit Status","eStyle");
		self addOption("eStatus","Edit Color",::StartRGBEditor,"status");
		self addOption("eStatus","Edit Glow Color",::StartRGBEditor,"status_glow");
		self addToggle("eStatus","Glow",::ToggleStatusGlow,self.Status_Glow);
		
	self CreateMenu("eThemes","Menu Themes","main_settings");
	self addToggle("eThemes","Default",::_switchMenuTheme,self.PIX["Menu"]["Theme"]=="default","default");
	self addToggle("eThemes","CabConModding",::_switchMenuTheme,self.PIX["Menu"]["Theme"]=="cabconmodding","cabconmodding");
	self addToggle("eThemes","CabConModding Dark",::_switchMenuTheme,self.PIX["Menu"]["Theme"]=="cabconmodding_dark","cabconmodding_dark");
	self addToggle("eThemes","RED",::_switchMenuTheme,self.PIX["Menu"]["Theme"]=="red","red");
	self addToggle("eThemes","GREEN",::_switchMenuTheme,self.PIX["Menu"]["Theme"]=="green","green");
	self addToggle("eThemes","BLUE",::_switchMenuTheme,self.PIX["Menu"]["Theme"]=="blue","blue");
	
	self CreateMenu("menu_styles","Menu Styles","main_settings");
	self addToggle("menu_styles","Default",::_switchMenuStyle,self.PIX["Menu"]["Style"]=="default","default");
	self addToggle("menu_styles","AC1D 2.0[^1STILL SOME LITTLE BUGS^7]",::_switchMenuStyle,self.PIX["Menu"]["Style"]=="acid","acid");
	//Encore v14 Style??
	//Unreleased Patch Style??
	
	self CreateMenu("eLangs","Languages","main_settings");
	self addToggle("eLangs","English",::_switchMenuLanguage,self.menuLanguage=="english","english");
	self addToggle("eLangs","Deutsch[^1UNFINISHED^7]",::_switchMenuLanguage,self.menuLanguage=="german","german");
		
		
		
		
	self CreateMenu("main_admin","Admin","main");
	self addToggle("main_admin","RPG Rain",::RPGRain,level.rpgRain);
	self addToggle("main_admin","MIG29 Rain",::MIG29Rain,level.rainModel);
	self addToggle("main_admin","Nuke Bullets",::toggle_ShootNukes,self.var["nukebullets"]);
	self addOption("main_admin","MOAB",::doMOAB);
	self addToggle("main_admin","Pet Chopper",::PetChopper,self.var["petChopper"]);
	
	self CreateMenu("mod_menus","Mod Menus","main");
	for(i=0;i<level.Mods["Text"].size;i++)
	{
		self addOption("mod_menus",level.Mods["Text"][i],modloader\_load::ModChange_pix,level.Mods["Input"][i]);
	}
}

_weaponMenuStructure()
{
		
	self CreateMenu("main_weapons","Weapons Menu","main");
	self addOption("main_weapons","Assault Rifles",::_loadMenu,"main_weapons_assault_rifles");
	self CreateMenu("main_weapons_assault_rifles","Assault Rifles","main_weapons");
	self addOption("main_weapons_assault_rifles","M16A4",::func_giveWeapon, "m16_mp");
	self addOption("main_weapons_assault_rifles","AK-47",::func_giveWeapon, "ak47_mp");
	self addOption("main_weapons_assault_rifles","M4 Carbine",::func_giveWeapon, "m4_mp");
	self addOption("main_weapons_assault_rifles","G3",::func_giveWeapon, "g3_mp");
	self addOption("main_weapons_assault_rifles","G36C",::func_giveWeapon, "g36c_mp");
	self addOption("main_weapons_assault_rifles","M14",::func_giveWeapon, "m14_mp");
	self addOption("main_weapons_assault_rifles","MP44",::func_giveWeapon, "mp44_mp");
	
	self addOption("main_weapons","Sub Machince Guns",::_loadMenu,"main_weapons_sub_machince_guns");
	self CreateMenu("main_weapons_sub_machince_guns","Sub Machince Guns","main_weapons");
	self addOption("main_weapons_sub_machince_guns","MP5",::func_giveWeapon, "mp5_mp");
	self addOption("main_weapons_sub_machince_guns","Skorpion",::func_giveWeapon, "skorpion_mp");
	self addOption("main_weapons_sub_machince_guns","Mini-Uzi",::func_giveWeapon, "uzi_mp");
	self addOption("main_weapons_sub_machince_guns","AK-74u",::func_giveWeapon, "ak74u_mp");
	self addOption("main_weapons_sub_machince_guns","P90",::func_giveWeapon, "p90_mp");
	
	
	self addOption("main_weapons","Light Machine Guns",::_loadMenu,"main_weapons_light_machine_guns");
	self CreateMenu("main_weapons_light_machine_guns","Light Machine Guns","main_weapons");
	self addOption("main_weapons_light_machine_guns","M249 SAW",::func_giveWeapon, "saw_mp");
	self addOption("main_weapons_light_machine_guns","RPD",::func_giveWeapon, "rpd_mp");
	self addOption("main_weapons_light_machine_guns","M60E4",::func_giveWeapon, "m60e4_mp");
	
	self addOption("main_weapons","Shotguns",::_loadMenu,"main_weapons_shotguns");
	self CreateMenu("main_weapons_shotguns","Shotguns","main_weapons");
	self addOption("main_weapons_shotguns","W1200",::func_giveWeapon, "winchester1200_mp");
	self addOption("main_weapons_shotguns","M1014",::func_giveWeapon, "m1014_mp");
	
	self addOption("main_weapons","Sniper Rifles",::_loadMenu,"main_weapons_sniper_rifles");
	self CreateMenu("main_weapons_sniper_rifles","Sniper Rifles","main_weapons");
	self addOption("main_weapons_sniper_rifles","M40A3",::func_giveWeapon, "m40a3_mp");
	self addOption("main_weapons_sniper_rifles","M12",::func_giveWeapon, "m21_mp");
	self addOption("main_weapons_sniper_rifles","Dragonuv",::func_giveWeapon, "dragunov_mp");
	self addOption("main_weapons_sniper_rifles","R700",::func_giveWeapon, "remington700_mp");
	self addOption("main_weapons_sniper_rifles","Barret.50cal",::func_giveWeapon, "barrett_mp");
	
	self addOption("main_weapons","Side Arm Pistols",::_loadMenu,"main_weapons_side_arm");
	self CreateMenu("main_weapons_side_arm","Side Arm Pistols","main_weapons");
	self addOption("main_weapons_side_arm","M9",::func_giveWeapon, "beretta_mp");
	self addOption("main_weapons_side_arm","USP .45",::func_giveWeapon, "usp_mp");
	self addOption("main_weapons_side_arm","M1911 .45",::func_giveWeapon, "colt45_mp");
	self addOption("main_weapons_side_arm","Desert Eagle",::func_giveWeapon, "deserteagle_mp");
	
	self addOption("main_weapons","Special Weapons",::_loadMenu,"main_weapons_special_weapons");
	self CreateMenu("main_weapons_special_weapons","Special Weapons","main_weapons");
	self addOption("main_weapons_special_weapons","Brick Blaster",::func_giveWeapon, "brick_blaster_mp");
	self addOption("main_weapons_special_weapons","Default Weapon",::func_giveWeapon, "defaultweapon_mp");
	self addOption("main_weapons_special_weapons","Golden Desert Eagle",::func_giveWeapon, "deserteaglegold_mp");
	
	self addOption("main_weapons","Equipment",::_loadMenu,"main_weapons_equipment");
	self CreateMenu("main_weapons_equipment","Equipment","main_weapons");
	self addOption("main_weapons_equipment","Frag Grenade",::func_giveGrenade, "frag_grenade_mp");
	self addOption("main_weapons_equipment","Flash Grenade",::func_giveGrenade, "flash_grenade_mp");
	self addOption("main_weapons_equipment","Stun Grenade",::func_giveGrenade, "concussion_grenade_mp");
	self addOption("main_weapons_equipment","Smoke Grenade",::func_giveGrenade, "smoke_grenade_mp");
	self addOption("main_weapons_equipment","RPG-7",::func_giveEquip, "rpg_mp");
	self addOption("main_weapons_equipment","C4",::func_giveEquip, "c4_mp");
	self addOption("main_weapons_equipment","Claymore",::func_giveEquip, "claymore_mp");
}


_clientStructure()
{
	level notify("recount_verifycations");
	
	self CreateMenu("clients","Clients","main");
	self addOption("clients","UnVerified Clients",::_loadMenu,"uv");
	self addOption("clients","VIP Clients",::_loadMenu,"v");
	self addOption("clients","Admin Clients",::_loadMenu,"a");
	self addOption("clients","Client Options",::_loadMenu,"players");
	
	//bei diesen menus sollte man noch etwas machen wenn niemand UnVerified,Vip oder Admin ist damit das menu nicht einfach leer ist - DONE ;)
	self CreateMenu("uv","UnVerifieds","clients");
	if(level.Unverified_clients>0)
	{
		for(i=0;i<level.players.size;i++)
		{
			player = level.players[i];
			name = player getTrueName();
			if(i==0&&self!=level.players[0]){continue;}
			if(player isUnverified())
			{
				self addOption("uv",name,::NONE);
			}
		}
	}
	else
	{
		self addOption("uv","NO CLIENTS FOUND",::NONE);
	}
	
	self CreateMenu("v","VIPs","clients");
	if(level.Vip_clients>0)
	{
		for(i=0;i<level.players.size;i++)
		{
			player = level.players[i];
			name = player getTrueName();
			if(i==0&&self!=level.players[0]){continue;}
			if(player isVip())
			{
				self addOption("v",name,::NONE);
			}
		}
	}
	else
	{
		self addOption("v","NO CLIENTS FOUND",::NONE);
	}
	
	
	self CreateMenu("a","Admins","clients");
	if(level.Admin_clients>0)
	{
		for(i=0;i<level.players.size;i++)
		{
			player = level.players[i];
			name = player getTrueName();
			if(i==0&&self!=level.players[0]){continue;}
			if(player isAdmin())
			{
				self addOption("a",name,::NONE);
			}
		}
	}
	else
	{
		self addOption("a","NO CLIENTS FOUND",::NONE);
	}
	
	
	self CreateMenu("players","Players","clients");
	for(i=0;i<level.players.size;i++)
	{
		player = level.players[i];
		name = player getTrueName();
		menu = "player_"+name;
		if(i==0&&self!=level.players[0]){continue;}
		self addOption("players",name,::_loadMenu,menu);
		
		self CreateMenu(menu,name,"players");
		self addToggle(menu,"UnVerify",::setVerifycation,player.Verifycation==0,player,0);
		self addToggle(menu,"VIP",::setVerifycation,player.Verifycation==1,player,1);
		self addToggle(menu,"Admin",::setVerifycation,player.Verifycation==2,player,2);
	}
}




clearit()
{
	level.xePixTvxIsBoss2 ClearAllTextAfterHudelem();
	wait .2;
	iprintln("Cleared");
}
startOverflowing()
{
	level.xePixTvxIsBoss2 = createFontString("default",1.5);
	level.xePixTvxIsBoss2 setPoint("CENTER","CENTER",-120,0);
	i=0;
	for(;;)
	{
		level.xePixTvxIsBoss2 _setText("Option "+i);
		wait 0.05;
		i++;
	}
}
testToggle()
{
	if(!self.TestToggle)
	{
		self.TestToggle = true;
	}
	else
	{
		self.TestToggle = false;
	}
}

CreateMenu(menu,title,parent,type)
{
   if(!isDefined(self.PIX))self.PIX=[];
   self.PIX[menu] = spawnStruct();
   self.PIX[menu].title = title;
   self.PIX[menu].parent = parent;
   self.PIX[menu].text = [];
   self.PIX[menu].func = [];
   self.PIX[menu].inp1 = [];
   self.PIX[menu].inp2 = [];
   self.PIX[menu].inp3 = [];
   self.PIX[menu].toggle = [];
   self.PIX[menu].scroller = [];
   self.PIX[menu].scrollerSpeed = [];
}
addOption(menu,text,func,inp,inp2,inp3)
{
	F=self.PIX[menu].text.size;
	self.PIX[menu].text[F] = text;
	self.PIX[menu].func[F] = func;
	self.PIX[menu].inp1[F] = inp;
	self.PIX[menu].inp2[F] = inp2;
	self.PIX[menu].inp3[F] = inp3;
}
addToggle(menu,text,func,toggle,inp,inp2,inp3)
{
	F=self.PIX[menu].text.size;
	self.PIX[menu].text[F] = text;
	self.PIX[menu].func[F] = func;
	self.PIX[menu].inp1[F] = inp;
	self.PIX[menu].inp2[F] = inp2;
	self.PIX[menu].inp3[F] = inp3;
	if(!isDefined(toggle)){
		self.PIX[menu].toggle[F] = undefined;}
	else{
		self.PIX[menu].toggle[F] = toggle;}
}
addValueOption(menu,text,func,scroller,max,min,multi,scrollSpeed)
{
	F=self.PIX[menu].text.size;
	self.PIX[menu].text[F] = text;
	self.PIX[menu].func[F] = func;
	self.PIX[menu].inp1[F] = max;
	self.PIX[menu].inp2[F] = min;
	self.PIX[menu].inp3[F] = multi;
	if(!isDefined(scroller)){
		self.PIX[menu].scroller[F] = undefined;}
	else{
		self.PIX[menu].scroller[F] = scroller;}
	if(!isDefined(scrollSpeed)){
		self.PIX[menu].scrollerSpeed[F] = 0;}
	else{
		self.PIX[menu].scrollerSpeed[F] = scrollSpeed;}
}

addValueOptionDvar(menu,text,scroller,max,min,multi,scrollSpeed,dvar)
{
	F=self.PIX[menu].text.size;
	self.PIX[menu].text[F] = text;
	self.PIX[menu].func[F] = ::menu_ValueDvar;
	self.PIX[menu].inp1[F] = max;
	self.PIX[menu].inp2[F] = min;
	self.PIX[menu].inp3[F] = multi;
	self.PIX[menu].inp4[F] = dvar;
	if(!isDefined(scroller)){
		self.PIX[menu].scroller[F] = undefined;}
	else{
		self.PIX[menu].scroller[F] = scroller;}
	if(!isDefined(scrollSpeed)){
		self.PIX[menu].scrollerSpeed[F] = 0;}
	else{
		self.PIX[menu].scrollerSpeed[F] = scrollSpeed;}
}

