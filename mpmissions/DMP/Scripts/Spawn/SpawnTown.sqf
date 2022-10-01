// Spawns groups to fill up a town
private["_pos","_patrols","_garrisons","_vehicles","_statics","_HVTchance","_spawnInfo","_scatter","_pos2","_count","_type","_secondsBetweenSpawns"];
_pos=_this select 0;
_patrols=_this select 1;
_garrisons=_this select 2;
_vehicles=_this select 3;
_statics=_this select 4;
_HVTs=_this select 5;
_spawnInfo=_this select 6;
//hint format["THIS: %1",_this];

_secondsBetweenSpawns=_spawnInfo select 12;

_scatter=200;
_pos2=[];
_count=_patrols;
_type="Patrol";
while{(_count>0)}do{
	_pos2=[_pos,_scatter]call dmp_fnc_ScatterCircle;
	[_pos2,_pos2,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
	_count=_count-1;
	sleep 0.3;
	sleep _secondsBetweenSpawns;
};

_count=_garrisons;
_type="Garrison";
while{(_count>0)}do{
	_pos2=[_pos,_scatter]call dmp_fnc_ScatterCircle;
	[_pos2,_pos2,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
	_count=_count-1;
	sleep 0.3;
	sleep _secondsBetweenSpawns;
};

_count=_vehicles;
_type="Vehicle";
while{(_count>0)}do{
	_pos2=[_pos,_scatter]call dmp_fnc_ScatterCircle;
	[_pos2,_pos2,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
	_count=_count-1;
	sleep 0.3;
};

_count=_statics;
_type="StaticRoof";
while{(_count>0)}do{
	_pos2=[_pos,_scatter]call dmp_fnc_ScatterCircle;
	[_pos2,_pos2,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
	_count=_count-1;
	sleep 0.3;
	sleep _secondsBetweenSpawns;
};

_count=_HVTs;
_type="HVT";
while{(_count>0)}do{
	_pos2=[_pos,_scatter]call dmp_fnc_ScatterCircle;
	[_pos2,_pos2,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
	_count=_count-1;
	sleep 0.3;
	sleep _secondsBetweenSpawns;
};