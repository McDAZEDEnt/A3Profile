private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 1;
if((count(entities"DMP_LimitStaticMissions"))>0)then{sleep 2};if(isNull _module)exitWith{};
if(_activated)then{
[
getPos _module,
(_module getVariable"dmpMissionText"),
(_module getVariable"dmpMissionDistance"),
(_module getVariable"dmpMissionScript"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut"),
(_module getVariable"dmpOptional")
]execVM"DMP\Scripts\Missions\zzModuleGo.sqf";
};
true