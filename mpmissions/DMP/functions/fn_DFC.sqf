private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
//if!(isServer)exitWith{};
//waitUntil{!(isNil"dmpReady")};
//waitUntil{dmpReady};
//sleep 2;

if(_activated)then{
[
getPosATL _module,
(_module getVariable"dmpDFCdebug"),
(_module getVariable"dmpDFCfriendlySide"),
(_module getVariable"dmpDFCenemySide"),
(_module getVariable"dmpDFCrandomFaction"),
(_module getVariable"dmpDFCposture"),
(_module getVariable"dmpDFCAOcount"),
(_module getVariable"dmpDFCfirstAOIndex"),
(_module getVariable"dmpDFCAOsize"),
(_module getVariable"dmpDFCAOdistance"),
(_module getVariable"dmpDFCobjectiveCount"),
(_module getVariable"dmpDFCobjectiveRadius"),
(_module getVariable"dmpDFCoccupationChance"),
(_module getVariable"dmpDFCwinLimit"),
(_module getVariable"dmpDFClossLimit"),
(_module getVariable"dmpDFCMissionTypes"),
(_module getVariable"dmpDFCMissionCount"),
(_module getVariable"dmpDFCteleport"),
(_module getVariable"dmpDFCbreakpoint"),
(_module getVariable"dmpDFCdefendTime"),
(_module getVariable"dmpDFCdefendBreakpoint"),
(_module getVariable"dmpDFCdefendDistance"),
(_module getVariable"dmpDFCdefendRadius"),
(_module getVariable"dmpDFCdefendAOsize"),
(_module getVariable"dmpDFCdefendGroupPOP"),
(_module getVariable"dmpDFCEndDelay"),
(_module getVariable"dmpDFCSoundWin"),
(_module getVariable"dmpDFCSoundLose"),
(_module getVariable"dmpDFCCampaignTextWin"),
(_module getVariable"dmpDFCCampaignTextLose"),
(_module getVariable"dmpDFCCampaignSoundWin"),
(_module getVariable"dmpDFCCampaignSoundLose"),
(_module getVariable"dmpDFCCampaignDelete")
]execVM"DMP\Scripts\DFC\Start.sqf";
};
TRUE