// Maths is hard tbh, so here's this
private["_info","_c","_pos","_pos2","_radius","_increment","_distance","_angle","_pos3","_roads","_marker","_spawnPoints"];
_info=_this;
_c=0;
_pos=_info select _c;_c=_c+1;
_pos2=_info select _c;_c=_c+1;
_radius=_info select _c;_c=_c+1;
_increment=_info select _c;_c=_c+1;
_distance=_pos distance2D _pos2;
if(_radius>_distance)then{_radius=_distance};
_angle=0;
_pos3=[];
_roads=[];
_marker="";
_spawnPoints=[];
while{TRUE}do{
	_pos3=[_pos,_radius,_angle]call BIS_fnc_relPos;
	if!(surfaceIsWater _pos3)then{
		_pos3=[_pos3,0,100,0,0,1,0]call BIS_fnc_findSafePos;
		_roads=_pos3 nearRoads 100;
		if((count _roads)>0)then{_pos3=getPos(_roads select 0)};
		if((_pos3 distance2D _pos2)<_distance)then{
			_spawnPoints pushback _pos3;
		};
	};
	//sleep .01;
	_angle=_angle+_increment;
	if(_angle>359)exitWith{};
};
if((count _spawnPoints)==0)then{_spawnPoints=_pos2};
if(dmpDFCdebug)then{
	{
	_marker=createMarkerLocal[(format["arc_%1%2",TIME,_x]),_x];
	_marker setMarkerTypeLocal"mil_dot";
	_marker setMarkerColorlocal"ColorRED";
	}forEach _spawnPoints;
};
_spawnPoints