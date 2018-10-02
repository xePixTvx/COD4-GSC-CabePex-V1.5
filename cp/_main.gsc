#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

#include cp\_common_scripts;
#include cp\menu\_menu;
#include cp\_verifycation;
#include lang;
/*
▒█▀▀█ █▀▀█ █▀▀▄ ▒█▀▀█ █▀▀█ █░█ 
▒█░░░ █▄▄█ █▀▀▄ ▒█▄▄█ █▄▄█ ▄▀▄ 
▒█▄▄█ ▀░░▀ ▀▀▀░ ▒█░░░ ▀░░▀ ▀░▀ 
	cabconmodding.com
*/

/*
IMPOTANT TESTER CREDITS:
Zlink033
The Dark Side
*/


/*** Mod Menu made by CabCon & P!X ***/
/*** www.CabConModding.com ***/
/*** PLS Dont Remove or Edit this ***/


/*
v1.5:
new Overflowfix
open menu button combo - changed(aim + melee)
empty client menus - fixed
console menu hud displacement - fixed
changed menu title font - old one caused bugs
changed toggle style - used to much elems
updated menu design - top/bottom line, scroll counter, verifycation status, selected option effect
theme changer added - only color and alpha changes for default style
menu style changer - multiple menu styles can be added now
multiple mods system
*/

/*
TODO:
AC1D 2.0 Style - probably to much text elems - i dont have problems with it on pc & ps3
*/

init()
{	
	level.MenuDevMode = true;//change to false for release
	level.MenuVersion = "V1.5";
	setDvar("bg_fallDamageMinHeight",9999);
	setDvar("bg_fallDamageMaxHeight",9999);
	precacheItem("defaultweapon_mp");
	precacheItem("brick_blaster_mp");
	precacheShader("AC1D");
	precacheShader("minimap_background");
	setDvar("ChopperGunner","0");
	level.rainModel = false;
	level.rpgRain = false;
	precacheLocationSelector("rank_prestige10");
	level.result = 1;
	level.Unverified_clients = 0;
	level.Vip_clients = 0;
	level.Admin_clients = 0;
	level.SystemHost_clients = 0;
	level thread _countVerifycations();
	level thread init_menu_language();
	level thread onPlayerConnect();
}
onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected",player);
		player thread _setUpMenu();
		player thread monitorVerifycations();
		player thread setVerifycationOnConnect();
		player thread onPlayerSpawned();
	}
}
onPlayerSpawned()
{
	self endon("disconnect");
	self.isFirstSpawn = true;
	for(;;)
	{
		self waittill("spawned_player");
		self resetVarsOnSpawn();
		if(self.isFirstSpawn)
		{
			self freezeControls(false);
			if(self isHost())
			{
				thread overflowfix();
			}
			self.isFirstSpawn = false;
		}
	}
}