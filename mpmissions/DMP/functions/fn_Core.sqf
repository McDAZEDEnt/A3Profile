private["_module","_units","_activated"];
sleep .3;
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if(_activated)then{
[
//getPos _module,
_module,
(_module getVariable"dmpDebugMode"),
(_module getVariable"dmpRadius"),
(_module getVariable"dmpAOcircle"),
(_module getVariable"dmpRemoteDistance"),
(_module getVariable"dmpRemoteSize"),
(_module getVariable"dmpRemoteIncrement"),
(_module getVariable"dmpAircraftSpawnAssist"),
(_module getVariable"dmpStartupDelay"),
(_module getVariable"dmpWaitForGo"),
(_module getVariable"dmpBlacklistRadius"),
(_module getVariable"dmpUseBISsimManager"),
(_module getVariable"dmpBISsimManagerDistance"),
(_module getVariable"dmpHideUnusedMapObjects"),
(_module getVariable"dmpSoundStart"),
(_module getVariable"dmpLoadMapIndex"),
(_module getVariable"dmpSaveMapIndex"),
(_module getVariable"dmpUseInteractKey"),
(_module getVariable"dmpAdminKey")
]execVM"DMP\Scripts\Start.sqf";
};
TRUE