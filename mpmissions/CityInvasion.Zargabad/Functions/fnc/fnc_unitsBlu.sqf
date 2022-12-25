params ["_unit"];

_unit = (_this select 0);

_unit setVariable ['grad_persistence_isExcluded',false];
cargoOnly synchronizeObjectsAdd [_unit];
