#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

#include cp\_common_scripts;
#include cp\_main;
#include cp\menu\_menu;
#include cp\menu\_menu_struct;
#include cp\_verifycation;


_createHud()
{
	if(self.PIX["Menu"]["Style"]=="default")
	{
		self.PIX["Title"] = createText("objective",1.5,"CENTER","TOP",self.console_text_displace_x+self.MainXPos,self.console_text_displace_y+self.MainYPos+125,0,self.Title_Color,0,self.Title_GlowColor,self.Title_GlowPut,self.PIX[self.PIX["CurrentMenu"]].title);
		self.PIX["Title"].foreground = true;
		thread ePxmonitor(self,self.PIX["Title"],"Close");
		
		self.PIX["Scrollbar"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos,self.console_scrollbar_displace_y+self.MainYPos+151,200,20,self.Scrollbar_Color,0,0,"white");
		thread ePxmonitor(self,self.PIX["Scrollbar"],"Close");
		
		self.PIX["BG"] = createRectangle("CENTER","CENTER",self.console_shader_displace_x+self.MainXPos,self.console_shader_displace_y+self.MainYPos-25,200,200,self.BG_Color,0,0,"white");
		thread ePxmonitor(self,self.PIX["BG"],"Close");
		
		self.PIX["TOP_LINE"] = createRectangle("CENTER","CENTER",self.console_shader_displace_x+self.MainXPos,self.console_shader_displace_y+self.MainYPos-99,200,1,self.TopLine_Color,0,0,"white");
		self.PIX["TOP_LINE"].foreground = true;
		thread ePxmonitor(self,self.PIX["TOP_LINE"],"Close");
		
		self.PIX["BOTTOM_LINE"] = createRectangle("CENTER","CENTER",self.console_shader_displace_x+self.MainXPos,self.console_shader_displace_y+self.MainYPos+51,200,1,self.BottomLine_Color,0,0,"white");
		self.PIX["BOTTOM_LINE"].foreground = true;
		thread ePxmonitor(self,self.PIX["BOTTOM_LINE"],"Close");
		
		self.PIX["counter"] = createText("default",1.5,"RIGHT","TOP",self.console_text_displace_x+self.MainXPos+94,self.console_text_displace_y+self.MainYPos+300,0,self.Counter_Color,0,self.Counter_GlowColor,self.Counter_GlowPut,(self.Scroller[self.PIX["CurrentMenu"]]+1)+"/"+self.PIX[self.PIX["CurrentMenu"]].text.size);
		self.PIX["counter"].foreground = true;
		thread ePxmonitor(self,self.PIX["counter"],"Close");
		
		self.PIX["status"] = createText("default",1.5,"LEFT","TOP",self.console_text_displace_x+self.MainXPos-98,self.console_text_displace_y+self.MainYPos+300,0,self.Status_Color,0,self.Status_GlowColor,self.Status_GlowPut,"Status: " + self getVerifycationString());
		self.PIX["status"].foreground = true;
		thread ePxmonitor(self,self.PIX["status"],"Close");
	}
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		self.PIX["BG"] = createRectangle("CENTER","CENTER",700,self.console_shader_displace_y+self.MainYPos,600,1000,(0,0,0),1,0,"minimap_background");
		thread ePxmonitor(self,self.PIX["BG"],"Close");
		
		self.PIX["Scroll_Top"] = createRectangle("CENTER","CENTER",763,((self.Scroller[self.PIX["CurrentMenu"]]*18)+((-1)*((self.PIX[self.PIX["CurrentMenu"]].text.size/2)*18)-8)+.4),600,2,(0,0,0),1,0,"white");
		thread ePxmonitor(self,self.PIX["Scroll_Top"],"Close");
		self.PIX["Scroll_Top"].foreground = true;
		
		self.PIX["Scroll_Bottom"] = createRectangle("CENTER","CENTER",763,((self.Scroller[self.PIX["CurrentMenu"]]*18)+((-1)*((self.PIX[self.PIX["CurrentMenu"]].text.size/2)*18)+8)+.4),600,2,(0,0,0),1,0,"white");
		thread ePxmonitor(self,self.PIX["Scroll_Bottom"],"Close");
		self.PIX["Scroll_Bottom"].foreground = true;
		
		self.PIX["Checker"] = createRectangle("CENTER","CENTER",763,0,600,2000,(0,1,0),1,0,"AC1D");
		thread ePxmonitor(self,self.PIX["Checker"],"Close");
		self.PIX["Checker"].foreground = false;
	}
}
_hudFadeIn()
{
	if(self.PIX["Menu"]["Style"]=="default")
	{
		self.PIX["Title"] elemFadeOverTime(.4,1);
		self.PIX["Scrollbar"] elemFadeOverTime(.4,1);
		self.PIX["BG"] elemFadeOverTime(.4,self.BG_Alpha);
		self.PIX["TOP_LINE"] elemFadeOverTime(.4,1);
		self.PIX["BOTTOM_LINE"] elemFadeOverTime(.4,1);
		self.PIX["counter"] elemFadeOverTime(.4,1);
		self.PIX["status"] elemFadeOverTime(.4,1);
		wait .4;
	}
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		self.PIX["Checker"] elemMoveOverTimeX(.7,self.MainXPos+63);
		self.PIX["BG"] elemMoveOverTimeX(.7,self.MainXPos);
		wait .8;
		self thread BGanim();
	}
}
_hudFadeOut()
{
	if(self.PIX["Menu"]["Style"]=="default")
	{
		if(isDefined(self.PIX["Text"]))
		{
			for(i=self.PIX["Text"].size;i>-1;i--)
			{
				self.PIX["Text"][i] notify("Update_Scroll");
				self.PIX["Text"][i] elemFadeOverTime(0.05,0);
				self.PIX["Value"][i] notify("Update_Scroll");
				self.PIX["Value"][i] elemFadeOverTime(0.05,0);
				wait 0.05;
			}
		}
		self.PIX["Title"] elemFadeOverTime(.4,0);
		self.PIX["Scrollbar"] elemFadeOverTime(.4,0);
		self.PIX["BG"] elemFadeOverTime(.4,0);
		self.PIX["TOP_LINE"] elemFadeOverTime(.4,0);
		self.PIX["BOTTOM_LINE"] elemFadeOverTime(.4,0);
		self.PIX["counter"] elemFadeOverTime(.4,0);
		self.PIX["status"] elemFadeOverTime(.4,0);
		wait .4;
	}
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		self.PIX["Scroll_Top"] elemMoveOverTimeX(.4,763);
		self.PIX["Scroll_Bottom"] elemMoveOverTimeX(.4,763);
		wait .2;
		self _moveMenuTextX(.4,700);
		self notify("checker_anim_end");
		self.PIX["Checker"].y = 0;
		self.PIX["Checker"] elemMoveOverTimeX(.7,763);
		self.PIX["BG"] elemMoveOverTimeX(.7,700);
		wait .8;
	}
}

_doMenuText()
{
	if(self.PIX["Menu"]["Style"]=="default")
	{
		self.PIX["Menu"]["Opening"] = false;
		for(i=0;i<self.MenuMaxSize;i++)
		{
			self.PIX["Text"][i] = createText("default",1.5,"LEFT","TOP",self.console_text_displace_x+self.MainXPos-98,self.console_text_displace_y+self.MainYPos+150+(18*i),0,self.Text_Color,1,self.Text_GlowColor,self.Text_GlowPut,self.PIX[self.PIX["CurrentMenu"]].text[i]);
			self.PIX["Text"][i].foreground = true;
			thread ePxmonitor(self,self.PIX["Text"][i],"Update");
			
			self.PIX["Value"][i] = createText("default",1.5,"RIGHT","TOP",self.console_text_displace_x+self.MainXPos+94,self.console_text_displace_y+self.MainYPos+150+(18*i),0,self.Values_Color,0,self.Values_GlowColor,self.Values_GlowPut);
			self.PIX["Value"][i].foreground = true;
			thread ePxmonitor(self,self.PIX["Value"][i],"Update");
		}
	}
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		if(self.PIX["Menu"]["Opening"])
		{
			xpos = 700;
		}
		else
		{
			xpos = self.MainXPos-217;
		}
		for(i=0;i<self.PIX[self.PIX["CurrentMenu"]].text.size;i++)
		{
			self.PIX["Text"][i] = createText("default",1.5,"LEFT","CENTER",xpos,(-1)*((self.PIX[self.PIX["CurrentMenu"]].text.size/2)*18)+(18*i),0,(1,1,1),1,(0,0,0),0);
			thread ePxmonitor(self,self.PIX["Text"][i],"Update");
			if(isDefined(self.PIX[self.PIX["CurrentMenu"]].toggle[i]))
			{
				self.PIX["Text"][i].glowAlpha = 1;
				if(!self.PIX[self.PIX["CurrentMenu"]].toggle[i])
				{
					self.PIX["Text"][i].glowColor = (1,0,0);
				}
				else
				{
					self.PIX["Text"][i].glowColor = (0.3,0.9,0.5);
				}
			}
			else
			{
				self.PIX["Text"][i].glowAlpha = 1;
			}
			if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[i]))
			{
				self.PIX["Value"][i] = createText("default",1.5,"RIGHT","CENTER",xpos-23,(-1)*((self.PIX[self.PIX["CurrentMenu"]].text.size/2)*18)+(18*i),0,(1,1,1),1,(0,0,0),0);
				thread ePxmonitor(self,self.PIX["Value"][i],"Update");
				
				if(!isDefined(self.Value[self.PIX["CurrentMenu"]][i]))
				{
					self.Value[self.PIX["CurrentMenu"]][i] = 0;
				}
				self.PIX["Value"][i] setValue(self.Value[self.PIX["CurrentMenu"]][i]);
			}
			self.PIX["Text"][i] _setText(self.PIX[self.PIX["CurrentMenu"]].text[i]);
		}
		if(self.PIX["Menu"]["Opening"])
		{
			self _moveMenuTextX(.4,self.MainXPos-217);
			wait .2;
			self.PIX["Scroll_Top"] elemMoveOverTimeX(.7,self.MainXPos+63);
			self.PIX["Scroll_Bottom"] elemMoveOverTimeX(.7,self.MainXPos+63);
		}
		self.PIX["Menu"]["Opening"] = false;
	}
}



_moveMenuTextX(time,x)
{
	for(i=0;i<self.PIX["Text"].size;i++)
	{
		if(isDefined(self.PIX["Text"][i]))
		{
			self.PIX["Text"][i] elemMoveOverTimeX(time,x);
			if(isDefined(self.PIX["Value"][i]))
			{
				self.PIX["Value"][i] elemMoveOverTimeX(time,x-23);
			}
			wait 0.05;
		}
	}
}
BGanim()
{
	self endon("Menu_Is_Closed");
	self endon("checker_anim_end");
	for(;;)
	{
		self.PIX["Checker"] moveOverTime(self.CheckerAnimSpeed);
		self.PIX["Checker"].y = 800;
		if(self.CheckerAnimSpeed>29)
		{
			wait 4;
		}
		else if(self.CheckerAnimSpeed<29 && self.CheckerAnimSpeed>9)
		{
			wait 2;
		}
		else
		{
			wait 1;
		}
		self.PIX["Checker"].y = 0;
	}
	wait .2;
}