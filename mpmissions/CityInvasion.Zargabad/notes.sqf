//Server only
//in all condition boxes
call{this}
//all triggers set to 1 second

//CO captured trigger
//condition
call{redco in thisList;}
//activation
"coCapped" call BIS_fnc_endMissionServer;
//countdown of 5 seconds

//SaveGame trigger
//condition
call{RCOPsaveComplete == 1;}
//activation
[] call fnc_autoSave;
//countdown of 10 seconds

//vehicle despawn trigger area
{{deleteVehicle _x} foreach crew _x} foreach thislist;

//Placed units init box + NR6 respawns
[_this] call fnc_cargoBlu;
or
[_this] call fnc_cargoRed;

//Vehicle supports
[_this] call fnc_vehRefill;

//RCOP vehicles
[_this] call fnc_noTasks;

//in sector expression box
[_this select 1, HalVarName] call fnc_sectorCapped;

//item to limit simplex access
G_Respirator_yellow_F