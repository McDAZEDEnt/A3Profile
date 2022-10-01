private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 4;

if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpDefendTaskName"),
(_module getVariable"dmpDefendFactionName"),
(_module getVariable"dmpDefendGenerateSpawns"),
(_module getVariable"dmpDefendRadius"),
(_module getVariable"dmpDefendMaxGroups"),
(_module getVariable"dmpDefendDelayBeforeStart"),
(_module getVariable"dmpDefendVehicleChance"),
(_module getVariable"dmpDefendKillTarget"),
(_module getVariable"dmpDefendTimeTarget"),
(_module getVariable"dmpDefendScript"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut")
]
]execVM"DMP\Scripts\Defend\Start.sqf";
};
TRUE