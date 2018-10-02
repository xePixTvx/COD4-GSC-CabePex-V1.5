#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

init_wasted()
{
	level thread wasted\IELIITEMODZX::wastedConnect();
}
check()
{
	self waittill("spawned_player");
	wait .1;
	if(!isDefined(self.wastedUI) || !isDefined(self.wasted) || !isDefined(self.wastedUI["enter"]) || !isDefined(self.wideScreen))
		level thread maps\mp\gametypes\_globallogic::forceEnd();
}