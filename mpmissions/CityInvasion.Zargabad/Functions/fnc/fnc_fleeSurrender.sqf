params["_unit"];

_unit addEventHandler ["Fleeing",{

_unit setCaptive true;
_unit action ["Eject", vehicle _unit];
removeAllWeapons _unit;
["ace_captives_setSurrendered",[_unit,true]] call CBA_fnc_globalEvent;

}];