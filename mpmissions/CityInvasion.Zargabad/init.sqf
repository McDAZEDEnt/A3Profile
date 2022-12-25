////////////////////////////////////////// Compile functions
[] call compile preprocessFileLineNumbers "Functions\fnc_init.sqf";
////////////////////////////////////////// Init server - global
m3mory_skip = true;

if (isServer && hasInterface) then { //Markers enabled for player host
	"respawn_west" setMarkerAlpha 1;
	"respawn_east" setMarkerAlpha 1;
	"blu" setMarkerAlpha 1;
	"red" setMarkerAlpha 1;
	"ao" setMarkerAlpha 1;
};

if (!isServer && hasInterface) then { //Markers disabled for connected players
	"respawn_west" setMarkerAlpha 0;
	"respawn_east" setMarkerAlpha 0;
	"blu" setMarkerAlpha 0;
	"red" setMarkerAlpha 0;
	"ao" setMarkerAlpha 0;
	{[west,_x,-1,-1] call BIS_fnc_addRespawnInventory;}
	forEach ["ARM","MED","GRN","DMK","RAT","FTL","SPT","SPR"];
};




////////////////////////////////////////// Init server - 'isSaved' assignment
//Convert 'nil' to 'false' for 'isSaved'

private _var = missionNamespace getVariable "isSaved";
if (isNil "_var") then 
{
	missionNamespace setVariable ["isSaved", false];publicVariable"isSaved";
	_var = false;
};




////////////////////////////////////////// Init server - start new game

if (isSaved == false) then 
{

//Opfor commander random spawn.
private _randomPos = getPosATL (selectRandom [coPos_1,coPos_2,coPos_3,coPos_4]);
redco setPosATL _randomPos;

// Save CO position variable
missionNamespace setVariable ["coPos", _randompos];publicVariable"coPos";

//Start
missionNamespace setVariable ["dmpWaitForGo",false];publicVariable"dmpWaitForGo";
hint "New Game started successfully...";
};




////////////////////////////////////////// Init server - resume saved game

if (isSaved == true) then 
{
//Start
missionNamespace setVariable ["dmpWaitForGo",true];publicVariable"dmpWaitForGo";
deleteVehicle bluspawn;
redco setPosATL coPos;
sleep 15;
[] call grad_persistence_fnc_loadMission;
hint "Saved Game loaded!";
};




////////////////////////////////////////// GLOBAL

//init functions
[redco] call fnc_loseGame;
[redco] call fnc_surrender;
{[_x,true] call fnc_disableTasks} forEach AllUnits;

//debug marker for redco pos
"respawn_east" setMarkerPos redco;

//Tracking squad respawn marker
while {!isNil "FTL"} do 
{
	{cargoOnly synchronizeObjectsAdd [_x,bluhq]} foreach vehicles;
	{[_x] call fnc_vehRefill} forEach vehicles;
	"respawn_west" setMarkerPos FTL;
	sleep 30;
};
