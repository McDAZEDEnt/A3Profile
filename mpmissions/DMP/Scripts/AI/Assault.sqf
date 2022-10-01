private["_group","_pos","_modules"];
_group=_this select 0;
_pos=_this select 1;

if((count _pos)==0)then{_pos=getPos vehicle leader _group};

_group setBehaviour"AWARE";
_group setCombatMode"RED";
_group setFormation"LINE";
_group setSpeedmode"NORMAL";
sleep 5;
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	_group move _pos;
	if(((leader _group)distance2D _pos)<100)exitWith{[_group,_pos]execVM"DMP\Scripts\AI\Search.sqf"};
	sleep 30;
};