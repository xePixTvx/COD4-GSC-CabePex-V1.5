#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

createText(font, fontscale, align, relative, x, y, sort, color, alpha, glowColor, glowAlpha, text)
{
	textElem = CreateFontString( font, fontscale );
	textElem setPoint( align, relative, x, y );
	textElem.sort = sort;
	textElem.type = "text";
	textElem.color = color;
	textElem.alpha = alpha;
	textElem.glowColor = glowColor;
	textElem.glowAlpha = glowAlpha;
	if(isDefined(text))
	{
		textElem _setText(text);
	}
	//textElem.foreground = true;
	textElem.hideWhenInMenu = false;
	return textElem;
}
createRectangle(align, relative, x, y, width, height, color, alpha, sorting, shadero)
{
	barElemBG = newClientHudElem( self );
	barElemBG.elemType = "bar";
	if ( !level.splitScreen )
	{
		barElemBG.x = -2;
		barElemBG.y = -2;
	}
	barElemBG.width = width;
	barElemBG.height = height;
	barElemBG.align = align;
	barElemBG.relative = relative;
	barElemBG.xOffset = 0;
	barElemBG.yOffset = 0;
	barElemBG.children = [];
	barElemBG.color = color;
	if(isDefined(alpha))
		barElemBG.alpha = alpha;
	else
		barElemBG.alpha = 1;
	barElemBG setShader( shadero, width , height );
	barElemBG.hidden = false;
	barElemBG.sort = sorting;
	barElemBG setPoint(align,relative,x,y);
	return barElemBG;
}
elemFadeOverTime(time,alpha)
{
	self fadeovertime(time);
	self.alpha = alpha;
}
elemMoveOverTimeY(time,y)
{
	self moveovertime(time);
	self.y = y;
}
elemMoveOverTimeX(time,x)
{
	self moveovertime(time);
	self.x = x;
}
elemScaleOverTime(time,width,height)
{
	self scaleovertime(time,width,height);
}
_selectedEffect()
{
	self notify("Update_Scroll");
	self endon("Update_Scroll");
	for(;;)
	{
		self elemFadeOverTime(.3,0.3);
		wait .3;
		self elemFadeOverTime(.3,1);
		wait .3;
	}
}
ePxmonitor(client,shader,mode)
{
	if(mode=="Update")
	{
		client waittill_any("Update","Menu_Is_Closed");
	}
	else if(mode=="Close")
	{
		client waittill_any("Menu_Is_Closed");
	}
	else if(mode=="Death")
	{
		client waittill_any("death");
	}
	else if(mode=="RGB")
	{
		client waittill_any("Update","Menu_Is_Closed","RGB_End");
	}
	else
	{
		client waittill_any("Update","Menu_Is_Closed","death","spawned_player");
	}
	shader destroy();
}
Test()
{
   self iprintln("^1TEST");
}
NONE(){}
isHost()
{
	if(self GetEntityNumber() == 0)return true;
	return false;
}
isConsole()
{
	if(level.xenon||level.ps3)
	{
		return true;
	}
	return false;
}
isBot()
{
	if(isDefined(self.pers["isBot"])&&self.pers["isBot"])
	{
		return true;
	}
	return false;
}
getTrueName(playerName)
{
	if(!isDefined(playerName))
		playerName = self.name;

	if (isSubStr(playerName, "]"))
	{
		name = strTok(playerName, "]");
		return name[name.size - 1];
	}
	else
		return playerName;
}
deleteOffHand()
{
	self endon("death");
	self endon("disconnect");
	self waittill("grenade_fire",grenade);
	grenade delete();
}
updateMenuColors()
{
	self.PIX["Scrollbar"].color = self.Scrollbar_Color;
	self.PIX["BG"].color = self.BG_Color;
	self.PIX["Title"].color = self.Title_Color;
	self.PIX["Title"].glowColor = self.Title_GlowColor;
	self.PIX["Title"].glowAlpha = self.Title_GlowPut;
	self.PIX["TOP_LINE"].color = self.TopLine_Color;
	self.PIX["BOTTOM_LINE"].color = self.BottomLine_Color;
	self.PIX["counter"].color = self.Counter_Color;
	self.PIX["counter"].glowColor = self.Counter_GlowColor;
	self.PIX["counter"].glowAlpha = self.Counter_GlowPut;
	self.PIX["status"].color = self.Status_Color;
	self.PIX["status"].glowColor = self.Status_GlowColor;
	self.PIX["status"].glowAlpha = self.Status_GlowPut;
	for(i=0;i<self.PIX["Text"].size;i++)
	{
		self.PIX["Text"][i].color = self.Text_Color;
		//self.PIX["Text"][i].glowColor = self.Text_GlowColor;
		//self.PIX["Text"][i].glowAlpha = self.Text_GlowPut;
	}
	/*for(i=0;i<self.PIX["Toggle_Value"].size;i++)
	{
		self.PIX["Toggle_Value"][i].color = self.TText_Color;
		self.PIX["Toggle_Value"][i].glowColor = self.TText_GlowColor;
		self.PIX["Toggle_Value"][i].glowAlpha = self.TText_GlowPut;
	}*/
	for(i=0;i<self.PIX["Value"].size;i++)
	{
		self.PIX["Value"][i].color = self.Values_Color;
		self.PIX["Value"][i].glowColor = self.Values_GlowColor;
		self.PIX["Value"][i].glowAlpha = self.Values_GlowPut;
	}
}
ToggleTitleGlow()
{
	if(!self.Title_Glow)
	{
		self.Title_Glow = true;
		self.Title_GlowPut = 1;
	}
	else
	{
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
	}
	self updateMenuColors();
}
ToggleTextGlow()
{
	if(!self.Text_Glow)
	{
		self.Text_Glow = true;
		self.Text_GlowPut = 1;
	}
	else
	{
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
	}
	self updateMenuColors();
}
ToggleToggleTextGlow()
{
	if(!self.TText_Glow)
	{
		self.TText_Glow = true;
		self.TText_GlowPut = 1;
	}
	else
	{
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
	}
	self updateMenuColors();
}
ToggleValueGlow()
{
	if(!self.Values_Glow)
	{
		self.Values_Glow = true;
		self.Values_GlowPut = 1;
	}
	else
	{
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
	}
	self updateMenuColors();
}
ToggleCounterGlow()
{
	if(!self.Counter_Glow)
	{
		self.Counter_Glow = true;
		self.Counter_GlowPut = 1;
	}
	else
	{
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
	}
	self updateMenuColors();
}
ToggleStatusGlow()
{
	if(!self.Status_Glow)
	{
		self.Status_Glow = true;
		self.Status_GlowPut = 1;
	}
	else
	{
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
	}
	self updateMenuColors();
}