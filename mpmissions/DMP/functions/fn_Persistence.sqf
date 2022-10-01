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
(_module getVariable"dmpDebug"),
(_module getVariable"dmpWest"),
(_module getVariable"dmpEast"),
(_module getVariable"dmpResistance"),
(_module getVariable"dmpCivilian"),
(_module getVariable"dmpRenegade"),
(_module getVariable"dmpObjects"),
(_module getVariable"dmpDate"),
(_module getVariable"dmpAutoLoad"),
(_module getVariable"dmpSaveCycle"),
(_module getVariable"dmpDeleteSave")
]execVM"DMP\Scripts\Persistence\Start.sqf";
};
TRUE