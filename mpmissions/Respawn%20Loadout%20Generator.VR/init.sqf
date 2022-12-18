// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};
// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

//Finish world initialization before mission is launched.
finishMissionInit;

{[west, _x] call BIS_fnc_addRespawnInventory;}
forEach ["FTL","ARM","GRN","RMAT","MED","DMK","RML","MSG","J_PLT","H_PLT","SPL","SPH","SPT","CRW","RMU"];

_str = [] call Steff_fnc_GenerateLoadoutClasses;
