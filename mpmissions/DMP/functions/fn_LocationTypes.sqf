private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
if(_activated)then{_module execVM"DMP\Scripts\Map\LocationTypes.sqf"};
true