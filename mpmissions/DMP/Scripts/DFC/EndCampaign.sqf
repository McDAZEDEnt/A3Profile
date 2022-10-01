private["_code","_text","_text2"];
_code=_this;
_text="";
_text2="";

if(_code=="Win")exitWith{
	if(isServer)then{profileNamespace setVariable[dmpSaveNameDFC,[]]};
	if!(dmpCampaignSoundWin=="")then{dmpCampaignSoundWin remoteExec["playSound"]};
	_text="Campaign Complete - Victory!";
	if(dmpCampaignTextWin=="")then{_text2=format["-   Victory in %1   -   Victory in %1   -   Victory in %1   ",call dmp_fnc_IslandName]}
	else{_text2=format["-  %1   -   %1   -   %1   -  %1   -   %1   -   %1   -  %1   -   %1   -   %1   -  %1   -   %1   -   %1   ",dmpCampaignTextWin]};
	[parseText _text,parseText _text2]remoteExec["BIS_fnc_AAN"];
	sleep dmpEndDelay;
	"EveryoneWon"call BIS_fnc_endMissionServer;
};

if(_code=="Lose")exitWith{
	if(isServer)then{profileNamespace setVariable[dmpSaveNameDFC,[]]};
	if!(dmpCampaignSoundLose=="")then{dmpCampaignSoundLose remoteExec["playSound"]};
	_text="Campaign Failed";
	if(dmpCampaignTextLose=="")then{_text2=format["-   Defeat in %1   -   Defeat in %1   -   Defeat in %1   ",call dmp_fnc_IslandName]}
	else{_text2=format["-  %1   -   %1   -   %1   -  %1   -   %1   -   %1   -  %1   -   %1   -   %1   -  %1   -   %1   -   %1   ",dmpCampaignTextLose]};
	[parseText _text,parseText _text2]remoteExec["BIS_fnc_AAN"];
	sleep dmpEndDelay;
	"EveryoneLost"call BIS_fnc_endMissionServer;
};