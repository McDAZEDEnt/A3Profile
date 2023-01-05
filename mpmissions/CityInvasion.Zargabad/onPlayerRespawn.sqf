params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

_loadout = getUnitLoadout _oldUnit;

_newUnit setUnitLoadout _loadout;
