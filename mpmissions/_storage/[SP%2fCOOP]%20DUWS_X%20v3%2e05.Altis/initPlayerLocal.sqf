
// initPlayerLocal.sqf
//titleCut ["", "BLACK FADED", 999];
//cutText ["", "BLACK IN", 5];

// Initialize the player/client side Dynamic Groups framework
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; 

player allowDamage false;

/////////////////////////////////////////
///// REVIVE CODE  Make sure this is last
/////////////////////////////////////////

// NO REVIVE vs AIS vs Vanilla vs ACE medical
_revive = ["Revive", 1] call BIS_fnc_getParamValue;

// NO REVIVE or ACE MEDICAL DETECTED
if (_revive == 0 || isClass (configFile >> "CfgPatches" >> "ace_medical") || isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	[player] call bis_fnc_disableRevive;
	player setVariable ["AIS_noReviveInit", true];
	["Revive is disabled"] call BIS_fnc_logFormat;
};
// AIS
if (_revive == 1) then {
	player setVariable ["AIS_noReviveInit", false];
	[player] call AIS_System_fnc_loadAIS;
	[player] call bis_fnc_disableRevive;
};
// VANILLA
if (_revive == 2) then {
	player setVariable ["AIS_noReviveInit", true];
};





