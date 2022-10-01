private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 4;

if(_activated)then{
[
getPos _module,
_units,
[
(_module getVariable"dmpSpawnerFaction"),
(_module getVariable"dmpSpawnerTypes"),
(_module getVariable"dmpSpawnerDelayBeforeStart"),
(_module getVariable"dmpSpawnerDelay"),
(_module getVariable"dmpSpawnerWaves"),
(_module getVariable"dmpGoCode")
]
]execVM"DMP\Scripts\Spawn\Spawner.sqf";
};
TRUE