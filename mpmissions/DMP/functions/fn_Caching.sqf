private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(dmpExit)exitWith{};

if(_activated)then{
[
(_module getVariable"dmpDelay"),
(_module getVariable"dmpWaitForFaction"),
(_module getVariable"dmpCacheWest"),
(_module getVariable"dmpCacheEast"),
(_module getVariable"dmpCacheRes"),
(_module getVariable"dmpCacheCiv"),
(_module getVariable"dmpSimulation"),
(_module getVariable"dmpDistance"),
(_module getVariable"dmpDistanceV"),
(_module getVariable"dmpCycle"),
(_module getVariable"dmpRegisterCycle"),
(_module getVariable"dmpDebug")
]execVM"DMP\Scripts\Caching\Start.sqf";
};
TRUE