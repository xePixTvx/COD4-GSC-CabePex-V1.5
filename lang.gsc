#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
/*
▒█▀▀█ █▀▀█ █▀▀▄ ▒█▀▀█ █▀▀█ █░█ 
▒█░░░ █▄▄█ █▀▀▄ ▒█▄▄█ █▄▄█ ▄▀▄ 
▒█▄▄█ ▀░░▀ ▀▀▀░ ▒█░░░ ▀░░▀ ▀░▀ 
	cabconmodding.com
*/

init_menu_language()
{
	level.menu_lang = [];
	level.menu_lang["english"] = spawnStruct();
	level.menu_lang["german"] = spawnStruct();
	
	level.menu_lang["english"].exampleText = "Example Text";
	level.menu_lang["german"].exampleText = "Beispiel Text";
	
	
	//Main Menu
	level.menu_lang["english"].main_settings = "Settings";
	level.menu_lang["english"].main_account = "Account Settings";
	level.menu_lang["english"].main_mainmods = "Main Modifications";
	level.menu_lang["english"].main_fun = "Fun Menu";
	level.menu_lang["english"].main_weapons = "Weapons Menu";
	level.menu_lang["english"].main_weaponmods = "Weapon Mods Menu";
	level.menu_lang["english"].main_visions = "Visions Menu";
	level.menu_lang["english"].main_visuals = "Visual Modifications";
	level.menu_lang["english"].main_sounds = "Soundboard Menu";
	level.menu_lang["english"].main_aimbot = "Aimbot Menu";
	level.menu_lang["english"].main_killstreaks = "Killstreak Menu";
	level.menu_lang["english"].main_teleport = "Teleport Menu";
	level.menu_lang["english"].main_hitmarker = "Hitmarker";
	level.menu_lang["english"].main_admin = "Admin";
	level.menu_lang["english"].main_bots = "Bots Menu";
	level.menu_lang["english"].main_lobbymods = "Lobby Modifications";
	level.menu_lang["english"].main_modmenus = "Mod Menus";
	level.menu_lang["english"].main_clientmenus = "Client Menus";
	
	level.menu_lang["german"].main_settings = "Einstellungen";
	level.menu_lang["german"].main_account = "Profil Einstellungen";
	level.menu_lang["german"].main_mainmods = "Einfache Mods";
	level.menu_lang["german"].main_fun = "Spass Mods";
	level.menu_lang["german"].main_weapons = "Waffen Menu";
	level.menu_lang["german"].main_weaponmods = "Waffen Mods Menu";
	level.menu_lang["german"].main_visions = "Visionen";
	level.menu_lang["german"].main_visuals = "Visuelle Mods";
	level.menu_lang["german"].main_sounds = "Soundboard Menu";
	level.menu_lang["german"].main_aimbot = "Aimbot";
	level.menu_lang["german"].main_killstreaks = "Abschussserien Menu";
	level.menu_lang["german"].main_teleport = "Teleportier Menu";
	level.menu_lang["german"].main_hitmarker = "Hitmarker";
	level.menu_lang["german"].main_admin = "Administrator";
	level.menu_lang["german"].main_bots = "Bots Menu";
	level.menu_lang["german"].main_lobbymods = "Lobby Mods";
	level.menu_lang["german"].main_modmenus = "Mod Menus";
	level.menu_lang["german"].main_clientmenus = "Spieler Menus";
	
	
	//Menu System Settings
	level.menu_lang["english"].menu_sets_title = "Settings";
	level.menu_lang["english"].menu_sets_changelang = "Change Language";
	level.menu_lang["english"].menu_sets_menustyles = "Menu Styles";
	level.menu_lang["english"].menu_sets_menuthemes = "Menu Themes";
	level.menu_lang["english"].menu_sets_editmenu = "Edit Menu Styling";
	level.menu_lang["english"].menu_sets_freezecontrol = "Freeze Control in Menu";
	level.menu_lang["english"].menu_sets_cursorrem = "Controller Remembrance";
	level.menu_lang["english"].menu_sets_movemenu = "Move Menu";
	
	level.menu_lang["german"].menu_sets_title = "Einstellungen";
	level.menu_lang["german"].menu_sets_changelang = "Sprache wechseln";
	level.menu_lang["german"].menu_sets_menustyles = "Menu Stile";
	level.menu_lang["german"].menu_sets_menuthemes = "Menu Themen";
	level.menu_lang["german"].menu_sets_editmenu = "Menu Stil bearbeiten";
	level.menu_lang["german"].menu_sets_freezecontrol = "Bewegungsunfaehigkeit im Menu";
	level.menu_lang["german"].menu_sets_cursorrem = "Cursor Position Merken";
	level.menu_lang["german"].menu_sets_movemenu = "Menu Position veraendern";
}