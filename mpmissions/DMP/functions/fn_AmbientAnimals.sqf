private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep 1;
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(_activated)then{
[
(_module getVariable"dmpTypes"),
(_module getVariable"dmpMaxUnits"),
(_module getVariable"dmpMinimumDistance"),
(_module getVariable"dmpSafeDistance"),
(_module getVariable"dmpDeleteDistance"),
(_module getVariable"dmpCycleLength"),
(_module getVariable"dmpSpawnChance"),
(_module getVariable"dmpClusters"),
(_module getVariable"dmpDogCount"),
(_module getVariable"dmpSheepCount"),
(_module getVariable"dmpGoatCount"),
(_module getVariable"dmpChickenCount")
]execVM"\DMP\Scripts\Misc\AmbientAnimals.sqf";
};
TRUE

