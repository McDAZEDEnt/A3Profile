private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 2;

if(_activated)then{
[
getPos _module,
(_module getVariable"dmpObjectiveSide"),
(_module getVariable"dmpObjectiveName"),
(_module getVariable"dmpObjectiveRadius"),
(_module getVariable"dmpObjectiveShow"),
(_module getVariable"dmpObjectiveScript"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut")
]execVM"DMP\Scripts\Missions\Objective.sqf";
};
true