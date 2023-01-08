params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];


[_newUnit,""] call BIS_fnc_setUnitInsignia; // Remove insignia
[_newUnit,"sf"] call BIS_fnc_setUnitInsignia; // Add a new one
