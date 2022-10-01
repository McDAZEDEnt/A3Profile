// Initializes a civ for interaction
private["_man","_willTalk","_leaders","_HVT","_groups","_captives","_caches","_special","_targets","_pos","_sides"];
_man=_this;
if!(_man in dmpInteractRegistered)then{
	dmpInteractRegistered pushBack _man;
	[
	_man,
	"Interrogate",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
	"(((_this distance _target)<3)AND(cursorObject==_target))",
	"alive _target",
	{},
	{},
	{_this execVM"DMP\Scripts\Interaction\InteractSoldier.sqf"},
	{},
	[],
	.1,
	0,
	FALSE,
	FALSE
	]remoteExec["BIS_fnc_holdActionAdd",0,_man];
};
_side=_man call DMP_fnc_GetSide;
_chance=10;
if((rank _man)=="CORPORAL")then{_chance=20};
if((rank _man)=="SERGEANT")then{_chance=30};
if((rank _man)=="LIEUTENANT")then{_chance=40};
if((rank _man)=="CAPTAIN")then{_chance=70};
if((rank _man)=="MAJOR")then{_chance=80};
if((rank _man)=="COLONEL")then{_chance=90};

_interrogateChance=50;
if(_side==WEST)then{_interrogateChance=dmpInterrogateChanceWest};
if(_side==EAST)then{_interrogateChance=dmpInterrogateChanceEast};
if(_side==RESISTANCE)then{_interrogateChance=dmpInterrogateChanceRes};

_willTalk=FALSE;
if((random 100)<_interrogateChance)then{_willTalk=TRUE};

_leaders=[];
_HVT=[];
_groups=[];
_captives=[];
_caches=[];
_special=[];
_targets=[];
_pos=getPos _man;

if((random 100)<75)then{
	_targets=_pos nearEntities["Man",dmpInterrogateRadius];
	{if(_x getVariable"dmpCivilianLeader")then{_leaders pushBack _x}}forEach _targets;
};
if((random 100)<_chance)then{
	_targets=_pos nearEntities["Man",dmpInterrogateRadius];
	{if(_x getVariable"dmpHVT")then{_HVT pushBack _x}}forEach _targets;
	if((count _HVT)==0)exitWith{};
	_HVT=_HVT call BIS_fnc_arrayShuffle;
	_HVT resize 1;
};
if((random 100)<_chance)then{
	_targets=_pos nearEntities["Man",dmpInterrogateRadius];
	_targets=_targets+(_pos nearEntities["LandVehicle",dmpInterrogateRadius]);
	{if((side _x)==_side)then{_groups pushBackUnique(group _x)}}forEach _targets;
	if((count _groups)==0)exitWith{};
	_groups=_groups call BIS_fnc_arrayShuffle;
	_groups resize 1;
};
if((random 100)<_chance)then{
	_targets=_pos nearEntities["Man",dmpInterrogateRadius];
	{if((captive _x)AND(_man getVariable"dmpCaptive"))then{_captives pushBack _x}}forEach _targets;
	if((count _captives)==0)exitWith{};
	_captives=_captives call BIS_fnc_arrayShuffle;
	_captives resize 1;
};
if((random 100)<_chance)then{
	_targets=_pos nearEntities["ReammoBox_F",dmpInterrogateRadius];
	{if(_x isKindOf"GroundWeaponHolder")then{_targets=_targets-[_x]}}forEach _targets;
	if((count _targets)==0)exitWith{};
	_caches=_targets call BIS_fnc_arrayShuffle;
	_caches resize 1;
};
if((random 100)<_chance)then{
	_targets=_pos nearEntities["DMP_KnowledgeSpecial",dmpInterrogateRadius];
	if((count _targets)==0)exitWith{};
	_special=_targets call BIS_fnc_arrayShuffle;
	_special resize 1;
};
_man setVariable["dmpInteractKnowledge",[_willTalk,_leaders,_HVT,_groups,_captives,_caches,_special],TRUE];