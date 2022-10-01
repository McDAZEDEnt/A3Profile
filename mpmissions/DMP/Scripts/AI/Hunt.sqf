// Hunt closest enemy group
private["_group","_pos","_targets","_side"];
_group=_this;
//_group setBehaviour"SAFE";_group setCombatMode"YELLOW";_group setFormation"COLUMN";_group setSpeedmode"NORMAL";
_pos=[];
_targets=[];
_side=side _group;
sleep 5;
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	_targets=[];
	_targets=[(getPos(leader _group)),_side,1000]call dmp_fnc_GetGroupsEnemy;
	if((count _targets)>0)then{
		_targets=[_targets,[],{(leader _group)distance(leader _x)},"ASCEND"]call BIS_fnc_sortBy;
		_group move(getPos(leader(_targets select 0)));
	};
	sleep 120;
};

	/*
	{if([_side,(side _x)]call BIS_fnc_SideIsEnemy)then{_targets pushBack _x}}forEach allGroups;
	if((count _targets)>0)then{
		_targets=[_targets,[],{(leader _group)distance(leader _x)},"ASCEND"]call BIS_fnc_sortBy;
		_group move(getPos(leader(_targets select 0)));
	};
	*/