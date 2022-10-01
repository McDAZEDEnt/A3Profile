private["_group","_pos","_modules"];
_group=_this select 0;
_pos=_this select 1;

if((count _pos)==0)then{_pos=getPos vehicle leader _group};

_modules=[];
_modules=entities"DMP_Defend";
if((count _modules)>0)then{
	_modules=[_modules,[],{(getPos leader _group)distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
	if((count _modules)>0)then{_pos=getPos(_modules select 0)};
};
if((count(entities"DMP_Defend"))==0)exitWith{_group execVM"DMP\Scripts\AI\EnhancedPatrol.sqf"};

_group setBehaviour"AWARE";
_group setCombatMode"YELLOW";
_group setFormation"LINE";
_group setSpeedmode"NORMAL";
sleep 5;
//_group addWaypoint[_pos,0];_group addWaypoint[_pos,1];
{_x allowFleeing 0}forEach(units _group);
{_x execVM"DMP\Scripts\Defend\PrepMan.sqf"}forEach(units _group);
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	if!(((leader _group)getVariable"dmpAItype")in["Attack","AttackV"])exitWith{_group move(getPos(leader _group))};
	_group move _pos;
	//if(((leader _group)distance2D _pos)<100)exitWith{[_group,_pos]execVM"DMP\Scripts\AI\Search.sqf"};
	if(((leader _group)distance2D _pos)<100)exitWith{[_group,_pos]execVM"DMP\Scripts\AI\Hunt.sqf"};
	sleep 30;
};