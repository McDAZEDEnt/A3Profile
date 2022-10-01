private["_info","_c","_civs"];
_info=_this;
_c=0;
dmpCivAttitudeWest=_info select _c;_c=_c+1;
dmpCivAttitudeEast=_info select _c;_c=_c+1;
dmpCivAttitudeRes=_info select _c;_c=_c+1;
dmpCivAttitudeOther=_info select _c;_c=_c+1;
dmpCivDetainPenalty=_info select _c;_c=_c+1;
dmpCivDetainPenaltyL=_info select _c;_c=_c+1;
dmpCivKillPenalty=_info select _c;_c=_c+1;
dmpCivKillPenaltyL=_info select _c;_c=_c+1;
dmpCivKnowledgeRadius=_info select _c;_c=_c+1;
dmpCivKnowledgeLeader=_info select _c;_c=_c+1;
dmpCivKnowledgeHVT=_info select _c;_c=_c+1;
dmpCivKnowledgeTroop=_info select _c;_c=_c+1;
dmpCivKnowledgeCaptive=_info select _c;_c=_c+1;
dmpCivKnowledgeCache=_info select _c;_c=_c+1;
dmpCivKnowledgeSpecial=_info select _c;_c=_c+1;
dmpCivKnowledgeRadiusL=_info select _c;_c=_c+1;
dmpCivKnowledgeLeaderL=_info select _c;_c=_c+1;
dmpCivKnowledgeHVTL=_info select _c;_c=_c+1;
dmpCivKnowledgeTroopL=_info select _c;_c=_c+1;
dmpCivKnowledgeCaptiveL=_info select _c;_c=_c+1;
dmpCivKnowledgeCacheL=_info select _c;_c=_c+1;
dmpCivKnowledgeSpecialL=_info select _c;_c=_c+1;

dmpInterrogateRadius=_info select _c;_c=_c+1;
dmpInterrogateChanceWest=_info select _c;_c=_c+1;
dmpInterrogateChanceEast=_info select _c;_c=_c+1;
dmpInterrogateChanceRes=_info select _c;_c=_c+1;

dmpLanguageWest=toUpper(_info select _c);_c=_c+1;
dmpLanguageEast=toUpper(_info select _c);_c=_c+1;
dmpLanguageRes=toUpper(_info select _c);_c=_c+1;
dmpLanguageCivilian=toUpper(_info select _c);_c=_c+1;
dmpCivKnowledgeCooldown=_info select _c;_c=_c+1;
dmpCivCycle=_info select _c;_c=_c+1;

dmpInteractRegistered=[];
if!(isServer)exitWith{};

_civs=[];
while{TRUE}do{
	_civs=allUnits;
	_civs=_civs-dmpInteractRegistered;
	{if(_x isKindOf"Animal")then{_civs=_civs-[_x]}}forEach _civs;
	{
	if(_x isKindOf"Man")then{
		if(_x getVariable"dmpCivilianLeader")then{_x call DMP_fnc_InitCivLeader}else{_x call DMP_fnc_InitCiv};
	};
	}forEach allUnits;
	if(dmpCivCycle<0)exitWith{};
	sleep dmpCivCycle;
};