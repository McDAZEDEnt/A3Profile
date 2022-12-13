params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];


[_newUnit,""] call BIS_fnc_setUnitInsignia; // Remove insignia
[_newUnit,"sf"] call BIS_fnc_setUnitInsignia; // Add a new one


// Send a hint to all players to let them know how many Respawn Tickets are left
[format ["%1 respawn tickets left",[side player] call BIS_fnc_respawnTickets]] remoteExec ["hint", side _newUnit, false];
