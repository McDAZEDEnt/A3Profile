

// create the building
_hq = "";
switch (VERSION_X) do {
	case "MODERN": {
		_hq = "Land_Cargo_HQ_V1_F" createVehicle PosOfBLUHQ;
	};
	case "WW2": {
		_hq = "Land_Bunker_01_HQ_F" createVehicle PosOfBLUHQ;
	};
	case "VIETNAM": {
		_centerSpawn = PosOfBLUHQ;
		_centerSpawnX = _centerSpawn select 0;
		_centerSpawnY = _centerSpawn select 1;
		_hq = createVehicle ["LAND_sb_bunker_main", [(_centerSpawnX)+0.0136719, (_centerSpawnY)+4.30835,0], [], 0, "CAN_COLLIDE"];
	};
};

bluHQ_object = _hq;
publicVariable "bluHQ_object";  // For the HQ addActions

diag_log "HQ Created";

// create marker on HQ
_markername = format["%1%2",round (PosOfBLUHQ select 0),round (PosOfBLUHQ select 1)]; // Define marker name
blu_hq_markername = _markername;publicVariable "blu_hq_markername";

//hint _markername;
_markerstr = createMarker [str(_markername), PosOfBLUHQ];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_flag";
str(_markername) setMarkerColor "ColorBlue";
str(_markername) setMarkerText "Main Base";

// make HQ zone notification trigger
_trg5=createTrigger["EmptyDetector",PosOfBLUHQ];
_trg5 setTriggerArea[100,100,0,false];
_trg5 setTriggerActivation["ANYPLAYER","PRESENT",true];
_trg5 setTriggerStatements["this", format["['%1',%2,'%3','%4',thisList] spawn fnc_enterlocation",'Main Base',0,'',''], ""];

// warning trigger when an enemy approaches the camp
_trgWarning=createTrigger["EmptyDetector",PosOfBLUHQ];
_trgWarning setTriggerArea[300,300,0,false];
_trgWarning setTriggerActivation["EAST","PRESENT",true];
_trgWarning setTriggerStatements["this","['This is HQ, there are enemies near our main base!'] spawn fnc_sideChat_filter", ""];
_trgWarning setTriggerTimeout [10, 10, 10, true];


// CREATE THE OFFICER
//_group = createGroup west;
//_hq = _group createUnit [blufor_OFFICER_X,(getmarkerpos str(blu_hq_markername)), [], 0, "FORM"];

_group = [(getmarkerpos str(blu_hq_markername)), WEST, [blufor_OFFICER_X]] call BIS_fnc_spawnGroup; 
_hq = units _group select 0;
blu_officer_object = _hq;publicVariable "blu_officer_object";
_group deleteGroupWhenEmpty true;

// UGLY HACKS FOR AI MODS SUPPORT
sleep 0.2;
_hq setformdir 200;

_hq allowFleeing 0;
_hq disableAI "TARGET";
_hq disableAI "FSM";
_hq disableAI "AUTOTARGET";
_hq disableAI "MOVE";
//Disable ASR for officer
_hq setVariable ["asr_ai_exclude", true];
//Disable VCOM for officer
_hq setVariable ["NOAI",1,false];
_hq setVariable ["Vcm_Disable",true];

// Assign the officer to global variable
hq_blu1 = _hq;
publicVariable "hq_blu1";

// Set the Officer position and Radio Chatter (Vietnam HQ has it's own radio sounds)
switch (VERSION_X) do {
	case "MODERN": {
		_hq setpos [PosOfBLUHQ select 0, PosOfBLUHQ select 1, 0.59]; 
		_hq setdir 270;
		[_hq] spawn fnc_radiochatter;
	};
	case "WW2": {
		_hq setpos [PosOfBLUHQ select 0, PosOfBLUHQ select 1, 0.59]; 
		_hq setdir 270;
		[_hq] spawn fnc_radiochatter;
	};
	case "VIETNAM": {
		_hq setpos [(PosOfBLUHQ select 0)+2.6, (PosOfBLUHQ select 1)-1.5, 0]; 
		_hq setdir 0;
	};
};

// Option to turn off HQ radio chatter
hq_blu1 addaction ["CANCEL RADIO",{cancel_radio = true;publicVariable "cancel_radio";removeAllActions hq_blu1}, "", 4, true, true, "", "_this == player"];

removeallweapons _hq;

//GUARDS
[(PosOfBLUHQ), bluHQ_object] spawn fnc_HQguards;

//STATIC DEFENSES
[(PosOfBLUHQ), bluHQ_object, false] spawn fnc_fortifyHQ;

//SET THE OFFICERS STANCE
_hq switchMove "acts_StandingSpeakingUnarmed";

// No blue hat for OPTRE, HL2 or TIOW or WW2/Vietnam
if (VERSION_X == "MODERN") then {
	if !(("OPTRE" in BLUFOR_FactionFile_X) 
		or ("HL2ECR" in BLUFOR_FactionFile_X)
		or ("TIOW" in BLUFOR_FactionFile_X)) then {
		removeheadgear _hq;
		_hq addHeadgear "H_MilCap_blue";
	};
};
// BEGIN LOOP "IF THE OFFICER IS DEAD"
[_hq] spawn {
    _hq = _this select 0;
    waitUntil {sleep 10;!alive _hq};
    _hq switchMove "AidlPercMstpSnonWnonDnon01";
	["TaskFailed",["",localize "STR_DUWS_X_amiszycs"]] call bis_fnc_showNotification;
	if (isMultiplayer) then {
		["TaskFailed",["",localize "STR_DUWS_X_amiszycs"]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated,FALSE];
	};
    sleep 6;
	[{hint localize "STR_DUWS_X_htwg04l5"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
	//"officerkilled" call BIS_fnc_endMissionServer;
};

//CREATE PATROL
[PosOfBLUHQ] spawn fnc_patrolHQ;

// IF THE OFFICER IS DEAD -- End OF "SPAWN"

//////// CREATE DEFAULT RESPAWN POSITION /////
"respawn_west" setMarkerPos [(PosOfBLUHQ select 0), (PosOfBLUHQ select 1)+15];

// BROADCAST, TELL THE HQ POS IS FOUND
HQ_pos_found_generated = true;publicVariable "HQ_pos_found_generated";

// SPAWN THE OPTRE FRIGATE
if ("OPTRE_UNSC" in BLUFOR_FactionFile_X) then {
	_createdVehFnc = [[0,0,500],0,"OPTRE_Frigate_UNSC",WEST] call bis_fnc_spawnvehicle;
	_veh = _createdVehFnc select 0 ;// vehicle object
	_veh setPos [PosOfBLUHQ select 0, PosOfBLUHQ select 1, 400];// set height
};

//if ((random 10) < master_Intel_chance) then {
	//_code = {[{[] spawn fnc_found_intel}] remoteExec ['BIS_fnc_Spawn', [0,-2] select isDedicated,false]};
	//_code = {[] spawn fnc_found_intel};
	//[_hq, "Search for Intel", "search", _code] spawn fnc_actionRotary;
//};


