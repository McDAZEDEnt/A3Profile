private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
//if!(isServer)exitWith{};
//waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
//sleep 1;
if(_activated)then{
[
_units,
(_module getVariable"dmpApplyToGroup"),
(_module getVariable"dmpNoise"),
(_module getVariable"dmpVisibility"),
(_module getVariable"dmpLoad"),
(_module getVariable"dmpWeaponSway"),
(_module getVariable"dmpAnimSpeed"),
(_module getVariable"dmpMedic"),
(_module getVariable"dmpEngineer"),
(_module getVariable"dmpExplosives"),
(_module getVariable"dmpUAVhacker"),
(_module getVariable"dmpInterpreter"),
(_module getVariable"dmpScript")
]execVM"DMP\Scripts\Attributes\Start.sqf";
};
TRUE