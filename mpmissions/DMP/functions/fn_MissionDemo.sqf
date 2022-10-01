private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 1;
if((count(entities"DMP_LimitStaticMissions"))>0)then{sleep 2};if(isNull _module)exitWith{};
if(_activated)then{
[
getPos _module,
_units,
(_module getVariable"dmpMissionDemoText"),
(_module getVariable"dmpMissionDemoScript"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut"),
(_module getVariable"dmpOptional")
]execVM"DMP\Scripts\Missions\zzModuleDemo.sqf";
};
true