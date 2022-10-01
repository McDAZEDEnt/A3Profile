private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 5;

if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpCivilianChance"),
(_module getVariable"dmpCivilianGarrisonChance"),
(_module getVariable"dmpCivilianDistance"),
(_module getVariable"dmpCivilianGroupSize"),
(_module getVariable"dmpCivilianCars"),
(_module getVariable"dmpCivilianHelos"),
(_module getVariable"dmpCivilianPlanes"),
(_module getVariable"dmpCivilianScript"),
(_module getVariable"dmpCivilianCompounds"),
(_module getVariable"dmpCivilianLeaderChance"),
//(_module getVariable"dmpCivilianApproval"),
(_module getVariable"dmpCivilianDeathCost"),
(_module getVariable"dmpCivilianReportDeaths")
]
]execVM"DMP\Scripts\Civilians\Start.sqf";
};
true