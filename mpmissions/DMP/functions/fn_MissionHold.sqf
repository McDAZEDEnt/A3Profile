private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 2;
if((count(entities"DMP_LimitStaticMissions"))>0)then{sleep 2};if(isNull _module)exitWith{};
if(_activated)then{
[
getPos _module,
(_module getVariable"dmpHoldSide"),
(_module getVariable"dmpHoldName"),
(_module getVariable"dmpHoldRadius"),
(_module getVariable"dmpHoldTime"),
(_module getVariable"dmpHoldShow"),
(_module getVariable"dmpHoldScript"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut"),
(_module getVariable"dmpOptional")
]execVM"DMP\Scripts\Missions\zzModuleHold.sqf";
};
true