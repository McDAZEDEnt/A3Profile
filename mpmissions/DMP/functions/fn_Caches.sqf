private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};

if(_activated)then{
[
_units,
(_module getVariable"dmpCount"),
(_module getVariable"dmpTowns"),
(_module getVariable"dmpCompounds"),
(_module getVariable"dmpRemote"),
(_module getVariable"dmpScript")
]execVM"DMP\Scripts\Caches\Start.sqf";
};
TRUE