
//CO auto surrender - redco init box
_h = this spawn {
waitUntil {fleeing _this};
_this setCaptive true;
_this action ["Eject", vehicle _this];
removeAllWeapons _this;
["ace_captives_setSurrendered",[_this,true]] call CBA_fnc_globalEvent;};



////////////////////////////////////////// TRIGGERS

//CO capped trigger
//condition
call{redco in thisList;}
//activation
["coCapped", true, 2] call BIS_fnc_endMissionServer;

//CO killed trigger
//condition
alive redco == false
//activation
["coKilled", false, 2] call BIS_fnc_endMissionServer;

//SaveGame trigger
//condition - radio message echo
[] call fnc_autoSave;

//Unlimited vehicle ammo for init box
[_this] call fnc_infiniteVehAmmo;

//In sector expression
[_this select 1, halObj] call fnc_sectorCapped;

//NR6 Reinforcements in Spawn mode:
sleep 5;
[west,10,[(getpos bluspawn)],100,nil,custom,1,[LeaderHQ],[blupool],nil,nil,true,15] spawn NR6_fnc_Reinforcements;

//Disable tasking unit init box
[_this] remoteExecCall ['Action2ct',2];

// LeaderHQ spawn forces
//condition
(isLoaded == false)
//activate
[west,10,[(getPos _thisTrigger)],100,nil,custom,1,[LeaderHQ],[blupool],nil,nil,true,15] spawn NR6_fnc_Reinforcements;
