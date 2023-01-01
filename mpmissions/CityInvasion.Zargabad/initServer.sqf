////////////////////////////////////////// Compile functions
[] call compile preprocessFileLineNumbers "Functions\fnc_init.sqf";
////////////////////////////////////////// Init server - global

//Editor markers visible for player host debug
if (isServer && hasInterface) then
{
	"blu" setMarkerAlpha 1;
	"red" setMarkerAlpha 1;
	"ao" setMarkerAlpha 1;
};

//Editor markers invisible for connected players
if (!isServer && hasInterface) then
{
	"blu" setMarkerAlpha 0;
	"red" setMarkerAlpha 0;
	"ao" setMarkerAlpha 0;
	//Add player loadouts
	//{[west,_x,-1,-1] call BIS_fnc_addRespawnInventory;}
	//forEach ["ARM","MED","GRN","DMK","RAT","FTL","SPT","SPR"];
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

//Start
missionNamespace setVariable ["dmpWaitForGo",false];publicVariable"dmpWaitForGo";
hint "New Game started successfully...";
};

////////////////////////////////////////// Init server - resume saved game

if (isSaved == true) then 
{
//Start
missionNamespace setVariable ["dmpWaitForGo",true];publicVariable"dmpWaitForGo";
redco setPosATL coPos;
[[1,1,1,1,false],"RCOP\RCOPersist\RCOPcrateFiller.sqf"] remoteExec ["execVM",0];
hint "Saved Game loaded!";
};



////////////////////////////////////////// GLOBAL

[redco] call fnc_loseGame;
[redco] call fnc_surrender;

while {true} do
{
{_x allowCrewInImmobile true } foreach vehicles;
sleep 30;
};

