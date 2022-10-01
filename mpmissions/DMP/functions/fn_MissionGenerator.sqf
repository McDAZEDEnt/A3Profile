private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 2;
if(isNull _module)exitWith{};

if(_activated)then{
[
_units,
[
(_module getVariable"dmpMissionGeneratorEnemySide"),
(_module getVariable"dmpMissionGeneratorWaitForFaction"),
(_module getVariable"dmpMissionGeneratorMissionTypes"),
(_module getVariable"dmpMissionGeneratorMissionCount"),
(_module getVariable"dmpMissionGeneratorEnd"),
(_module getVariable"dmpMissionGeneratorChainMissions"),
(_module getVariable"dmpMissionGeneratorRequireExfil"),
(_module getVariable"dmpMissionGeneratorForceVPtarget"),
(_module getVariable"dmpMissionGeneratorScatter"),
(_module getVariable"dmpMissionGeneratorDelay"),
(_module getVariable"dmpMissionGeneratorText"),
(_module getVariable"dmpMissionGeneratorTaskNotification"),
(_module getVariable"dmpMissionGeneratorHVThunt"),
(_module getVariable"dmpMissionGeneratorUseMarkers"),
(_module getVariable"dmpMissionGeneratorEndAllDown"),
(_module getVariable"dmpMissionGeneratorEndDelay"),
(_module getVariable"dmpMissionGeneratorSoundWin"),
(_module getVariable"dmpMissionGeneratorSoundLose"),
(_module getVariable"dmpMissionGeneratorCampaignMode"),
(_module getVariable"dmpMissionGeneratorCVP"),
(_module getVariable"dmpMissionGeneratorCVPtarget"),
(_module getVariable"dmpMissionGeneratorCVPmission"),
(_module getVariable"dmpMissionGeneratorCVPman"),
(_module getVariable"dmpMissionGeneratorCVPvehicle"),
(_module getVariable"dmpMissionGeneratorCampaignTextWin"),
(_module getVariable"dmpMissionGeneratorCampaignTextLose"),
(_module getVariable"dmpMissionGeneratorCampaignSoundWin"),
(_module getVariable"dmpMissionGeneratorCampaignSoundLose"),
(_module getVariable"dmpMissionGeneratorCampaignDelete")
]
]execVM"DMP\Scripts\Missions\Start.sqf";
};
TRUE