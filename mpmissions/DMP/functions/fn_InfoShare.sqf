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
(_module getVariable"dmpInfoShareDebug"),
(_module getVariable"dmpInfoShareSide"),
(_module getVariable"dmpInfoShareDistanceLand"),
(_module getVariable"dmpInfoShareDistanceAir"),
(_module getVariable"dmpInfoShareAggressive"),
(_module getVariable"dmpInfoShareCycle")
]execVM"DMP\Scripts\InfoShare\Start.sqf";
};
TRUE