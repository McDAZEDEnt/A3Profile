private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;

if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpVBIEDside"),
(_module getVariable"dmpVBIEDcount"),
(_module getVariable"dmpVBIEDactivationRange"),
(_module getVariable"dmpVBIEDtriggerRange"),
(_module getVariable"dmpVBIEDpower")
]
]execVM"DMP\Scripts\VBIED\Start.sqf";
};
true