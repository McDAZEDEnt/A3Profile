//Hide 3den markers
{_x setMarkerAlpha 0.0;} forEach allMapMarkers;

//Compile functions
[] call compile preprocessFileLineNumbers "Functions\fnc_init.sqf";

//Respawn loadouts
[west, ["FTL", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["ARM", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["GRN", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["MED", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["RMAT", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["DMK", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["UAV", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["SPL", 1, -1]] call BIS_fnc_addRespawnInventory;

//Opfor commander random spawn.
private _randomPos = getPosATL (selectRandom [coPos_1,coPos_2,coPos_3,coPos_4]);
redco setPosATL _randomPos;

//CO surrender trigger
dontShoot setPosATL _randomPos;
_randomPos = nil;
// -- game logic
// -- player is present
// -- ["ace_captives_setSurrendered",[redco,true]] call CBA_fnc_globalEvent;

//CO capped trigger
// -- call{redco in thisList;}
// -- ["coCapped", true, 2] call BIS_fnc_endMissionServer;

//CO killed trigger
// -- alive redco == false
// -- ["coKilled", true, 2] call BIS_fnc_endMissionServer;

//Unlimited vehicle ammo for init box
// -- [_this] execVM "Functions\fnc\infiniteVehAmmo.sqf";

//In sector expression
// -- [_this select 1, halObj] call fnc_sectorCapped;

//NR6 Reinforcements in Spawn mode:
// -- sleep 5;
// -- [west,10,[(getpos bluspawn)],100,nil,custom,1,[LeaderHQ],[blupool],nil,nil,true,15] spawn NR6_fnc_Reinforcements;

//Disable tasking unit init box
// -- [_this] remoteExecCall ['Action2ct',2]

//Tracking squad respawn marker
private _players = (group persist1)
while {true} do {
"respawn_west" setMarkerPos _players;
sleep 30;
};
