// Initializes a civ for interaction
private["_man","_attitudes","_leaders","_HVT","_groups","_captives","_caches","_special","_targets","_pos","_sides"];
_man=_this;
if!(_man in dmpCivRegistered)then{
	dmpCivRegistered pushBack _man;
	[
	_man,
	"Talk",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
	"_this distance _target < 5",	
	"alive _target",
	{},
	{},
	{_this execVM"DMP\Scripts\Interaction\InteractCiv.sqf"},
	{},
	[],
	.1,
	0,
	FALSE,
	FALSE
	]remoteExec["BIS_fnc_holdActionAdd",0,_man];
};
if(isNil{_man getVariable"dmpNextInteractRefresh"})then{_man setVariable["dmpNextInteractRefresh",0,TRUE]};
if((_man getVariable"dmpNextInteractRefresh")>serverTime)exitWith{};
_attitudes=[];
if((random 100)<dmpCivAttitudeWest)then{_attitudes pushBack TRUE}else{_attitudes pushBack FALSE};
if((random 100)<dmpCivAttitudeEast)then{_attitudes pushBack TRUE}else{_attitudes pushBack FALSE};
if((random 100)<dmpCivAttitudeRes)then{_attitudes pushBack TRUE}else{_attitudes pushBack FALSE};
if((random 100)<dmpCivAttitudeOther)then{_attitudes pushBack TRUE}else{_attitudes pushBack FALSE};
_leaders=[];
_HVT=[];
_groups=[];
_captives=[];
_caches=[];
_special=[];
_targets=[];
_pos=getPos _man;
_sides=[WEST,EAST,RESISTANCE]-[(side player)];
if((random 100)<dmpCivKnowledgeLeaderL)then{
	_targets=_pos nearEntities["Man",dmpCivKnowledgeRadiusL];
	{if(_x getVariable"dmpCivilianLeader")then{_leaders pushBack _x}}forEach _targets;
	//(_pos nearEntities["Man",dmpCivKnowdledgeRadius]);
};
if((random 100)<dmpCivKnowledgeHVTL)then{
	_targets=_pos nearEntities["Man",dmpCivKnowledgeRadiusL];
	{if(_x getVariable"dmpCivilianLeader")then{_HVT pushBack _x}}forEach _targets;
	if((count _HVT)==0)exitWith{};
	_HVT=_HVT call BIS_fnc_arrayShuffle;
	_HVT resize 1;
};
if((random 100)<dmpCivKnowledgeTroopL)then{
	_targets=_pos nearEntities["Man",dmpCivKnowledgeRadiusL];
	{if((side _x)in _sides)then{_groups pushBackUnique(group _x)}}forEach _targets;
	if((count _groups)==0)exitWith{};
	_groups=_groups call BIS_fnc_arrayShuffle;
	_groups resize 1;
};
if((random 100)<dmpCivKnowledgeCaptiveL)then{
	_targets=_pos nearEntities["Man",dmpCivKnowledgeRadiusL];
	{if(captive _x)then{_captives pushBack _x}}forEach _targets;
	if((count _captives)==0)exitWith{};
	_captives=_captives call BIS_fnc_arrayShuffle;
	_captives resize 1;
};
if((random 100)<dmpCivKnowledgeCacheL)then{
	_targets=_pos nearEntities["ReammoBox_F",dmpCivKnowledgeRadiusL];
	{if(_x isKindOf"GroundWeaponHolder")then{_targets=_targets-[_x]}}forEach _targets;
	if((count _targets)==0)exitWith{};
	_caches=_targets call BIS_fnc_arrayShuffle;
	_caches resize 1;
};
if((random 100)<dmpCivKnowledgeSpecialL)then{
	_targets=_pos nearEntities["DMP_KnowledgeSpecial",dmpCivKnowledgeRadiusL];
	if((count _targets)==0)exitWith{};
	_special=_targets call BIS_fnc_arrayShuffle;
	_special resize 1;
};
_man setVariable["dmpInteractKnowledge",[_attitudes,_leaders,_HVT,_groups,_captives,_caches,_special],TRUE];
_man setVariable["dmpNextInteractRefresh",(serverTime+dmpCivKnowledgeCooldown),TRUE];