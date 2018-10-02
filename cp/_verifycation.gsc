#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include cp\_overFlow;

#include cp\_common_scripts;
#include cp\_main;
#include cp\menu\_menu;
/*
	self.Verifycation = 0; Unverified
	self.Verifycation = 1; Vip
	self.Verifycation = 2; Admin
	self.Verifycation = 3; Host
*/

setVerifycationOnConnect()
{
	if(self isHost())
	{
		setVerifycation(self,3,"Host");
	}
	else
	{
		setVerifycation(self,0);
	}
}

monitorVerifycations()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("Verifycation_Changed");
		if(self.Verifycation==0)
		{
			self _removeMenu();
			self iprintln("Verifycation Changed to ^2UNVERIFIED");
		}
		else if(self.Verifycation==1)
		{
			self iprintln("Verifycation Changed to ^3VIP");
		}
		else if(self.Verifycation==2)
		{
			self iprintln("Verifycation Changed to ^1ADMIN");
		}
		else if(self.Verifycation==3)
		{
			self iprintln("Verifycation Changed to ^2HOST");
		}
		if(self.Verifycation>0)
		{
			if(self.hasMenu==true)
			{
				if(self.PIX["Menu"]["Open"]==true)
				{
					self _closeMenu();
					wait 0.05;
				}
			}
			else
			{
				self _giveMenu();
				self iprintln("Press ^2[{+speed_throw}]^7 + ^2[{+melee}]^7 to Open Menu");
				self iprintlnBold("Press ^2[{+speed_throw}]^7 + ^2[{+melee}]^7 to Open Menu");
				self iprintln("^4cabconmodding.com");
			}
		}
		wait 0.05;
	}
}

setVerifycation(client,v,abc)
{
	if(!isDefined(abc))
	{
		if(client isHost())
		{
			self iprintln("^1Cant do that with the Host Player!");
			return;
		}
	}
	client.Verifycation = v;
	if(client.Verifycation==0)
	{
		self iprintln(client.name+"'s Verifycation Status Changed to: UnVerified");
	}
	if(client.Verifycation==1)
	{
		self iprintln(client.name+"'s Verifycation Status Changed to: Vip");
	}
	if(client.Verifycation==2)
	{
		self iprintln(client.name+"'s Verifycation Status Changed to: Admin");
	}
	if(client.Verifycation==3)
	{
		self iprintln(client.name+"'s Verifycation Status Changed to: Host");
	}
	client notify("Verifycation_Changed");
}


isUnverified()
{
	if(self.Verifycation==0)
	{
		return true;
	}
	return false;
}
isVip()
{
	if(self.Verifycation==1)
	{
		return true;
	}
	return false;
}
isAdmin()
{
	if(self.Verifycation==2)
	{
		return true;
	}
	return false;
}
isSystemHost()
{
	if(self.Verifycation==3)
	{
		return true;
	}
	return false;
}
getVerifycationString()
{
	string = "";
	if(self isUnverified())
	{
		string = "^7UnVerified";
	}
	else if(self isVip())
	{
		string = "^2VIP";
	}
	else if(self isAdmin())
	{
		string = "^4Admin";
	}
	else if(self isSystemHost())
	{
		string = "^1Host";
	}
	else
	{
		string = "^1NOT FOUND";
	}
	return string;
}
_countVerifycations()
{
	level endon("game_ended");
	for(;;)
	{
		level waittill("recount_verifycations");
		un = 0;
		vip = 0;
		adm = 0;
		hos = 0;
		for(i=0;i<level.players.size;i++)
		{
			if(level.players[i] isUnverified())
			{
				un ++;
			}
			if(level.players[i] isVip())
			{
				vip ++;
			}
			if(level.players[i] isAdmin())
			{
				adm ++;
			}
			if(level.players[i] isSystemHost())
			{
				hos ++;
			}
		}
		level.Unverified_clients = un;
		level.Vip_clients = vip;
		level.Admin_clients = adm;
		level.SystemHost_clients = hos;
		wait 0.05;
	}
}