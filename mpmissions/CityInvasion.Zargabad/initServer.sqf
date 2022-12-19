//Respawn loadouts
[west, ["FTL", -1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["ARM", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["GRN", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["MED", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["RMAT", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["DMK", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["UAV", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["SPL", 1, -1]] call BIS_fnc_addRespawnInventory;

//Opfor commander random spawn.
private _randomPos = getPos (selectRandom [coPos_1,coPos_2,coPos_3,coPos_4]);
redco setPos _randomPos;

//CO surrender trigger
dontShoot setPos _randomPos;
_randomPos = nil;
// -- call{(group persist1) in thisList;}
// -- ["ace_captives_setSurrendered",[redco,true]] call CBA_fnc_globalEvent;

//redco init box
// -- this action ["SwitchWeapon", this, this, -1];doStop this;

//CO capped trigger
// -- call{redco in thisList;}
// -- ["coCapped", true, 2] call BIS_fnc_endMission;

//CO killed led trigger
// -- alive redco == false
// -- ["coKilled", true, 2] call BIS_fnc_endMission;

//Unlimited vehicle ammo for init box
// -- [_this] execVM "fnc\infiniteVehAmmo.sqf";

//In sector expression
// -- [_this select 1, halObj] call CI_fnc_sectorCapped;

//Tracking squad respawn marker
private _players = (group persist1);
while {true} do {
sleep 40;
"respawn_west" setMarkerPos getWPPos [_players, 1];
};