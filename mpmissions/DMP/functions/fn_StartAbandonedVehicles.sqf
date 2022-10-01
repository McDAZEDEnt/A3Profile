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
[getPos _module,
[
(_module getVariable"dmpAbandonedVehicles"),
(_module getVariable"dmpAbandonedHelos"),
(_module getVariable"dmpAbandonedPlanes"),
(_module getVariable"dmpAbandonedDamage"),
(_module getVariable"dmpAbandonedFuel"),
(_module getVariable"dmpAbandonedClearCargo"),
(_module getVariable"dmpAbandonedAddLoot"),
(_module getVariable"dmpAbandonedScript")
]
]execVM"DMP\Scripts\AbandonedVehicles\Start.sqf";
};
true