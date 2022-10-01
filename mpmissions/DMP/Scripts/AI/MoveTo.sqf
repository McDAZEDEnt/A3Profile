private["_group","_pos"];
_group=_this select 0;
_pos=_this select 1;

if((count _pos)==0)then{_pos=getPos vehicle(leader _group)};

_group setBehaviour"SAFE";
_group setCombatMode"YELLOW";
_group setFormation"COLUMN";
_group setSpeedmode"NORMAL";

{deleteWaypoint _x}forEach(waypoints _group);
sleep 5;
{deleteWaypoint _x}forEach(waypoints _group);
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	_group move _pos;
	if(((leader _group)distance2D _pos)<20)exitWith{};
	sleep 30;
};