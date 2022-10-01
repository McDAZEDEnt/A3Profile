private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
//if(dmpExit)exitWith{};
if(_activated)then{
[
_units,
(_module getVariable"dmpPassword"),
(_module getVariable"dmpActions"),
(_module getVariable"dmpRadius")
]execVM"DMP\Scripts\Terminals\Start.sqf";
};
TRUE