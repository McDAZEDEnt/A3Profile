private["_info","_c","_debug"];
// Save and exit
if!(isServer)exitWith{};
call dmp_fnc_RPGsaveObjectsMain;
sleep 1;
["SAVE","DMP\Scripts\RPG\Player\SaveLoad.sqf"]remoteExec["execVM"];
sleep 1;
"EveryoneWon"call BIS_fnc_endMissionServer;