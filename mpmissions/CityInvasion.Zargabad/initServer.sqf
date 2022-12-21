////////////////////////////////////////// Compile functions
[] call compile preprocessFileLineNumbers "Functions\fnc_init.sqf";
////////////////////////////////////////// Init server - global

//Respawn loadouts

{[west, _x, 1, -1] call BIS_fnc_addRespawnInventory;} 
forEach ["MED","DMK","FTL","GRN","RAT","ARM","SPR","SPT"];

//[west, ["FTL", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["ARM", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["GRN", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["MED", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["RAT", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["DMK", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["UAV", 1, -1]] call BIS_fnc_addRespawnInventory;
//[west, ["SPR", 1, -1]] call BIS_fnc_addRespawnInventory;

////////////////////////////////////////// Init server - 'isLoaded' assignment

//Convert 'nil' to 'false' for 'isLoaded'
private _var = missionNamespace getVariable "isLoaded";
if (isNil "_var") then {

	missionNamespace setVariable ["isLoaded", false];publicVariable"isLoaded";
	_var = false;
	};




////////////////////////////////////////// Init server - start new game

if (isLoaded == false) then {

//Opfor commander random spawn.
private _randomPos = getPosATL (selectRandom [coPos_1,coPos_2,coPos_3,coPos_4]);
redco setPosATL _randomPos;

// Save CO position variable
missionNamespace setVariable ["coPos", _randompos];publicVariable"coPos";

//Start
sleep 5;
dmpWaitForGo=FALSE;publicVariable"dmpWaitForGo";
hint "New Game started successfully...";

};




////////////////////////////////////////// Init server - resume saved game

if (isLoaded == true) then {

//Start
sleep 5;
dmpWaitForGo=TRUE;publicVariable"dmpWaitForGo";
deleteVehicle bluspawn;
hint "Saved Game loaded successfully!";

};




////////////////////////////////////////// GLOBAL

"respawn_east" setMarkerPos redco;

//Tracking squad respawn marker
while {!isNil "persist1"} do {
	"respawn_west" setMarkerPos persist1;
	sleep 30;
};
