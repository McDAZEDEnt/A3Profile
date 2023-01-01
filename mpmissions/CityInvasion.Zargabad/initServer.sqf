////////////////////////////////////////// Compile functions
[] call compile preprocessFileLineNumbers "Functions\fnc_init.sqf";
////////////////////////////////////////// Init server - global

//Editor markers invisible for connected players
if (!isServer && hasInterface) then
{
	"blu" setMarkerAlpha 0;
	"red" setMarkerAlpha 0;
	"ao" setMarkerAlpha 0;
	"respawn_west" setMarkerAlpha 0;
	"respawn_east" setMarkerAlpha 0;
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

// Save commander position variable
missionNamespace setVariable ["coPos", _randompos];publicVariable"coPos";

//Start DMP
missionNamespace setVariable ["dmpWaitForGo",false];publicVariable"dmpWaitForGo";

//Start
hint "New Game started successfully...";

};

////////////////////////////////////////// Init server - resume saved game

if (isSaved == true) then 
{

//Opfor commander
redco setPosATL coPos;

//Stop DMP
missionNamespace setVariable ["dmpWaitForGo",true];publicVariable"dmpWaitForGo";

//RCOP
[[],"RCOP\RCOPersist\RCOPcrateFiller.sqf"] remoteExec ["execVM",0];

//Start
hint "Saved Game loaded!";

};

////////////////////////////////////////// GLOBAL

[] call fnc_loseGame;
[] call fnc_surrender;
