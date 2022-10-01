private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(dmpExit)exitWith{};

if(_activated)then{
[
(_module getVariable"dmpMoraleWest"),
(_module getVariable"dmpMoraleEast"),
(_module getVariable"dmpMoraleRes"),
(_module getVariable"dmpMoraleBaseWest"),
(_module getVariable"dmpMoraleBaseEast"),
(_module getVariable"dmpMoraleBaseRes"),
(_module getVariable"dmpSurrenderChanceWest"),
(_module getVariable"dmpSurrenderChanceEast"),
(_module getVariable"dmpSurrenderChanceRes"),
(_module getVariable"dmpMoraleRange"),
(_module getVariable"dmpCowerDuration"),
(_module getVariable"dmpCycle"),
(_module getVariable"dmpCycleRegister")
]execVM"DMP\Scripts\Morale\Start.sqf";
};
TRUE