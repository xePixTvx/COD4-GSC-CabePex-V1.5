#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

#include cp\_common_scripts;
#include cp\_main;
#include cp\_verifycation;
#include cp\menu\_menu_struct;
#include cp\menu\_menu_hud;
#include cp\menu\_menu_functions;
#include cp\menu\_menu_utilities; //CabCon: imported for my utilities. 
/// **** xePixTvx Mw2 Menu System Version F1.8 **** ///
/// **** Menu Base + Verifycation System is coded by P!X **** ///
/// **** Pls Dont Remove or Edit this **** ///


/* Setup Menu System */
_setUpMenu()
{
	self.PIX = [];
	self.Scroller = [];
	self.Value = [];
	self.RGB_Select = 0;
	self.R_Scroll = 0;
	self.G_Scroll = 0;
	self.B_Scroll = 0;
	self _loadMenuStruct();
	
	self.hasMenu = false;
	self.menuLanguage = "english";
	
	self.PIX["Menu"]["Style"] = "default";
	self.PIX["Menu"]["Theme"] = "default";
	self.MenuMaxSize = 8;
	self.MenuMaxSizeHalf = 4;
	self.MenuMaxSizeHalfOne = 5;
	self.MainXPos = 0;
	self.MainYPos = 0;
	if(isConsole())
	{
		//works for me
		self.console_shader_displace_y = 0;
		self.console_shader_displace_x = 0;
		self.console_text_displace_y = -36;
		self.console_scrollbar_displace_y = -36;
		self.console_text_displace_x = 0;
	}
	else
	{
		self.console_shader_displace_y = 0;
		self.console_shader_displace_x = 0;
		self.console_text_displace_y = 0;
		self.console_scrollbar_displace_y = 0;
		self.console_text_displace_x = 0;
	}
	
	self.TestToggle = false;
	
	//CabCon Added also here my "needed" definitions for vars.
	
	self.var["godmode"] = false;
	self.var["UnlimitedAmmo"] = false;
	self.var["vision_fadetime"] = .3;
	self.var["hitmarker"] = true;	
	self.var["hitmarker_pos_flash"] = false;
	self.var["hitmarker_pos_flash_distance"] = 20;
	self.var["hitmarker_pos_flash_speed"] = .01;
	self.var["hitmarker_pos_flash_animated"] = false;
	self.var["bots_freez"] = true;
	self.var["player_mode_ufo"] = false;
	
	self.var["invisible"] = false;
	self.ViewPortShow = "Default";
	self.ViewPortVal = 1;
	self.var["deathmachine"] = false;
	self.var["discosun"] = false;
	self.var["nukebullets"] = false;
	self.var["petChopper"] = false;
	self.var["fov_save"] = getDvarInt("cg_fov");
	
	//Dvars
	self.var["jump_height"] = false;
	self.var["g_speed"] = false;
	self.var["g_gravity"] = false;
	
	//Menu Items
	if(!isDefined(self.menu))
		self.menu = [];
	
	
	self.menu["freezcontrol"] = false;
	self.menu["control_remembrance"] = true;
	
	self.Scrollbar_Color = (1,0,0);
	self.BG_Color = (0,0,0);
	self.Title_Color = (1,1,1);
	self.Title_GlowColor = (1,0,0);
	self.Title_Glow = false;
	self.Title_GlowPut = 0;
	self.Text_Color = (1,1,1);
	self.Text_GlowColor = (1,0,0);
	self.Text_Glow = false;
	self.Text_GlowPut = 0;
	self.TText_Color = (1,1,1);
	self.TText_GlowColor = (1,0,0);
	self.TText_Glow = false;
	self.TText_GlowPut = 0;
	self.Values_Color = (1,1,1);
	self.Values_GlowColor = (1,0,0);
	self.Values_Glow = false;
	self.Values_GlowPut = 0;
	self.TopLine_Color = (1,1,1);
	self.BottomLine_Color = (1,1,1);
	self.Counter_Color = (1,1,1);
	self.Counter_GlowColor = (1,0,0);
	self.Counter_Glow = false;
	self.Counter_GlowPut = 0;
	self.Status_Color = (1,1,1);
	self.Status_GlowColor = (1,0,0);
	self.Status_Glow = false;
	self.Status_GlowPut = 0;
	
	self.BG_Alpha = (1/1.75);
	
	
	//TESTING
	self.ForceHost = false;
}
resetVarsOnSpawn()
{
	if(self.var["invisible"])
	{
		self hide();
	}
	else
	{
		self show();
	}
	if(self.var["deathmachine"])
	{
		self allowADS(false);
		self allowSprint(false);
		self setPerk("specialty_bulletaccuracy");
		self setPerk("specialty_rof");
		self setClientDvar("perk_weapSpreadMultiplier",0.20);
		self setClientDvar("perk_weapRateMultiplier",0.20);
		self giveWeapon("saw_grip_mp");
		self switchToWeapon("saw_grip_mp");
	}
	self.reaper = false;
	self setClientDvar("cg_fov",self.var["fov_save"]);
}

/* Give + Remove Menu */
_giveMenu()
{
	if(!self.hasMenu)
	{
		self thread initMenu();
		self.hasMenu = true;
	}
}
_removeMenu()
{
	if(self.PIX["Menu"]["Open"]==true)
	{
		self _closeMenu();
		wait 0.05;
	}
	self notify("Remove_Menu");
	self.hasMenu = false;
}


/* Start Menu */
initMenu()
{
	self.PIX["Menu"]["Open"] = false;
	self.PIX["Menu"]["Locked"] = false;
	self.PIX["Menu"]["Type"] = "menu";
	self thread _menuOpenMonitor();
}


/* Menu Monitoring */
_menuOpenMonitor()
{
	self endon("disconnect");
	self endon("Remove_Menu");
	for(;;)
	{
		if(!self.PIX["Menu"]["Open"] && !self.PIX["Menu"]["Locked"])
		{
			if(self AdsButtonPressed() && self MeleeButtonPressed())
			{
				wait .4;
				self thread _menuMain();
				wait 0.05;
				self notify("Menu_Is_Opened");
				wait .3;
			}
		}
		wait 0.05;
	}
}
_menuMain()
{
	self endon("disconnect");
	self endon("Menu_Is_Closed");
	
	self waittill("Menu_Is_Opened");
	self _openMenu();
	
	while(self.PIX["Menu"]["Open"])
	{
		if(getMenuSetting("freezcontrol"))
			self freezeControls(true);
		else
			self freezeControls(false);
		if(self.PIX["Menu"]["Type"]=="menu")
		{
			if(self AdsButtonPressed()||self AttackButtonPressed())
			{
				self.Scroller[self.PIX["CurrentMenu"]] -= self AdsButtonPressed();
				self.Scroller[self.PIX["CurrentMenu"]] += self AttackButtonPressed();
				self _scrollUpdate();
				self playLocalSound("mouse_submenu_over");
				wait 0.125;
			}
			if(self SecondaryOffHandButtonPressed())
			{
				if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]]))
				{
					self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]] -= self.PIX[self.PIX["CurrentMenu"]].inp3[self.Scroller[self.PIX["CurrentMenu"]]];
					if(self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]]<self.PIX[self.PIX["CurrentMenu"]].inp2[self.Scroller[self.PIX["CurrentMenu"]]])
					{
						self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]] = self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]];
					}
					self _scrollUpdate();
					self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]] = self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]];
					self thread [[self.PIX[self.PIX["CurrentMenu"]].func[self.Scroller[self.PIX["CurrentMenu"]]]]](self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]]);
					wait self.PIX[self.PIX["CurrentMenu"]].scrollerSpeed[self.Scroller[self.PIX["CurrentMenu"]]];
				}
				self playLocalSound("mouse_submenu_over");
			}
			if(self FragButtonPressed())
			{
				if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]]))
				{
					self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]] += self.PIX[self.PIX["CurrentMenu"]].inp3[self.Scroller[self.PIX["CurrentMenu"]]];
					if(self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]]>self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]])
					{
						self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]] = self.PIX[self.PIX["CurrentMenu"]].inp2[self.Scroller[self.PIX["CurrentMenu"]]];
					}
					self _scrollUpdate();
					self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]] = self.Value[self.PIX["CurrentMenu"]][self.Scroller[self.PIX["CurrentMenu"]]];
					self thread [[self.PIX[self.PIX["CurrentMenu"]].func[self.Scroller[self.PIX["CurrentMenu"]]]]](self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]]);
					wait self.PIX[self.PIX["CurrentMenu"]].scrollerSpeed[self.Scroller[self.PIX["CurrentMenu"]]];
				}
				self playLocalSound("mouse_submenu_over");
			}
			if(self UseButtonPressed())
			{
				if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[self.Scroller[self.PIX["CurrentMenu"]]]))
				{
					S("Press [{+smoke}] & [{+frag}] to change the value");
				}
				else
				{
					input1 = self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]];
					input2 = self.PIX[self.PIX["CurrentMenu"]].inp2[self.Scroller[self.PIX["CurrentMenu"]]];
					input3 = self.PIX[self.PIX["CurrentMenu"]].inp3[self.Scroller[self.PIX["CurrentMenu"]]];
					func = self.PIX[self.PIX["CurrentMenu"]].func[self.Scroller[self.PIX["CurrentMenu"]]];
					self thread [[func]](input1,input2,input3);
					if(func == ::func_toggleDvarbool)
					{
						wait 0.1;
						L("waited");
					}
						
					self _selectUpdate();
				}
				self playLocalSound("mouse_submenu_over");
				wait .2;
			}
			if(self MeleeButtonPressed())
			{
				if(self.PIX[self.PIX["CurrentMenu"]].parent=="Exit")
				{
					self _closeMenu();
				}	
				else
				{
					self _loadMenu(self.PIX[self.PIX["CurrentMenu"]].parent);
				}
				self playLocalSound("mouse_submenu_over");
				wait .2;
			}
		}
		else if(self.PIX["Menu"]["Type"]=="rgb")
		{
			if(self SecondaryOffHandButtonPressed()||self FragButtonPressed())
			{
				self.RGB_Select -= self SecondaryOffHandButtonPressed();
				self.RGB_Select += self FragButtonPressed();
				if(self.RGB_Select<0)
				{
					self.RGB_Select = 2;
				}
				if(self.RGB_Select>2)
				{
					self.RGB_Select = 0;
				}
				if(self.RGB_Select==0)
				{
					self.PIX["R_Line"] elemFadeOverTime(.4,1);
					self.PIX["R_Value"] elemFadeOverTime(.4,1);
					self.PIX["R_Scroll"] elemFadeOverTime(.4,1);
					self.PIX["G_Line"] elemFadeOverTime(.4,0.3);
					self.PIX["G_Value"] elemFadeOverTime(.4,0.3);
					self.PIX["G_Scroll"] elemFadeOverTime(.4,0.3);
					self.PIX["B_Line"] elemFadeOverTime(.4,0.3);
					self.PIX["B_Value"] elemFadeOverTime(.4,0.3);
					self.PIX["B_Scroll"] elemFadeOverTime(.4,0.3);
				}
				if(self.RGB_Select==1)
				{
					self.PIX["R_Line"] elemFadeOverTime(.4,0.3);
					self.PIX["R_Value"] elemFadeOverTime(.4,0.3);
					self.PIX["R_Scroll"] elemFadeOverTime(.4,0.3);
					self.PIX["G_Line"] elemFadeOverTime(.4,1);
					self.PIX["G_Value"] elemFadeOverTime(.4,1);
					self.PIX["G_Scroll"] elemFadeOverTime(.4,1);
					self.PIX["B_Line"] elemFadeOverTime(.4,0.3);
					self.PIX["B_Value"] elemFadeOverTime(.4,0.3);
					self.PIX["B_Scroll"] elemFadeOverTime(.4,0.3);
				}
				if(self.RGB_Select==2)
				{
					self.PIX["R_Line"] elemFadeOverTime(.4,0.3);
					self.PIX["R_Value"] elemFadeOverTime(.4,0.3);
					self.PIX["R_Scroll"] elemFadeOverTime(.4,0.3);
					self.PIX["G_Line"] elemFadeOverTime(.4,0.3);
					self.PIX["G_Value"] elemFadeOverTime(.4,0.3);
					self.PIX["G_Scroll"] elemFadeOverTime(.4,0.3);
					self.PIX["B_Line"] elemFadeOverTime(.4,1);
					self.PIX["B_Value"] elemFadeOverTime(.4,1);
					self.PIX["B_Scroll"] elemFadeOverTime(.4,1);
				}
				self playLocalSound("mouse_submenu_over");
				wait .4;
			}
			if(self AdsButtonPressed()||self AttackButtonPressed())
			{
				if(self.RGB_Select==0)
				{
					self.R_Scroll -= self AdsButtonPressed();
					self.R_Scroll += self AttackButtonPressed();
					if(self.R_Scroll<0)
					{
						self.R_Scroll = 100;
					}
					if(self.R_Scroll>100)
					{
						self.R_Scroll = 0;
					}
					self.PIX["R_Value"] setValue(int(self.R_Scroll*2.55));
					self.PIX["R_Scroll"] elemMoveOverTimeX(0.125,self.console_shader_displace_x+self.MainXPos-75+(self.R_Scroll*1.38));
				}
				if(self.RGB_Select==1)
				{
					self.G_Scroll -= self AdsButtonPressed();
					self.G_Scroll += self AttackButtonPressed();
					if(self.G_Scroll<0)
					{
						self.G_Scroll = 100;
					}
					if(self.G_Scroll>100)
					{
						self.G_Scroll = 0;
					}
					self.PIX["G_Value"] setValue(int(self.G_Scroll*2.55));
					self.PIX["G_Scroll"] elemMoveOverTimeX(0.125,self.console_shader_displace_x+self.MainXPos-75+(self.G_Scroll*1.38));
				}
				if(self.RGB_Select==2)
				{
					self.B_Scroll -= self AdsButtonPressed();
					self.B_Scroll += self AttackButtonPressed();
					if(self.B_Scroll<0)
					{
						self.B_Scroll = 100;
					}
					if(self.B_Scroll>100)
					{
						self.B_Scroll = 0;
					}
					self.PIX["B_Value"] setValue(int(self.B_Scroll*2.55));
					self.PIX["B_Scroll"] elemMoveOverTimeX(0.125,self.console_shader_displace_x+self.MainXPos-75+(self.B_Scroll*1.38));
				}
				self.PIX["Scrollbar"].color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				self playLocalSound("mouse_submenu_over");
			}
			if(self UseButtonPressed())
			{
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="scrollbar")
				{
					self.Scrollbar_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="bg")
				{
					self.BG_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="title")
				{
					self.Title_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="title_glow")
				{
					self.Title_GlowColor = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="text")
				{
					self.Text_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="text_glow")
				{
					self.Text_GlowColor = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="toggle")
				{
					self.TText_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="toggle_glow")
				{
					self.TText_GlowColor = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="value")
				{
					self.Values_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="value_glow")
				{
					self.Values_GlowColor = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="topline")
				{
					self.TopLine_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="bottomline")
				{
					self.BottomLine_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="counter")
				{
					self.Counter_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="counter_glow")
				{
					self.Counter_GlowColor = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="status")
				{
					self.Status_Color = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				if(self.PIX[self.PIX["CurrentMenu"]].inp1[self.Scroller[self.PIX["CurrentMenu"]]]=="status_glow")
				{
					self.Status_GlowColor = ((int(self.R_Scroll*2.55)/255),(int(self.G_Scroll*2.55)/255),(int(self.B_Scroll*2.55)/255));
				}
				self updateMenuColors();
				self iprintln("^1Color Set ;)");
				wait 0.05;
				self _exitRGBEditor();
				self playLocalSound("mouse_submenu_over");
				wait .2;
			}
			if(self MeleeButtonPressed())
			{
				self _exitRGBEditor();
				self playLocalSound("mouse_submenu_over");
				wait .2;
			}
		}
		else
		{
			self.PIX["Menu"]["Type"] = "menu";
		}
		wait 0.05;
	}
}

/* Menu Open + Close */
_openMenu()
{
	self.PIX["Menu"]["Open"] = true;
	if(getMenuSetting("freezcontrol"))
			self freezeControls(true);
		else
			self freezeControls(false);
	if(!isDefined(self.PIX["CurrentMenu"]))
	{
		self.PIX["CurrentMenu"] = "main";
	}
	self.PIX["Menu"]["Opening"] = true;
	self _createHud();
	self _hudFadeIn();
	self _loadMenu(self.PIX["CurrentMenu"]);
}
_closeMenu()
{
	self _hudFadeOut();
	self.PIX["Menu"]["Open"] = false;
	self freezeControls(false);
	self notify("Menu_Is_Closed");
}


/* load menu + scroll & select Update */
_loadMenu(menu)
{
	self _loadMenuStruct();
	self notify("Update");
	self.PIX["CurrentMenu"] = menu;
	if(!isDefined(self.Scroller[self.PIX["CurrentMenu"]]))
	{
		self.Scroller[self.PIX["CurrentMenu"]] = 0;
	}
	if(!getMenuSetting("control_remembrance"))
		self.Scroller[self.PIX["CurrentMenu"]] = 0;
	for(i=0;i<self.PIX[self.PIX["CurrentMenu"]].text.size;i++)
	{
		if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[i]))
		{
			self.Value[self.PIX["CurrentMenu"]][i] = self.PIX[self.PIX["CurrentMenu"]].scroller[i];
		}
	}
	self _doMenuText();
	if(isDefined(self.PIX["Title"]))
	{
		self.PIX["Title"] _setText(self.PIX[self.PIX["CurrentMenu"]].title);
	}
	self _selectUpdate();
}
_scrollUpdate()
{
	if(self.Scroller[self.PIX["CurrentMenu"]]<0)
	{
		self.Scroller[self.PIX["CurrentMenu"]] = self.PIX[self.PIX["CurrentMenu"]].text.size-1;
	}
	if(self.Scroller[self.PIX["CurrentMenu"]]>self.PIX[self.PIX["CurrentMenu"]].text.size-1)
	{
		self.Scroller[self.PIX["CurrentMenu"]] = 0;
	}
	if(self.PIX["Menu"]["Style"]=="default")
	{
		if(!isDefined(self.PIX[self.PIX["CurrentMenu"]].text[self.Scroller[self.PIX["CurrentMenu"]]-self.MenuMaxSizeHalf])||self.PIX[self.PIX["CurrentMenu"]].text.size<=self.MenuMaxSize)
		{
			for(i=0;i<self.MenuMaxSize;i++)
			{
				if(isDefined(self.PIX[self.PIX["CurrentMenu"]].text[i]))
				{
					self.PIX["Text"][i] _setText(self.PIX[self.PIX["CurrentMenu"]].text[i]);
				}
				else
				{
					self.PIX["Text"][i] _setText("");
				}
				if(i==self.Scroller[self.PIX["CurrentMenu"]])
				{
					self.PIX["Text"][i] thread _selectedEffect();
					if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[i]))
					{
						self.PIX["Value"][i] thread _selectedEffect();
					}
					else
					{
						self.PIX["Value"][i] notify("Update_Scroll");
						self.PIX["Value"][i].alpha = 0;
					}
				}
				else
				{
					self.PIX["Text"][i] notify("Update_Scroll");
					self.PIX["Text"][i].alpha = 1;
					self.PIX["Value"][i] notify("Update_Scroll");
					self.PIX["Value"][i].alpha = 0;
				}
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
					self.PIX["Text"][i].glowAlpha = 0;
				}
				if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[i]))
				{
					self.PIX["Value"][i].alpha = 1;
					if(!isDefined(self.Value[self.PIX["CurrentMenu"]][i]))
					{
						self.Value[self.PIX["CurrentMenu"]][i] = 0;
					}
					self.PIX["Value"][i] setValue(self.Value[self.PIX["CurrentMenu"]][i]);
				}
				else
				{
					self.PIX["Value"][i].alpha = 0;
				}
			}
			self.PIX["Scrollbar"] elemMoveOverTimeY(0.125,self.console_scrollbar_displace_y+self.MainYPos+151+(18*self.Scroller[self.PIX["CurrentMenu"]]));
		}
		else
		{
			if(isDefined(self.PIX[self.PIX["CurrentMenu"]].text[self.Scroller[self.PIX["CurrentMenu"]]+self.MenuMaxSizeHalf]))
			{
				xePixTvx = 0;
				for(i=self.Scroller[self.PIX["CurrentMenu"]]-self.MenuMaxSizeHalf;i<self.Scroller[self.PIX["CurrentMenu"]]+self.MenuMaxSizeHalfOne;i++)
				{
					if(isDefined(self.PIX[self.PIX["CurrentMenu"]].text[i]))
					{
						self.PIX["Text"][xePixTvx] _setText(self.PIX[self.PIX["CurrentMenu"]].text[i]);
					}
					else
					{
						self.PIX["Text"][xePixTvx] _setText("");
					}
					if(i==self.Scroller[self.PIX["CurrentMenu"]])
					{
						self.PIX["Text"][xePixTvx] thread _selectedEffect();
						if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[i]))
						{
							self.PIX["Value"][xePixTvx] thread _selectedEffect();
						}
						else
						{
							self.PIX["Value"][xePixTvx] notify("Update_Scroll");
							self.PIX["Value"][xePixTvx].alpha = 0;
						}
					}
					else
					{
						self.PIX["Text"][xePixTvx] notify("Update_Scroll");
						self.PIX["Text"][xePixTvx].alpha = 1;
						self.PIX["Value"][xePixTvx] notify("Update_Scroll");
						self.PIX["Value"][xePixTvx].alpha = 0;
					}
					if(isDefined(self.PIX[self.PIX["CurrentMenu"]].toggle[i]))
					{
						self.PIX["Text"][xePixTvx].glowAlpha = 1;
						if(!self.PIX[self.PIX["CurrentMenu"]].toggle[i])
						{
							self.PIX["Text"][xePixTvx].glowColor = (1,0,0);
						}
						else
						{
							self.PIX["Text"][xePixTvx].glowColor = (0.3,0.9,0.5);
						}
					}
					else
					{
						self.PIX["Text"][xePixTvx].glowAlpha = 0;
					}
					if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[i]))
					{
						self.PIX["Value"][xePixTvx].alpha = 1;
						if(!isDefined(self.Value[self.PIX["CurrentMenu"]][i]))
						{
							self.Value[self.PIX["CurrentMenu"]][i] = 0;
						}
						self.PIX["Value"][xePixTvx] setValue(self.Value[self.PIX["CurrentMenu"]][i]);
					}
					else
					{
						self.PIX["Value"][xePixTvx].alpha = 0;
					}
					xePixTvx ++;
				}           
				self.PIX["Scrollbar"] elemMoveOverTimeY(0.125,self.console_scrollbar_displace_y+self.MainYPos+151+(18*self.MenuMaxSizeHalf));
			}
			else
			{
				for(i=0;i<self.MenuMaxSize;i++)
				{
					self.PIX["Text"][i] _setText(self.PIX[self.PIX["CurrentMenu"]].text[self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)]);
					if(self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)==self.Scroller[self.PIX["CurrentMenu"]])
					{
						self.PIX["Text"][i] thread _selectedEffect();
						if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)]))
						{
							self.PIX["Value"][i] thread _selectedEffect();
						}
						else
						{
							self.PIX["Value"][i] notify("Update_Scroll");
							self.PIX["Value"][i].alpha = 0;
						}
					}
					else
					{
						self.PIX["Text"][i] notify("Update_Scroll");
						self.PIX["Text"][i].alpha = 1;
						self.PIX["Value"][i] notify("Update_Scroll");
						self.PIX["Value"][i].alpha = 0;
					}
					if(isDefined(self.PIX[self.PIX["CurrentMenu"]].toggle[self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)]))
					{
						self.PIX["Text"][i].glowAlpha = 1;
						if(!self.PIX[self.PIX["CurrentMenu"]].toggle[self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)])
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
						self.PIX["Text"][i].glowAlpha = 0;
					}
					if(isDefined(self.PIX[self.PIX["CurrentMenu"]].scroller[self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)]))
					{
						self.PIX["Value"][i].alpha = 1;
						if(!isDefined(self.Value[self.PIX["CurrentMenu"]][self.PIX[self.PIX["CurrentMenu"]].text.size+(i-self.MenuMaxSize)]))
						{
							self.Value[self.PIX["CurrentMenu"]][i] = 0;
						}
						self.PIX["Value"][i] setValue(self.Value[self.PIX["CurrentMenu"]][i]);
					}
					else
					{
						self.PIX["Value"][i].alpha = 0;
					}
				}
				self.PIX["Scrollbar"] elemMoveOverTimeY(0.125,self.console_scrollbar_displace_y+self.MainYPos+151+(18*((self.Scroller[self.PIX["CurrentMenu"]]-self.PIX[self.PIX["CurrentMenu"]].text.size)+self.MenuMaxSize)));
			}
		}
		self.PIX["counter"] _setText((self.Scroller[self.PIX["CurrentMenu"]]+1)+"/"+self.PIX[self.PIX["CurrentMenu"]].text.size);
	}
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		for(i=0;i<self.PIX[self.PIX["CurrentMenu"]].text.size;i++)
		{
			if(i==self.Scroller[self.PIX["CurrentMenu"]])
			{
				self.PIX["Text"][i] thread _selectedEffect();
				if(isDefined(self.PIX["Value"][i]))
				{
					self.PIX["Value"][i] thread _selectedEffect();
				}
			}
			else
			{
				self.PIX["Text"][i] notify("Update_Scroll");
				self.PIX["Text"][i].alpha = 1;
				if(isDefined(self.PIX["Value"][i]))
				{
					self.PIX["Value"][i] notify("Update_Scroll");
					self.PIX["Value"][i].alpha = 1;
				}
			}
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
				if(!isDefined(self.Value[self.PIX["CurrentMenu"]][i]))
				{
					self.Value[self.PIX["CurrentMenu"]][i] = 0;
				}
				self.PIX["Value"][i] setValue(self.Value[self.PIX["CurrentMenu"]][i]);
			}
		}
		self.PIX["Scroll_Top"] elemMoveOverTimeY(.1,((self.Scroller[self.PIX["CurrentMenu"]]*18)+((-1)*((self.PIX[self.PIX["CurrentMenu"]].text.size/2)*18)-8)+.4));
		self.PIX["Scroll_Bottom"] elemMoveOverTimeY(.1,((self.Scroller[self.PIX["CurrentMenu"]]*18)+((-1)*((self.PIX[self.PIX["CurrentMenu"]].text.size/2)*18)+8)+.4));
	}
}
_selectUpdate()
{
	self _loadMenuStruct();
	self _scrollUpdate();
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		self.PIX["Text"][self.Scroller[self.PIX["CurrentMenu"]]] _setText(self.PIX[self.PIX["CurrentMenu"]].text[self.Scroller[self.PIX["CurrentMenu"]]]);
	}
}







/* Menu Position Editor */
StartMenuPosEditor()
{
	self _closeMenu();
	self.PIX["Menu"]["Locked"] = true;
	if(getMenuSetting("freezcontrol"))
			self freezeControls(true);
		else
			self freezeControls(false);
	saveX = self.MainXPos;
	saveY = self.MainYPos; 
	self.MainXPos = 0;
	self.MainYPos = 0;
	showShaders = [];
	showShaders[0] = createRectangle("CENTER","CENTER",self.console_shader_displace_x+self.MainXPos,self.console_shader_displace_y+self.MainYPos-25,200,200,self.BG_Color,self.BG_Alpha,0,"white");
	showShaders[1] = createRectangle("CENTER","CENTER",200,100,2,150,(0,0,0),1,0,"white");//Y
	showShaders[2] = createRectangle("CENTER","CENTER",200,100,150,2,(0,0,0),1,0,"white");//X
	showShaders[3] = createRectangle("CENTER","CENTER",200,100,6,2,(1,1,1),1,0,"white");//Y
	showShaders[4] = createRectangle("CENTER","CENTER",200,100,2,6,(1,1,1),1,0,"white");//X
	showShaders[3].foreground = true;
	showShaders[4].foreground = true;
	XTick = 0;
	YTick = 0;
	self endon("disconnect");
	self endon("MenuPos_Done");
	for(;;)
	{
		if(self AdsButtonPressed()||self AttackButtonPressed())
		{
			self.MainXPos -= self AdsButtonPressed();
			self.MainXPos += self AttackButtonPressed();
			XTick -= self AdsButtonPressed();
			XTick += self AttackButtonPressed();
			if(self.MainXPos<-325){
				self.MainXPos = 325;}
			if(self.MainXPos>325){
				self.MainXPos = -325;}
			if(XTick<-325){
				XTick = 325;}
			if(XTick>325){
				XTick = -325;}
			showShaders[4].x = 200+(XTick*0.23);
			showShaders[0].x = self.console_shader_displace_x+self.MainXPos;
		}
		if(self SecondaryOffHandButtonPressed()||self FragButtonPressed())
		{
			self.MainYPos -= self SecondaryOffHandButtonPressed();
			self.MainYPos += self FragButtonPressed();
			YTick -= self SecondaryOffHandButtonPressed();
			YTick += self FragButtonPressed();
			if(self.MainYPos<-125){
				self.MainYPos = 125;}
			if(self.MainYPos>125){
				self.MainYPos = -125;}
			if(YTick<-125){
				YTick = 125;}
			if(YTick>125){
				YTick = -125;}
			showShaders[3].y = 100+(YTick*0.62);
			showShaders[0].y = self.console_shader_displace_y+self.MainYPos-25;
		}
		if(self UseButtonPressed())
		{
			showShaders[0] destroy();
			showShaders[1] destroy();
			showShaders[2] destroy();
			showShaders[3] destroy();
			showShaders[4] destroy();
			self freezeControls(false);
			wait 1;
			self.PIX["Menu"]["Locked"] = false;
			self thread _menuMain();
			wait 0.05;
			self notify("Menu_Is_Opened");
			self notify("MenuPos_Done");
			wait .3;
		}
		if(self MeleeButtonPressed())
		{
			self.MainXPos = saveX;
			self.MainYPos = saveY; 
			showShaders[0] destroy();
			showShaders[1] destroy();
			showShaders[2] destroy();
			showShaders[3] destroy();
			showShaders[4] destroy();
			self freezeControls(false);
			self.PIX["Menu"]["Locked"] = false;
			self thread _menuMain();
			wait 0.05;
			self notify("Menu_Is_Opened");
			self notify("MenuPos_Done");
			wait .3;
		}
		wait 0.05;
	}
	wait 0.05;
}



/* Built in RGB Editor */
StartRGBEditor()
{
	self.PIX["Menu"]["Type"] = "rgb";
	self.RGB_Select = 0;
	self.R_Scroll = 0;
	self.G_Scroll = 0;
	self.B_Scroll = 0;
	if(isDefined(self.PIX["Text"]))
	{
		for(i=self.PIX["Text"].size;i>-1;i--)
		{
			self.PIX["Text"][i] elemFadeOverTime(0.05,0);
			//self.PIX["Toggle_Value"][i] elemFadeOverTime(0.05,0);
			self.PIX["Value"][i] elemFadeOverTime(0.05,0);
			wait 0.05;
		}
	}
	self notify("Update");
	
	//RGB Hud
	
	self.PIX["BOTTOM_LINE"] elemFadeOverTime(.2,0);
	self.PIX["counter"] elemFadeOverTime(.2,0);
	self.PIX["status"] elemFadeOverTime(.2,0);
	wait .3;
	
	
	self.PIX["Scrollbar"] elemMoveOverTimeY(.2,self.console_scrollbar_displace_y+self.MainYPos+161+(18*8)-3);
	self.PIX["Scrollbar"].foreground = true;
	wait .2;
	
	self.PIX["RGB_Text"] = createText("default",1.5,"LEFT","TOP",self.console_text_displace_x+self.MainXPos-98,self.console_text_displace_y+self.MainYPos+160+(30*1),0,(1,1,1),0,(1,0,0),0,"R\n\nG\n\nB");
	self.PIX["RGB_Text"].foreground = true;
	thread ePxmonitor(self,self.PIX["RGB_Text"],"RGB");
	self.PIX["RGB_Text"] elemFadeOverTime(.4,1);
	wait .4;
	
	self.PIX["R_Line"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos-5,self.console_scrollbar_displace_y+self.MainYPos+163+(30*1),140,2,(1,1,1),0,0,"white");
	self.PIX["R_Line"].foreground = true;
	thread ePxmonitor(self,self.PIX["R_Line"],"RGB");
	self.PIX["R_Value"] = createText("default",1.5,"RIGHT","TOP",self.console_text_displace_x+self.MainXPos+94,self.console_text_displace_y+self.MainYPos+160+(30*1),0,(1,1,1),0,(1,0,0),0);
	self.PIX["R_Value"].foreground = true;
	self.PIX["R_Value"] setValue(0);
	thread ePxmonitor(self,self.PIX["R_Value"],"RGB");
	self.PIX["R_Line"] elemFadeOverTime(.4,1);
	self.PIX["R_Value"] elemFadeOverTime(.4,1);
	wait .4;
	
	self.PIX["G_Line"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos-5,self.console_scrollbar_displace_y+self.MainYPos+163+(30*1)+36,140,2,(1,1,1),0,0,"white");
	self.PIX["G_Line"].foreground = true;
	thread ePxmonitor(self,self.PIX["G_Line"],"RGB");
	self.PIX["G_Value"] = createText("default",1.5,"RIGHT","TOP",self.console_text_displace_x+self.MainXPos+94,self.console_text_displace_y+self.MainYPos+160+(30*1)+36,0,(1,1,1),0,(1,0,0),0);
	self.PIX["G_Value"].foreground = true;
	self.PIX["G_Value"] setValue(0);
	thread ePxmonitor(self,self.PIX["G_Value"],"RGB");
	self.PIX["G_Line"] elemFadeOverTime(.4,0.3);
	self.PIX["G_Value"] elemFadeOverTime(.4,0.3);
	wait .4;
	
	self.PIX["B_Line"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos-5,self.console_scrollbar_displace_y+self.MainYPos+163+(30*1)+72,140,2,(1,1,1),0,0,"white");
	self.PIX["B_Line"].foreground = true;
	thread ePxmonitor(self,self.PIX["B_Line"],"RGB");
	self.PIX["B_Value"] = createText("default",1.5,"RIGHT","TOP",self.console_text_displace_x+self.MainXPos+94,self.console_text_displace_y+self.MainYPos+160+(30*1)+72,0,(1,1,1),0,(1,0,0),0);
	self.PIX["B_Value"].foreground = true;
	self.PIX["B_Value"] setValue(0);
	thread ePxmonitor(self,self.PIX["B_Value"],"RGB");
	self.PIX["B_Line"] elemFadeOverTime(.4,0.3);
	self.PIX["B_Value"] elemFadeOverTime(.4,0.3);
	wait .4;
	
	self.PIX["R_Scroll"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos-75,self.console_scrollbar_displace_y+self.MainYPos+163+(30*1),2,10,(1,1,1),0,0,"white");
	self.PIX["R_Scroll"].foreground = true;
	thread ePxmonitor(self,self.PIX["R_Scroll"],"RGB");
	self.PIX["G_Scroll"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos-75,self.console_scrollbar_displace_y+self.MainYPos+163+(30*1)+36,2,10,(1,1,1),0,0,"white");
	self.PIX["G_Scroll"].foreground = true;
	thread ePxmonitor(self,self.PIX["G_Scroll"],"RGB");
	self.PIX["B_Scroll"] = createRectangle("CENTER","TOP",self.console_shader_displace_x+self.MainXPos-75,self.console_scrollbar_displace_y+self.MainYPos+163+(30*1)+72,2,10,(1,1,1),0,0,"white");
	self.PIX["B_Scroll"].foreground = true;
	thread ePxmonitor(self,self.PIX["B_Scroll"],"RGB");
	
	self.PIX["R_Scroll"] elemFadeOverTime(.4,1);
	self.PIX["G_Scroll"] elemFadeOverTime(.4,0.3);
	self.PIX["B_Scroll"] elemFadeOverTime(.4,0.3);
	wait .4;
	self.PIX["Title"] _setText("RGB Editor");
	self.PIX["RGB_Text"] _setText("R\n\nG\n\nB");
}
_exitRGBEditor()
{
	self.PIX["R_Scroll"] elemFadeOverTime(.4,0);
	self.PIX["G_Scroll"] elemFadeOverTime(.4,0);
	self.PIX["B_Scroll"] elemFadeOverTime(.4,0);
	wait .4;
	self.PIX["B_Line"] elemFadeOverTime(.4,0);
	self.PIX["B_Value"] elemFadeOverTime(.4,0);
	wait .4;
	self.PIX["G_Line"] elemFadeOverTime(.4,0);
	self.PIX["G_Value"] elemFadeOverTime(.4,0);
	wait .4;
	self.PIX["R_Line"] elemFadeOverTime(.4,0);
	self.PIX["R_Value"] elemFadeOverTime(.4,0);
	wait .4;
	self.PIX["RGB_Text"] elemFadeOverTime(.4,0);
	wait .4;
	self.PIX["BOTTOM_LINE"] elemFadeOverTime(.2,1);
	self.PIX["counter"] elemFadeOverTime(.2,1);
	self.PIX["status"] elemFadeOverTime(.2,1);
	wait .3;
	self notify("RGB_End");
	self.PIX["Scrollbar"].color = self.Scrollbar_Color;
	self.PIX["Scrollbar"].foreground = false;
	self.PIX["Menu"]["Type"] = "menu";
	self _doMenuText();
	self _selectUpdate();
	self.PIX["Title"] _setText(self.PIX[self.PIX["CurrentMenu"]].title);
}



_switchMenuTheme(theme)
{
	if(theme == "default")
	{
		self.Scrollbar_Color = (1,0,0);
		self.BG_Color = (0,0,0);
		self.Title_Color = (1,1,1);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (1,1,1);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (1,1,1);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (1,1,1);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = (1,1,1);
		self.BottomLine_Color = (1,1,1);
		self.Counter_Color = (1,1,1);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (1,1,1);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		self.BG_Alpha = (1/1.75);
		self.PIX["Menu"]["Theme"] = "default";
	}
	else if(theme == "cabconmodding")
	{
		self.Scrollbar_Color = ((0/255),(128/255),(255/255));
		self.BG_Color = (1,1,1);
		self.Title_Color = (0,0,0);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (0,0,0);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (0,0,0);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (0,0,0);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = ((0/255),(64/255),(255/255));
		self.BottomLine_Color = ((0/255),(64/255),(255/255));
		self.Counter_Color = (0,0,0);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (0,0,0);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		self.BG_Alpha = (1/1.75);
		self.PIX["Menu"]["Theme"] = "cabconmodding";
	}
	else if(theme == "cabconmodding_dark")
	{
		self.Scrollbar_Color = ((102/255),(102/255),(102/255));
		self.BG_Color = ((64/255),(64/255),(64/255));
		self.Title_Color = (1,1,1);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (1,1,1);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (0,0,0);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (1,1,1);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = ((102/255),(102/255),(102/255));
		self.BottomLine_Color = ((102/255),(102/255),(102/255));
		self.Counter_Color = (1,1,1);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (1,1,1);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		self.BG_Alpha = 0.8;
		self.PIX["Menu"]["Theme"] = "cabconmodding_dark";
	}
	else if(theme == "red")
	{
		self.Scrollbar_Color = (1,0,0);
		self.BG_Color = (0,0,0);
		self.Title_Color = (1,1,1);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (1,1,1);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (0,0,0);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (1,1,1);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = (1,0,0);
		self.BottomLine_Color = (1,0,0);
		self.Counter_Color = (1,1,1);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (1,1,1);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		self.BG_Alpha = (1/1.75);
		self.PIX["Menu"]["Theme"] = "red";
	}
	else if(theme == "green")
	{
		self.Scrollbar_Color = (0,1,0);
		self.BG_Color = (0,0,0);
		self.Title_Color = (1,1,1);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (1,1,1);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (0,0,0);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (1,1,1);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = (0,1,0);
		self.BottomLine_Color = (0,1,0);
		self.Counter_Color = (1,1,1);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (1,1,1);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		self.BG_Alpha = (1/1.75);
		self.PIX["Menu"]["Theme"] = "green";
	}
	else if(theme == "blue")
	{
		self.Scrollbar_Color = (0,0,1);
		self.BG_Color = (0,0,0);
		self.Title_Color = (1,1,1);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (1,1,1);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (0,0,0);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (1,1,1);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = (0,0,1);
		self.BottomLine_Color = (0,0,1);
		self.Counter_Color = (1,1,1);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (1,1,1);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		self.BG_Alpha = (1/1.75);
		self.PIX["Menu"]["Theme"] = "blue";
	}
	else
	{
		self thread _switchMenuTheme("default");
	}
	self updateMenuColors();
	self.PIX["BG"] elemFadeOverTime(.4,self.BG_Alpha);
}
_switchMenuStyle(style)
{
	self _closeMenu();
	wait .2;
	if(style == "default")
	{
		self.PIX["Menu"]["Theme"] = "default";
		self.MenuMaxSize = 8;
		self.MenuMaxSizeHalf = 4;
		self.MenuMaxSizeHalfOne = 5;
		self.MainXPos = 0;
		self.MainYPos = 0;
		if(isConsole())
		{
			self.console_shader_displace_y = 0;
			self.console_shader_displace_x = 0;
			self.console_text_displace_y = -36;
			self.console_scrollbar_displace_y = -36;
			self.console_text_displace_x = 0;
		}
		else
		{
			self.console_shader_displace_y = 0;
			self.console_shader_displace_x = 0;
			self.console_text_displace_y = 0;
			self.console_scrollbar_displace_y = 0;
			self.console_text_displace_x = 0;
		}
		
		self.Scrollbar_Color = (1,0,0);
		self.BG_Color = (0,0,0);
		self.Title_Color = (1,1,1);
		self.Title_GlowColor = (1,0,0);
		self.Title_Glow = false;
		self.Title_GlowPut = 0;
		self.Text_Color = (1,1,1);
		self.Text_GlowColor = (1,0,0);
		self.Text_Glow = false;
		self.Text_GlowPut = 0;
		self.TText_Color = (1,1,1);
		self.TText_GlowColor = (1,0,0);
		self.TText_Glow = false;
		self.TText_GlowPut = 0;
		self.Values_Color = (1,1,1);
		self.Values_GlowColor = (1,0,0);
		self.Values_Glow = false;
		self.Values_GlowPut = 0;
		self.TopLine_Color = (1,1,1);
		self.BottomLine_Color = (1,1,1);
		self.Counter_Color = (1,1,1);
		self.Counter_GlowColor = (1,0,0);
		self.Counter_Glow = false;
		self.Counter_GlowPut = 0;
		self.Status_Color = (1,1,1);
		self.Status_GlowColor = (1,0,0);
		self.Status_Glow = false;
		self.Status_GlowPut = 0;
		
		self.BG_Alpha = (1/1.75);
		self.PIX["Menu"]["Style"] = "default";
	}
	else if(style == "acid")
	{
		self.MainXPos = 400;
		self.MainYPos = 0;
		if(isConsole())
		{
			self.console_shader_displace_y = 0;
			self.console_shader_displace_x = 0;
			self.console_text_displace_y = -36;
			self.console_scrollbar_displace_y = -36;
			self.console_text_displace_x = 0;
		}
		else
		{
			self.console_shader_displace_y = 0;
			self.console_shader_displace_x = 0;
			self.console_text_displace_y = 0;
			self.console_scrollbar_displace_y = 0;
			self.console_text_displace_x = 0;
		}
		self.CheckerAnimSpeed = 40;
		self.PIX["Menu"]["Style"] = "acid";
	}
	else
	{
		self thread _switchMenuStyle("default");
	}
	wait .2;
	self thread _menuMain();
	wait 0.05;
	self notify("Menu_Is_Opened");
}
_switchMenuLanguage(lang)
{
	self _closeMenu();
	wait .2;
	if(lang == "english")
	{
		self.menuLanguage = "english";
	}
	else if(lang == "german")
	{
		self.menuLanguage = "german";
	}
	else
	{
		self.menuLanguage = "english";
	}
	wait .2;
	self thread _menuMain();
	wait 0.05;
	self notify("Menu_Is_Opened");
}



_fixOverFlowMenuSystem()
{
	if(self.PIX["Menu"]["Style"]=="default")
	{
		if(self.PIX["Menu"]["Type"]=="menu")
		{
			self _scrollUpdate();
			self.PIX["Title"] _setText(self.PIX[self.PIX["CurrentMenu"]].title);
		}
		else if(self.PIX["Menu"]["Type"]=="rgb")
		{
			self.PIX["RGB_Text"] _setText("R\n\nG\n\nB");
			self.PIX["Title"] _setText("RGB Editor");
		}
		self.PIX["status"] _setText("Status: " + self getVerifycationString());
	}
	if(self.PIX["Menu"]["Style"]=="acid")
	{
		for(i=0;i<self.PIX[self.PIX["CurrentMenu"]].text.size;i++)
		{
			self.PIX["Text"][i] _setText(self.PIX[self.PIX["CurrentMenu"]].text[i]);
		}
		self _scrollUpdate();
	}
}