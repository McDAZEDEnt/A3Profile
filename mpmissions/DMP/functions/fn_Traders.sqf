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
_units,
[
(_module getVariable"dmpTraderAutoGenerate"),
(_module getVariable"dmpTraderSide"),
(_module getVariable"dmpTraderCount"),
(_module getVariable"dmpTraderItemCount"),
(_module getVariable"dmpTraderSpawnTowns"),
(_module getVariable"dmpTraderSpawnRemote"),
(_module getVariable"dmpTraderSpawnCompounds"),
(_module getVariable"dmpTraderAllowDamage"),
(_module getVariable"dmpTraderAllowMove"),
(_module getVariable"dmpTraderGarrison"),
(_module getVariable"dmpTraderPlayerCash"),
(_module getVariable"dmpTraderLoadDefaults")
]
]execVM"DMP\Scripts\Trade\Start.sqf";
};
true