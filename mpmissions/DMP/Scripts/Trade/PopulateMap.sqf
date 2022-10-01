private["_unitTypes","_info","_c","_side","_a","_count","_garrison","_spawnInTowns","_spawnInCompounds","_spawnInRemote","_allowDamage","_allowMovement","_group","_type","_pos","_marker","_locationChoice","_locationType","_alreadyUsed","_tries"];
_unitTypes=_this select 0;
_info=_this select 1;

_c=1; // Increment for auto-generate
_side=WEST;
if((_info select _c)=="EAST")then{_side=EAST};if((_info select _c)=="RESISTANCE")then{_side=RESISTANCE};if((_info select _c)=="CIVILIAN")then{_side=CIVILIAN};_c=_c+1;
_a=(_info select _c)call dmp_fnc_ParseArray;_count=_a call BIS_fnc_randomInt;_c=_c+1;
dmpTradeItemCount=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_spawnInTowns=TRUE;if((_info select _c)=="FALSE")then{_spawnInTowns=FALSE};_c=_c+1;
_spawnInCompounds=TRUE;if((_info select _c)=="FALSE")then{_spawnInCompounds=FALSE};_c=_c+1;
_spawnInRemote=TRUE;if((_info select _c)=="FALSE")then{_spawnInRemote=FALSE};_c=_c+1;
_allowDamage=TRUE;if((_info select _c)=="FALSE")then{_allowDamage=FALSE};_c=_c+1;
_allowMove=TRUE;if((_info select _c)=="FALSE")then{_allowMove=FALSE};_c=_c+1;
_garrison=TRUE;if((_info select _c)=="FALSE")then{_garrison=FALSE};_c=_c+1;
dmpPlayerCash=_info select _c;publicVariable"dmpPlayerCash";_c=_c+1;

_group=grpNull;
_type="";
_pos=[];
_marker="";
_locationChoice=[];
_locationType="";
_alreadyUsed=[];
_tries=10;
if(_spawnInTowns)then{_locationChoice pushBack"Town"};
if(_spawnInCompounds)then{_locationChoice pushBack"Compound"};
if(_spawnInRemote)then{_locationChoice pushBack"Remote"};
while{_count>0}do{
	_pos=[];
	if((count _locationChoice)<1)exitWith{};
	_locationType=selectRandom _locationChoice;
	_tries=10;
	if(_locationType=="Town")then{
		while{_tries>0}do{
			_pos=selectRandom dmpLocations;
			if!(_pos in _alreadyUsed)exitWith{_alreadyUsed pushBack _pos};
			_tries=_tries-1;
			sleep .2;
		};
	};
	if(_locationType=="Compound")then{
		while{_tries>0}do{
			_pos=selectRandom dmpCompounds;
			if!(_pos in _alreadyUsed)exitWith{_alreadyUsed pushBack _pos};
			_tries=_tries-1;
			sleep .2;
		};
	};
	if(_locationType=="Remote")then{
		while{_tries>0}do{
			_pos=selectRandom dmpRemoteAreas;
			if!(_pos in _alreadyUsed)exitWith{_alreadyUsed pushBack _pos;_pos=[_pos,300]call dmp_fnc_ScatterCircle};
			_tries=_tries-1;
			sleep .2;
		};
	};
	if((count _pos)>0)then{
		_group=createGroup _side;
		_type=selectRandom _unitTypes;
		_type createUnit[_pos,_group,"",1,"COLONEL"];
		sleep .3;
		[(leader _group),_allowDamage,_allowMove,_garrison]execVM"DMP\Scripts\Trade\PrepTrader.sqf";
	};
	_count=_count-1;
	sleep .3;
};