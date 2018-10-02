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
#include cp\menu\_menu_functions;

/*

▒█▀▀█ █▀▀█ █▀▀▄ ▒█▀▀█ █▀▀█ █░█ 
▒█░░░ █▄▄█ █▀▀▄ ▒█▄▄█ █▄▄█ ▄▀▄ 
▒█▄▄█ ▀░░▀ ▀▀▀░ ▒█░░░ ▀░░▀ ▀░▀ 
	cabconmodding.com



	These are the HELPFULL CODES!
	
	
Notes:

Dvars:
r_blur / Min: 0 Max: 32 Def: 0 // Blur screen
r_brightness / Min: -1 Max: 1 Def: 0 //Brightness of the screen
r_colorMap / Min: 0 Max: 3 Def: 1 //Change the color map from Black, white, Gray
r_contrast / Min: 0 Max:4 Def: 1 // contrast of screen
r_debugShader //Change debug shaders
r_desaturation //grey shader
r_diffuseColorScale //Scale of light at explosions/traces 
r_dof_enable //Death of field
r_drawDecals //Draw decals
r_drawSun //draw sun 
r_drawWater //draw water
r_fastSkin //fast model rendering
r_fog //fog 
r_fullbright
r_lightMap // light map
r_normalMap //details 
r_specular //phong specular lighting
r_specularColorScale //0-100
r_specularMap
r_showFbColorDebug // 
r_showFloatZDebug 
r_zfar 
fx_draw
fx_drawClouds
jump_height
sm_enable
cg_drawCrosshair
cg_drawCrosshairNames
cg_crosshairEnemyColor

^
FUNCTIONS:

//MagicBullet(type, self getEye() + (100,50,1500), self getTrace(), self);





NEW DVARS

ui_showList def: 0 show list of ui things
hud_enable def: 1

*/
S(i)
{
	self iprintln(i);
}

L(i)
{
	self iprintln("developer: ^1"+i);
}

E(i)
{
	S("^1"+i);
}
//is ? true or false

isEmpty(var)
{
    if(var == "" || !isDefined(var))
        return true;
    else
        return false;
}

isSprinting()
{
    v = self getVelocity();
    if(v[0] >= 200 || v[1] >= 200 || v[0] <= -200 || v[1] <= -200)
        return true;
    return false;
}

isSolo()
{
    if(level.players.size <= 1)
        return true;
    return false;
}

vector_scal(vec, scale)
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}

//getter
getMapName()
{
	return getdvar( "mapname" );
}
getCurrent()
{
	return self.PIX["CurrentMenu"];
}

getScroll()
{
	return self.Scroller[getCurrent()];
}

getOptionName()
{
	return self.PIX[getCurrent()].text[getScroll()];
}
getOrg()
{
	return self getOrigin();
}
getTrace()
{
	return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
}
getAllPlayers() //Returns array of all players on the server.
{
	return getEntArray( "player", "classname" );
}
getRandomPlayer() //Returns array of all players on the server.
{
	return getAllPlayers()[randomIntRange(0,getAllPlayers().size)];
}
func_sound_on_player(i)
{
	self PlaySound(i);
}
func_playSoundOnAllPlayers(i)
{
	for(i=0; i<getAllPlayers().size; i++)
		getAllPlayers()[i] playLocalSound(i);
}
func_cleanScreen()
{
	for(i=0; i<6; i++)
	{
		self iPrintlnBold("");
		self iPrintln("");
	}
}
///menu settings
setMenuToggleSetting(item)
{
	if(isEmpty(item))
	{
		E("Error: Needed Parameters not defined");
		return;
	}
	setMenuSetting(item,!self.menu[item]);
}
setMenuSetting(item,value)
{
	if(isEmpty(item) || isEmpty(value))
	{
		E("Error: Needed Parameters not defined");
		return;
	}
	if(self.menu[item] == value)
	{
		S("The Value is already setted to this value.");
		return; 
	}
	self.menu[item] = value;
	S(item+" setted to ^2"+getBoolintoString(self.menu[item]));

}
getMenuSetting(item)
{
	return self.menu[item];
}

getBoolintoString(input)
{
	if(input)
		return "^2ON";
	else
		return "^1OFF";
}


//Menu Struct
update_menuSystem(menu,function)
{	
	self addOption(menu,"Red", function, (1,0,0));
    self addOption(menu,"Blue", function, (0,0,1));
    self addOption(menu,"Green", function, (0,1,0));
    self addOption(menu,"Yellow", function, (1,1,0));
    self addOption(menu,"Cyan", function, (0,1,1));
	self addOption(menu,"Royal Blue", function, ((34/255),(64/255),(139/255)));
    self addOption(menu,"Raspberry", function, ((135/255),(38/255),(87/255)));
    self addOption(menu,"Skyblue", function, ((135/255),(206/255),(250/250)));
    self addOption(menu,"Hot Pink", function, ((1),(0.0784313725490196),(0.5764705882352941)));
    self addOption(menu,"Dark Green", function, (0/255, 51/255, 0/255));
    self addOption(menu,"Brown", function, ((0.5450980392156863),(0.2705882352941176),(0.0745098039215686)));
    self addOption(menu,"Maroon Red", function, (128/255,0,0));
    self addOption(menu,"Orange", function, (1,0.5,0));
    self addOption(menu,"Purple", function, ((0.6274509803921569),(0.1254901960784314),(0.9411764705882353)));
    self addOption(menu,"Black", function, (0,0,0));
    self addOption(menu,"White", function, (1,1,1));
	if(menu == "main_hitmaker_color")
		self addOption(menu,"Random Color Loop",::func_hitmarker_colorLoop);
	
}









