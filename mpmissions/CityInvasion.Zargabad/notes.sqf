////////////////////////////////////////// TRIGGERS

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

//NR6 expression for friendly spawns
[_this,false] call fnc_disableTasks; [_this] call fnc_vehRefill;


https://community.bistudio.com/wiki/BIS_fnc_trackMissionTime

https://community.bistudio.com/wiki/Objects.sav

https://community.bistudio.com/wiki/saveMissionProfileNamespace
