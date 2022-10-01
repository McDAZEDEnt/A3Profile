private["_group","_pos"];
_group=_this select 0;
_pos=_this select 1;
_group setBehaviour"SAFE";
_group setCombatMode"YELLOW";
_group setFormation"COLUMN";
_group setSpeedmode"NORMAL";
if((count dmpWaterAreas)==0)exitWith{};
_group move _pos;
while{true}do{
	if!(({alive _x}count units _group)>0)exitWith{};
	if(((vehicle(leader _group))distance2D _pos)<100)then{
		{deleteWaypoint _x}forEach(waypoints _group);
		_pos=selectRandom dmpWaterAreas;
		_group move _pos;
	};
	sleep 120;
};