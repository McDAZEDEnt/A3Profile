params ["_unit"];
_unit = (_this select 0);
_veh = vehicle _unit;

{ if ((vehicle _x != _x) && (driver vehicle _x == _x)) exitWith { group _x selectLeader _x; }; } forEach units group _unit;

_veh allowCrewInImmobile true;

cargoOnly synchronizeObjectsAdd [_veh];
