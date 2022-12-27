////////////////////////////////////////// TRIGGERS

//in all condition boxes
call{this}

//CO captured trigger
//condition
call{redco in thisList;}
//activation
"coCapped" call BIS_fnc_endMissionServer;

//SaveGame trigger
//condition - radio message alpha
[] call fnc_autoSave;

//vehicle despawn trigger area
{{deleteVehicle _x} foreach crew _x} foreach thislist;

//Placed units init box + spawns
_veh = vehicle _this;
[_veh] call fnc_vehRefill; [_veh] call fnc_unitsBlu;
or
_veh = vehicle _this;
[_veh] call fnc_vehRefill; [_veh] call fnc_unitsRed;

//On sector expression
[_this select 1, HalObj] call fnc_sectorCapped;
