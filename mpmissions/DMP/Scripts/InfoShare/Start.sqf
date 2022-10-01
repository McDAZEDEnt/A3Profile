private["_info","_c","_debug","_side","_distanceLand","_distanceAir","_aggressive","_delay","_distance","_allTargets","_targets","_group","_pos"];
_info=_this;
/*
_info=[
"TRUE",
"WEST",
2000,
5000,
"TRUE",
10
];
*/

_c=0;
_debug=TRUE;if((_info select _c)=="FALSE")then{_debug=FALSE};_c=_c+1;
_side=WEST;if((_info select _c)=="EAST")then{_side=EAST};if((_info select _c)=="RESISTANCE")then{_side=RESISTANCE};_c=_c+1;
_distanceLand=_info select _c;_c=_c+1;
_distanceAir=_info select _c;_c=_c+1;
_aggressive=TRUE;if((_info select _c)=="FALSE")then{_aggressive=FALSE};_c=_c+1;
_delay=_info select _c;_c=_c+1;

_distance=0;
_allTargets=[];
_targets=[];
_group=grpNull;
_pos=[];
while{TRUE}do{
	_allTargets=[];
	_groups=_side call dmp_fnc_GroupsBySide;
	{if(_group getVariable"dmpInfoShareExclude")then{_groups=_groups-[_x]}}forEach _groups;
	if(_debug)then{systemChat format["%1 %2 groups checking",count _groups,_side]};
	
	{
	_distance=_distanceLand;
	_group=_x;
	if((vehicle(leader _x))isKindOf"Air")then{_distance=_distanceAir};
	_targets=(leader _group)targets[TRUE,_distance];
	if(_aggressive)then{
		if(isPlayer(leader _group))exitWith{};
		if((count _targets)>0)then{
			_targets=[_targets,[],{(leader _group)distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
			_pos=getPos(_targets select 0);
			while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
			_group addWaypoint[_pos,0];
			_group move _pos;
			sleep .3;
			{_x setWaypointType"GUARD"}forEach(waypoints _group);
			//_group setCombatMode"RED";
			if(_debug)then{systemChat format["%1 in GUARD mode (%2)",_group,count(waypoints _group)]};
		};
	};
	{_allTargets pushBackUnique _x}forEach _targets;
	}forEach _groups;
	if(_debug)then{hint format["_allTargets: %1",_allTargets]};
	
	{
	_group=_x;
	{_group reveal[_x,4]}forEach _allTargets;
	}forEach _groups;
	
	sleep _delay;
};