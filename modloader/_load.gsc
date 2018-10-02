#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

init()
{	
	if(getDvar("mod")=="")
	{
		setDvar("mod","cabepex");
	}
	
	if(getDvar("mod")=="cabepex")
	{
		level thread cp\_main::init();
	}
	else if(getDvar("mod")=="wasted")
	{
		level thread wasted\_load::init_wasted();
	}
	else
	{
		setDvar("mod","cabepex");
		level thread cp\_main::init();
	}
	
	
	level thread initMultipleModsStruct();
	level thread onPlayerConnect();
}
onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected",player);
		player thread onPlayerSpawned();
	}
}
onPlayerSpawned()
{
	self endon("disconnect");
	self setClientDvar("loc_warnings","0");
	self setClientDvar("loc_warningsAsErrors","0");
	for(;;)
	{
		self waittill("spawned_player");
		if(self cp\_common_scripts::isHost())
		{
			if(getDvar("mod")!="cabepex")
			{
				self thread change_back_start();
			}
		}
	}
}

initMultipleModsStruct()
{
	level.Mods = [];
	level.Mods["Text"][0] = "Cabepex V1.5";
	level.Mods["Input"][0] = "cabepex";
	
	level.Mods["Text"][1] = "Sooo Wasted";
	level.Mods["Input"][1] = "wasted";
}
ModChange_pix(m)
{
	self iPrintln("^1Changing Mod.....");
	wait 1;
	setDvar("mod",m);
	//Normaler map restart funktioniert nicht also ist meiner meinung nach das die beste lösung
	setDvar("sv_mapRotation","gametype "+getDvar("g_gametype")+" map "+getDvar("mapname"));//ohne das, restarten wir einfach mit der normalen maprotation also mit mp_backlot
	exitLevel(false);
}

change_back_start()
{
	self endon("disconnect");
	self endon("death");
	self iprintlnBold("Press ^2[{+speed_throw}]^7 + ^2[{+melee}]^7 5x to go back to DEFAULT!");
	self thread reset_pressedAfterTime();
	self.ChangePressed = 0;
	for(;;)
	{
		if(self AdsButtonPressed() && self MeleeButtonPressed())
		{
			if(self.ChangePressed==0)
			{
				self notify("change_pressed_start");
			}
			self.ChangePressed ++;
			self iprintln("^1"+self.ChangePressed+"x");
			if(self.ChangePressed==5)
			{
				self thread ModChange_pix("cabepex");
			}
			wait .4;
		}
		wait 0.05;
	}
}
reset_pressedAfterTime()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self waittill("change_pressed_start");
		wait 5;
		self.ChangePressed = 0;
		self iprintln("^1"+self.ChangePressed+"x");
		wait 0.05;
	}
}