//Tracking squad respawn marker
while {true} do {
"respawn_west" setmarkerpos getpos persist1;
sleep 10;
};

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

//co capped trigger
// -- call{redco in thisList;}
// -- ["coCapped", true, 2] call BIS_fnc_endMission;

//co killed led trigger
// -- !alive redco == false
// -- ["coKilled", true, 2] call BIS_fnc_endMission;

//Unlimited vehicle ammo for init box
// -- [_this] execVM "fnc\infiniteVehAmmo.sqf";

//Sector + HAL link (Blufor seizure)
// -- Get sector ownership with trigger somehow
// -- (group leaderHQ) setVariable ["rydhq_taken", []]

//Sector + HAL link (Opfor seizure)
// -- Get sector ownership with trigger somehow
// -- (group leaderHQB) setVariable ["rydhq_taken", []]
