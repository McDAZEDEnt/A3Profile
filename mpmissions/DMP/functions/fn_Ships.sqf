private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};

if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpShipsSide"),
(_module getVariable"dmpShipsGroupSize"),
(_module getVariable"dmpShipsGroups"),
(_module getVariable"dmpShipsScriptMen"),
(_module getVariable"dmpShipsScriptVehicles"),
(_module getVariable"dmpShipsUseAI")
]
]execVM"DMP\Scripts\Ships\Start.sqf";
};
true