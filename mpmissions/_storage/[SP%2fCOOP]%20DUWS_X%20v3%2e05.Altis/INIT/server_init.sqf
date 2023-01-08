diag_log format ["Server_init: %1", profileName];

// DEFINE SERVER VARIABLES and FUNCTIONS
[] call compile preprocessFileLineNumbers "init\server_var_init.sqf";
[] call compile preprocessFileLineNumbers "init\server_fnc_init.sqf";

// Init the URBAN LOCATION FINDER
[] spawn fnc_moreUrban_locations;

// Create centers
createCenter sideLogic;
createcenter sideLogic;
LogicGroup = createGroup SideLogic;
createCenter west;
createCenter east;
createCenter resistance;
createCenter civilian;

// Set relationships
west setFriend [east, 0];
west setFriend [resistance, 0];
east setFriend [west, 0];
east setFriend [resistance, 0];
resistance setFriend [west, 0];
resistance setFriend [east, 0];
civilian setFriend [west, 1];
civilian setFriend [east, 1];

// CHECK FACTION FILES
[] call fnc_factions_check;

sleep 1;

// Send "complete" to client
serverinit_complete = true;
publicVariable "serverinit_complete";

// wait for HQ placement
waitUntil {sleep 0.1;chosen_hq_placement};

// wait for CUSTOM FACTIONS to be pasted
diag_log format ["Server waiting for BLU faction Data Temp"];
if (BLUFOR_Faction_X == "CUSTOM") then {waitUntil {sleep 0.1;BLUfactionDataTemp != ""}};
if (OPFOR_Faction_X == "CUSTOM") then {waitUntil {sleep 0.1;OPFfactionDataTemp != ""}};

///////////////////////
// INIT THE FACTIONS
///////////////////////

// BLUFOR
diag_log format ["BLUFOR Faction init on server: %1", BLUFOR_Faction_X];

if (BLUFOR_Faction_X == "CUSTOM") then {
	["blufor"] call fnc_custom_faction_init;
	waitUntil {sleep 0.1;count BLUfactionData > 0};
} else {
	[] call fnc_BLUFOR_faction_init;
};
diag_log format ["Blufor Faction init on server complete.  Rifleman: %1", blufor_SOLDIER_X];
diag_log format ["Blufor Faction init on server complete.  blufor RQST VEHICLE 01: %1", blufor_RQST_VEHICLE_01_X];

// create the BLUFOR squads
[] call fnc_BLUFOR_squad_init;
diag_log format ["blufor RECON_TEAM: %1", str blufor_RECON_TEAM_X];


// OPFOR
if (opfor_SOLDIER_X == "") then {
	diag_log format ["OPFOR Faction init on server: %1", OPFOR_Faction_X];

	if (OPFOR_Faction_X == "CUSTOM") then {
		["opfor"] call fnc_custom_faction_init;
		waitUntil {sleep 0.1;count OPFfactionData > 0};
	} else {
		[] call fnc_OPFOR_faction_init;
	};
	diag_log format ["Opfor Warcom Faction init on server complete.  Rifleman: %1", opfor_SOLDIER_X];
	diag_log format ["Opfor Warcom Faction init on server complete.  Spec Ops: %1", opfor_SPECOPS_X];

	// create the BLUFOR squads
	[] call fnc_OPFOR_squad_init;
	diag_log format ["opfor INF_TEAM: %1", str opfor_INFTEAM_X];

};

///////////////////////////
// Init the Ammobox lists
///////////////////////////
[] spawn fnc_create_ammo_lists;


////////////////////
// Init the BLU HQ
////////////////////
diag_log format ["bluHQ Position: %1", str PosOfBLUHQ];
[] spawn fnc_bluHQinit;

// Initialize the Dynamic Groups framework
["Initialize"] call BIS_fnc_dynamicGroups; 

enableSaving [false, false];

//////////////////////////////////////////////
/////  WAIT FOR HQ SPAWNS
//////////////////////////////////////////////

diag_log "SERVER HQ_pos_found_generated";
waitUntil {sleep 0.1;HQ_pos_found_generated};

//////////////////////////////////////////////
/////  WAIT FOR MISSION SETTINGS DIALOG
//////////////////////////////////////////////

diag_log "SERVER chosen_settings";
waitUntil {sleep 0.1;chosen_settings}; 
diag_log "SERVER createzone_server";
waitUntil {sleep 0.1;createzone_server};
// use weapons instead items, some factions bork on items
diag_log "SERVER opfor_ammobox_weapons";
waitUntil {sleep 0.1;(count opfor_ammobox_weapons) > 0};


////////////////////////////////////
//  INIT OPFOR Faction & WARCOM
////////////////////////////////////
diag_log format ["WARCOM INIT"];
[] spawn fnc_init_OPFOR_WARCOM;


/////////////////////////////////
// CREATE MAIN TASK/OBJECTIVE
/////////////////////////////////
[] spawn fnc_capture_zones_task;


///////////////////////////////////////////////////////
// Create the array of zone sizes for DESPAWN CLEANUP
///////////////////////////////////////////////////////
[] spawn fnc_zone_spawn_sizes;


// WEATHER INIT
if (dynamic_weather_enable) then {
	[] spawn fnc_weather;
};

/////////////////////////////////
//  MAP OBJECT CLEANING SCRIPT
/////////////////////////////////
[
	10*60,   // seconds to delete dead bodies (0 means don't delete)
	5*60,    // seconds to delete dead vehicles (0 means don't delete)
	30*60,   // seconds to delete immobile vehicles (0 means don't delete)
	10*60,   // seconds to delete dropped weapons (0 means don't delete)
	0,       // seconds to delete planted explosives (0 means don't delete)
	10*60    // seconds to delete dropped smokes/chemlights (0 means don't delete)
] spawn fnc_repetitive_cleanup;

// Cleanup unused players slots.
for[{_x = 2},{_x <= 36},{_x = _x + 1}] do {
    _thePlayer = missionNamespace getVariable format["player%1", _x];
    if(!isNil("_thePlayer")) then {
        if(!isPlayer _thePlayer) then {
            deleteVehicle _thePlayer;
        };
    };
};

waituntil {sleep 1;WARCOM_init_done;};

// prepopulate the Mission Locator
[] spawn fnc_missionLocator;

// SET OPFOR AI AIM to 0.2
// SET OPFOR/BLUFOR VEHICLES/UNITS REARM/REFUEL EVERY 10min
[] spawn fnc_AI_Master_Control;

// Init the Zeus objects
if (ZeusStatus != 0) then {
	[] spawn fnc_zeus_objects_init;
};

// EventHandler for Disconnected Players
// Convert HC squads to TaskForces
diag_log "Handle Disconnect";
[] spawn fnc_handleDisconnect;

// Set the date/time AFTER setting the current weather
setDate [2035, 8, 3, time_of_day, 0];
	
// Exec Vcom AI function
if (VCOM_AI_enable == true) then {
	[] spawn VCM_fnc_VcomInit;
};
	
// Speed up Time
if (time_Multiplier > 1) then {
	setTimeMultiplier time_Multiplier;
};
	
// CIV and WARCRIMES Spawn
if (CIV_PRESENCE != "NONE") then {
	[] spawn fnc_civ_init_Tomata;
	// START THE WARCRIMES SCRIPT
	[] spawn fnc_warcrimes_script;
};

// NO VCOM WAYPOINTS
VCM_ADVANCEDMOVEMENT = false;
publicVariable "VCM_ADVANCEDMOVEMENT";




