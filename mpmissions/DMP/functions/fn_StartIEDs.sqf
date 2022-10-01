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
[
(_module getVariable"dmpIEDtargetSide"),
(_module getVariable"dmpIEDcount"),
(_module getVariable"dmpIEDcountFake"),
(_module getVariable"dmpIEDtriggerDistance"),
(_module getVariable"dmpIEDscatterDistance"),
(_module getVariable"dmpIEDtargetMen")
]execVM"DMP\Scripts\IED\Start.sqf";
};
TRUE