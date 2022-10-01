private["_info","_c","_groups","_registered"];
_info=_this;
_c=0;

/*
_info=[
"TRUE",
"FALSE",
"TRUE",
1,
100,
100,
0,
50,
50,
100,
2,
30
];
*/

dmpMoraleWest=TRUE;if((_info select _c)=="FALSE")then{dmpMoraleWest=FALSE};_c=_c+1;
dmpMoraleEast=TRUE;if((_info select _c)=="FALSE")then{dmpMoraleEast=FALSE};_c=_c+1;
dmpMoraleRes=TRUE;if((_info select _c)=="FALSE")then{dmpMoraleRes=FALSE};_c=_c+1;
dmpMoraleBaseWest=_info select _c;_c=_c+1;
dmpMoraleBaseEast=_info select _c;_c=_c+1;
dmpMoraleBaseRes=_info select _c;_c=_c+1;
dmpMoraleSurrenderWest=_info select _c;_c=_c+1;
dmpMoraleSurrenderEast=_info select _c;_c=_c+1;
dmpMoraleSurrenderRes=_info select _c;_c=_c+1;
dmpMoraleRange=_info select _c;_c=_c+1;
dmpCowerDuration=_info select _c;_c=_c+1;
dmpMoraleCycle=_info select _c;_c=_c+1;
dmpMoraleCycleRegister=_info select _c;_c=_c+1;

DMP_fnc_MoraleNearFriendlies=compile preprocessFile"DMP\Scripts\Morale\NearFriendlies.sqf";
DMP_fnc_MoraleNearEnemies=compile preprocessFile"DMP\Scripts\Morale\NearEnemies.sqf";
DMP_fnc_MoraleLeaderValue=compile preprocessFile"DMP\Scripts\Morale\LeaderValue.sqf";

if!(isServer)exitWith{};
_groups=[];
_registered=[];
while{TRUE}do{
	_groups=[];
	{
	if(((side _x)==WEST)AND(dmpMoraleWest))then{_groups pushBackUnique _x};
	if(((side _x)==EAST)AND(dmpMoraleEast))then{_groups pushBackUnique _x};
	if(((side _x)==RESISTANCE)AND(dmpMoraleRes))then{_groups pushBackUnique _x};
	}forEach allGroups;
	_groups=_groups-_registered;
	{_x execVM"DMP\Scripts\Morale\Morale.sqf";_registered pushBack _x}forEach _groups;
	if(dmpMoraleCycleRegister<1)exitWith{};
	sleep dmpMoraleCycleRegister;
};