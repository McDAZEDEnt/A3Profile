private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
if(isNull _module)exitWith{};

if(_activated)then{
[
_module,
[
(_module getVariable"dmpFactionName"), // 0
(_module getVariable"dmpFactionSide"),
(_module getVariable"dmpFactionUseAI"),
(_module getVariable"dmpFactionChancePresent"),
(_module getVariable"dmpFactionChanceDead"),
(_module getVariable"dmpFactionChanceDeadGroup"),
(_module getVariable"dmpFactionScriptMen"),
(_module getVariable"dmpFactionScriptVehicles"),
(_module getVariable"dmpFactionSquadSize"),
(_module getVariable"dmpFactionVehicleSize"),
(_module getVariable"dmpFactionPatrols"), // 10
(_module getVariable"dmpFactionPatrolsDeep"),
(_module getVariable"dmpFactionVehiclePatrols"),
(_module getVariable"dmpFactionRoadblocks"),
(_module getVariable"dmpFactionGarrisons"),
(_module getVariable"dmpFactionStatics"),
(_module getVariable"dmpFactionCamps"),
(_module getVariable"dmpFactionHelos"),
(_module getVariable"dmpFactionPlanes"),
(_module getVariable"dmpFactionDrones"),
(_module getVariable"dmpFactionCompounds"), // 20
(_module getVariable"dmpFactionHunters"),
(_module getVariable"dmpFactionHuntersVehicle"),
(_module getVariable"dmpFactionOccupiedTowns"),
(_module getVariable"dmpFactionOccupiedTownPatrols"),
(_module getVariable"dmpFactionOccupiedTownGarrisons"),
(_module getVariable"dmpFactionOccupiedTownVehicles"),
(_module getVariable"dmpFactionOccupiedTownStatics"),
(_module getVariable"dmpFactionOccupiedTownHVTchance"),
(_module getVariable"dmpFactionPassengerChance"),
(_module getVariable"dmpFactionPassengerCount"), // 30
(_module getVariable"dmpFactionPassengerJoin"),
(_module getVariable"dmpFactionSpawnDelay"),
(_module getVariable"dmpFactionSecondsBetweenSpawns"),
(_module getVariable"dmpFactionDebugFaction"),
(_module getVariable"dmpFactionGoCode")
]
]execVM"DMP\Scripts\Faction\Start.sqf";
};
TRUE