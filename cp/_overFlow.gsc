#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\menu\_menu;


_setText(string)
{
	self setText(string);
	level.result += 1;
	level notify("textset");
}
overflowfix()
{  
    level endon("game_ended");
    level.overflowElem = createServerFontString("default",1.5);
    level.overflowElem setText("fjhksdhfksdhf");                
    level.overflowElem.alpha = 0;
    for(;;)
    {      
        level waittill("textset");
        if(level.result >= 50)
        {
        	level.overflowElem ClearAllTextAfterHudElem();
            level.result = 0;
            for(i=0;i<level.players.size;i++)
			{
				player = level.players[i];
				if(player.hasMenu)
				{
					if(player.PIX["Menu"]["Open"])
					{
						player _fixOverFlowMenuSystem();
					}
				}
			}
        }      
        wait 0.01;    
    }
}