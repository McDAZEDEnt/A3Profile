private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
//if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;

if(_activated)then{
[
_units,
(_module getVariable"dmpParachuteText"),
(_module getVariable"dmpParachuteGroup"),
(_module getVariable"dmpParachuteAlt")
]execVM"DMP\Scripts\Parachute\Start.sqf";
};
true