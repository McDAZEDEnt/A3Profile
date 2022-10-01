private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 3;

if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpAmbientFactionName"),
(_module getVariable"dmpAmbientFactionSide"),
(_module getVariable"dmpAmbientFactionChance"), // per building
(_module getVariable"dmpAmbientFactionDistance"),
(_module getVariable"dmpAmbientFactionGroupSize"),
(_module getVariable"dmpAmbientFactionGarrisonChance"),
(_module getVariable"dmpAmbientFactionAllowAir"),
(_module getVariable"dmpAmbientFactionStayCleared"),
(_module getVariable"dmpAmbientFactionScript")
]
]execVM"DMP\Scripts\AmbientFaction\Start.sqf";
};
true