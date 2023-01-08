diag_log format ["Client_init: %1", profileName];

///////////////////////
// DUWS_X Client INIT
///////////////////////

// BLACK SCREEN
titleCut ["", "BLACK FADED", 999];
waitUntil {sleep 0.1;!isNull player};

// Host waits for Server init
//if (isServer) then {
	waitUntil {sleep 0.1;serverinit_complete};
//};

// KEEP DIPSHITS FROM DROWNING
[] spawn {
	while {!WARCOM_init_done} do {
		player setOxygenRemaining 1;
		sleep 10;
	};
};

// Set GameMaster
if (!isMultiplayer) then {
	game_master = vehiclevarname player;
};

#include "..\includes\supports_init.hpp"
#include "..\includes\squad_number_init.hpp"

// VERSION specific inits
switch (VERSION_X) do {
	case "MODERN": {
		// Create "firedNear" event for players
		// - if enemy present, play music
		// [] spawn fnc_dyn_music_init;
		
		// AMBIANCE LOOP
		[] spawn fnc_ambient_musicloop;
	};
	case "WW2": {
		// Dang's DUWS-R Music mod scripts
		// - plays Dangs music if mod is loaded
		Soundtrack = ["Soundtrack", 0] call BIS_fnc_getParamValue;
		if (Soundtrack == 0) exitWith {};
		if (Soundtrack == 1) then {ExecVm "sounds\musicHandler_WW2\musicHandler.sqf"};
		if (Soundtrack == 2) then {ExecVm "sounds\musicHandler_WW2\musicHandler1.sqf"};  
		if (Soundtrack == 3) then {ExecVm "sounds\musicHandler_WW2\musicHandler2.sqf"};
		if (Soundtrack == 4) then {ExecVm "sounds\musicHandler_WW2\musicHandler3.sqf"};
		if (Soundtrack == 5) then {ExecVm "sounds\musicHandler_WW2\musicHandler4.sqf"};
	};
	case "VIETNAM": {
		// Dang's DUWS-R Music mod scripts
		// - plays Dangs music if mod is loaded
		Soundtrack = ["Soundtrack", 0] call BIS_fnc_getParamValue;
		if (Soundtrack == 0) exitWith {};
		if (Soundtrack == 1) then {ExecVm "sounds\musicHandler_VIETNAM\musicHandler.sqf"};
	};
};

// JIP SCREEN, open map
if (isMultiplayer) then {
	
	if (((vehiclevarname player) != "player1" && !WARCOM_init_done) || WARCOM_init_done) then {
		//titleCut ["", "BLACK FADED", 999];
		diag_log format ["%1 Init %2", profileName,(vehiclevarname player)];
		titleCut ["", "BLACK IN", 10];
		forceMap true;
		mapAnimAdd [3, 1, [5000,5000]];
		mapAnimCommit;
		sleep 3;
		openMap [true, true];
	};

};

//////////////////////
// GAMEMASTER DIALOG
//////////////////////
if (((vehiclevarname player) in game_master) && !HQ_pos_found_generated) then {

	// First Menu
	[] call fnc_HQ_faction_dialog;

	//titleCut ["", "BLACK IN", 10];
	
	waitUntil {sleep 0.1;chosen_hq_placement};
	
	// Custom FACTION Dialog
	if (BLUFOR_Faction_X == "CUSTOM" || OPFOR_Faction_X == "CUSTOM") then {
		//titleCut ["", "BLACK FADED", 999];
		_handle = createDialog "startup_faction";
		waitUntil {dialog};
		// wait for the Factions to be pasted
		if (BLUFOR_Faction_X == "CUSTOM") then {
			waitUntil {sleep 0.1;BLUfactionDataTemp != ""};
		}; 
		if (OPFOR_Faction_X == "CUSTOM") then {
			waitUntil {sleep 0.1;OPFfactionDataTemp != ""};
		};
	};

	//  ZONE SETTINGS DIALOG
	if (!zones_created) then {

		//titleCut ["", "BLACK FADED", 999];

		// SHOW THE STARTUP ENVIRO MENU
		if (!zones_created) then {
			sleep 0.1;
			[] spawn fnc_enviro_menu;
			waitUntil {sleep 0.1;chosen_settings};  // WAIT UNTIL THE PLAYER HAS CHOSEN THE SETTINGS
			//titleCut ["", "BLACK IN", 10];
		};
	};
};

// Open Map for Gamemaster (Random Zones)
if ((vehiclevarname player) in game_master && !manually_chosen) then {
	//titleCut ["", "BLACK FADED", 999];
	titleCut ["", "BLACK IN", 10];
	forceMap true;
	mapAnimAdd [3, 1, PosOfBLUHQ];
	mapAnimCommit;
	sleep 3;
	openMap [true, true];
};

waitUntil {isPlayer Player};

///////////////////////////////////////////////
// Game Master: wait for Zones to start init 
// or JIP: update map screen
///////////////////////////////////////////////
if (((vehiclevarname player) in game_master)) then {
	waitUntil {sleep 0.1;count serv_zones_array > 0};
	//titleCut ["", "BLACK FADED", 999];
} else {
	if (!WARCOM_init_done) then {
		hintsilent "Waiting for serverinit_complete";
		waitUntil {sleep 0.1;serverinit_complete};
		waitUntil {
			hintsilent localize "STR_DUWS_X_1lhmuan7";
			sleep 5;
			HQ_pos_found_generated
		};
		waitUntil {
			hintsilent localize "STR_DUWS_X_8dztgj1i";
			sleep 5;
			chosen_settings
		};
	};
};

////////////////////////
//  WAIT FOR WARCOM 
////////////////////////
waituntil {sleep 1;WARCOM_init_done;};

// Draw the HQ icon on map
[] spawn fnc_draw_HQicon;


//////////////////////////
//  JIP CODE
//////////////////////////

if (isMultiplayer) then {

	// change the shown CP for request dialog
	"commandpointsblu1" addPublicVariableEventHandler {ctrlSetText [1000, format["%1",commandpointsblu1]]; };
	
	///////////////////////////////////////////
	// Initialize the BLUFOR FACTION for JIP
	///////////////////////////////////////////
	diag_log format ["BLUFOR Faction init for JIP: %1", BLUFOR_Faction_X];
	if (BLUFOR_Faction_X == "CUSTOM") then {
		waitUntil {sleep 0.1;count BLUfactionData > 0};
		{
			call compile _x;
		} forEach BLUfactionData;
	} else {
		[] call fnc_BLUFOR_FactionFile_X;
	};
	sleep 1;
	diag_log format ["Blufor Faction init for JIP complete.  Rifleman: %1", blufor_SOLDIER_X];

};

// CP Death Penalty EventHandler
PlayerKilledEH = player addEventHandler ["killed", {
	commandpointsblu1 = commandpointsblu1 - DUWSMP_CP_death_cost;
	publicVariable "commandpointsblu1";
}];

// ENABLE STAMINA
player_fatigue = 0;
if (staminaEnabled == true) then {
	player enableStamina true;
	player_fatigue = 1;
} else {
	player enableStamina false;
};

// init the extras for REQUEST players (squad leads)
if ((vehiclevarname player) in Request_Players) then {
	player setUnitTrait ["Medic",true];
	player setUnitTrait ["Engineer",true];
	player setUnitTrait ["uavHacker",true];
	// wait until blu captures at least one zone
	[] spawn fnc_zones_bonus;
	// INIT the max support variable
	support_count = 0;
	//INIT HC module
	diag_log "HC init";
	[] spawn fnc_hc_init;
};

/////////////////////////////
// INIT the operative list
////////////////////////////

[] spawn fnc_operator_init;


// INIT Markers if difficulty < veteran
_difficulty_setting = difficulty;
[] call fnc_kndr_unit_markers;
if (_difficulty_setting < 2 || (difficultyOption "mapContentFriendly") == 1) then { 
	if (isMultiplayer) then {
		["players"] spawn fnc_player_markers;
	};
};

// INIT Earplugs
AddEarplugsEH = player addEventHandler ["GetinMan", {
    toggle_earplugs = player addaction [localize "STR_DUWS_X_2rc0nvug",fnc_earplugs, "", 0, true, true, "", "_this == player"];
}];
RemoveEarplugsEH = player addEventHandler ["GetoutMan", {
    player removeAction toggle_earplugs;
if (soundVolume == 0.3) then {hint localize "STR_DUWS_X_gut0c4f8"};
	5 fadesound 1;
}];

// Create Diary/Help entry on the Map
[] spawn fnc_duws_help;

// INIT R3F Logistics
//execVM "R3F_LOG\init.sqf";

// Add HQ actions for REQUEST Players
[bluHQ_object] spawn fnc_HQaddactions;

if ((vehiclevarname player) in game_master) then {
	sleep 10;
} else {	
	["info",[localize "STR_DUWS_X_ma8d1xaz",localize "STR_DUWS_X_wdpxsunk"]] call bis_fnc_showNotification;
	sleep 10;
};

////////////////////////
// TELEPORT PLAYER
////////////////////////

["info",[localize "STR_DUWS_X_zt70beop",localize "STR_DUWS_X_wcxfk0a1"]] call bis_fnc_showNotification;
hint localize "STR_DUWS_X_zu4bxt24";

///// DUWS_X  SET PLAYER LOADOUT TO FACTION LOADOUT
[] spawn fnc_player_faction_loadout;

sleep 5;
_currVolume = musicVolume;
if (VERSION_X != "WW2" && VERSION_X != "VIETNAM") then {
	5 fadeMusic 0; // fade current music volume to 0 in 5 sec
};	
titleCut ["", "BLACK FADED", 999];
sleep 5;
if (VERSION_X != "WW2" && VERSION_X != "VIETNAM") then {
	5 fadeMusic _currVolume; // fade current music volume to 0 in 5 sec
};

// close map
forceMap false;
sleep 1;
openMap [false, false];

// force cloud rendering start
skiptime -3;

// Teleport player
player setpos [(PosOfBLUHQ select 0),(PosOfBLUHQ select 1)+15];

// Teleport music
playMusic ["EventTrack01a_F_EPA", 0];

// Welcome to {worldName}
[] spawn fnc_bottom_right_message;
hintsilent format[localize "STR_DUWS_X_ix8g2neb",worldName,profileName];
titleCut ["", "BLACK IN", 10];

player setVariable["Saved_Loadout", getUnitLoadout player];
player setdamage 0;	
player allowDamage true;

// force cloud rendering finish
skiptime 3;

// FINAL JIP CODE
if (isMultiplayer) then {
	[] spawn {
		sleep 5;
		["info",[localize "STR_DUWS_X_qs2vfigs",localize "STR_DUWS_X_towt823p"]] call bis_fnc_showNotification;
	};	
};
// Zeus disconnect fix and Add SITREP to Gamemaster	
if ((vehiclevarname player) in game_master || !isMultiplayer) then {
	// Zeus disconnect fix
	[Curator] remoteExec ["unassignCurator",2];
	sleep 2;
	[player, Curator] remoteExec ["assignCurator",2];
	[] spawn {
		sleep 10;
		_sitrep = [player,"sitrep"] call BIS_fnc_addCommMenuItem;
	};
};
	



