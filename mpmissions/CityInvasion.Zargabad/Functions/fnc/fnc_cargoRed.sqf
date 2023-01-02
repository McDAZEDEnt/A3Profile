params ["_thisMan"];
_thisMan = (_this select 0);
_veh = vehicle _thisMan;

{ if ((vehicle _x != _x) && (driver vehicle _x == _x)) exitWith { group _x selectLeader _x; }; } forEach units group _thisMan;

_veh allowCrewInImmobile true;

cargoOnlyB synchronizeObjectsAdd [_veh];
