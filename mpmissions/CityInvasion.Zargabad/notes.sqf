////////////////////////////////////////// TRIGGERS

//in all condition boxes
call{this}

//CO captured trigger
//condition
call{redco in thisList;}
//activation
"coCapped" call BIS_fnc_endMissionServer;

//SaveGame trigger
//condition
waitUntil {RCOPsaveComplete == 1};
//activation
[] call fnc_autoSave;

//vehicle despawn trigger area
{{deleteVehicle _x} foreach crew _x} foreach thislist;

//Placed units init box + supports
_veh = vehicle _this;
[_veh] call fnc_vehRefill;
[_veh] call fnc_unitsBlu;
or
_veh = vehicle _this;
[_veh] call fnc_vehRefill;
[_veh] call fnc_unitsRed;

//RCOP vehicles
[_this] call fnc_noTasks;

//On sector expression
[_this select 1, HalObj] call fnc_sectorCapped;

