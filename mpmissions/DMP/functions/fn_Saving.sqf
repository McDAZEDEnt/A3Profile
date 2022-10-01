private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(dmpExit)exitWith{};
sleep .1;

if(_activated)then{
[
(_module getVariable"dmpSaveDebug"),
(_module getVariable"dmpAutoLoad"),
(_module getVariable"dmpDeleteSave")
]execVM"DMP\Scripts\Save\Start.sqf";
};
TRUE