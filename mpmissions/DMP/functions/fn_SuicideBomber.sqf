private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 1;

if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpSuicideBomberSide"),
(_module getVariable"dmpSuicideBomberCount"),
(_module getVariable"dmpSuicideBomberActivationRange"),
(_module getVariable"dmpSuicideBomberTriggerRange"),
(_module getVariable"dmpSuicideBomberPower"),
(_module getVariable"dmpSuicideBomberYellChance"),
(_module getVariable"dmpSuicideBomberYell")
]
]execVM"DMP\Scripts\SuicideBomber\Start.sqf";
};
TRUE