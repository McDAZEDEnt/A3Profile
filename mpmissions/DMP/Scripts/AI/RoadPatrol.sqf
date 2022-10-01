private["_group","_pos","_towns"];
_group=_this select 0;
_pos=_this select 1;
_group setBehaviour"SAFE";
_group setCombatMode"YELLOW";
_group setFormation"COLUMN";
_group setSpeedmode"NORMAL";
if((count dmpLocations)==0)exitWith{};
_towns=dmpLocations;

{_x setVariable["dmpAItype",(format["%1","RoadPatrol"]),TRUE]}forEach units _group;sleep 1;

_group addWaypoint[_pos,0];
_group addWaypoint[_pos,1];
while{true}do{
	if!(({alive _x}count units _group)>0)exitWith{};
	if(isNil{(leader _group)getVariable"dmpAItype"})exitWith{};
	if!(((leader _group)getVariable"dmpAItype")=="RoadPatrol")exitWith{};
	if(((vehicle(leader _group))distance2D _pos)<100)then{
		{deleteWaypoint _x}forEach(waypoints _group);
		//_pos=getPos(selectRandom _towns);
		_pos=selectRandom _towns;
		_group addWaypoint[_pos,0];
		_group addWaypoint[_pos,1];
	};
	sleep 60;
};