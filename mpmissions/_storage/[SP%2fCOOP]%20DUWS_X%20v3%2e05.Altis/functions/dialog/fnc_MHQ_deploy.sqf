
// MHQ must be empty to Deploy
_empty = (count (crew MHQ1)) == 0;
if (!_empty) exitWith {
	["info",[localize "STR_DUWS_X_ywl7naen",localize "STR_DUWS_X_bnw9muay"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
	["deploy"] remoteExec ["fnc_MHQ_addActions", [0,-2] select isDedicated,true];
};

_mhqDir = getDir MHQ1;

// Add Invisible driver so enemy will attack MHQ
_groupMHQ = [[0,0], WEST, ["C_Soldier_VR_F"],[],[],blufor_ai_skill] call BIS_fnc_spawnGroup; 
_groupMHQ deleteGroupWhenEmpty true;
_MHQdriver = units _groupMHQ select 0;
hideObjectGlobal _MHQdriver;
_MHQdriver moveInCargo MHQ1;

// Deploy the ammo box
_ammoPOS = MHQ1 getRelPos [6,120];
MHQ_ammobox = objNull;

switch (VERSION_X) do {
	case "MODERN": {
		MHQ_ammobox = createVehicle ["O_supplyCrate_F", _ammoPOS, [], 0, "CAN_COLLIDE"];
	};
	case "WW2": {
		MHQ_ammobox = createVehicle ["Box_IED_Exp_F", _ammoPOS, [], 0, "CAN_COLLIDE"];
	};
	case "VIETNAM": {
		MHQ_ammobox = createVehicle ["Box_IED_Exp_F", _ammoPOS, [], 0, "CAN_COLLIDE"];
	};
};	

MHQ_ammobox setDir _mhqDir;

// Put some crap in the ammobox
[MHQ_ammobox,"blufor"] spawn fnc_fill_ammobox; 

[[MHQ_ammobox,[localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 8"]],"addAction",true,true] call BIS_fnc_MP;
[[MHQ_ammobox,[localize "STR_DUWS_X_gcidvhn3",fnc_AI_loadout_manager,[], 0, false, false, "", "_this distance _target < 8"]],"addAction",true,true] call BIS_fnc_MP;
[[MHQ_ammobox,[localize "STR_DUWS_X_xfgokhbc",fnc_AI_rearm,[], 0, false, false, "", "_this distance _target < 8"]],"addAction",true,true] call BIS_fnc_MP;

sleep 1;

// Deploy the Tent
MHQ_tent = objNull;
MHQ_tent = createVehicle ["CamoNet_INDP_big_F", getPos MHQ1, [], 0, "CAN_COLLIDE"];
MHQ_tent setDir _mhqDir;

// create marker on MHQ
_markerType = "b_motor_inf";
if (MHQ1 isKindof "tank") then {_markerType = "b_armor"};

// Remove Undeployed Marker and create a Deployed Marker 
[MHQ1] remoteExec ["kndr_removeMarker", [0,-2] select isDedicated,false];
sleep 1;
[MHQ1, _markerType, "ColorYellow", 1, 1, localize "STR_DUWS_X_cmbq8ut7"] remoteExec ["kndr_assignMarker", [0,-2] select isDedicated,false];

// Add to Respawn positions
_respawn_location = MHQ1 getRelPos [4,270];
MHQ_respawn = [west, _respawn_location] call BIS_fnc_addRespawnPosition;

MHQ_deployed = true;
publicVariable "MHQ_deployed";

["undeploy"] remoteExec ["fnc_MHQ_addActions", [0,-2] select isDedicated,true];

// Lock vehicle
MHQ1 setVehicleLock "LOCKED";

