params ["_unit"];

_unit = (_this select 0);

_unit setVariable ['grad_persistence_isExcluded',true];
_vehicle = vehicle _unit;
[_vehicle] call fnc_vehRefill;