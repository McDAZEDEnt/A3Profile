private["_info","_unitTypes","_script","_c","_sideT","_side","_groupSize","_groups","_scriptMen","_scriptShip","_useAI","_count","_tries"];
_info=_this select 0;
_unitTypes=_this select 1;
_script="DMP\Scripts\Spawn\SpawnShips.sqf";

_c=0;
_sideT=_info select _c;_c=_c+1;
_side=EAST;
if(_sideT=="WEST")then{_side=WEST};
if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
_groupSize=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_groups=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_scriptMen=_info select _c;_c=_c+1;
_scriptShip=_info select _c;_c=_c+1;
_useAI=TRUE;
if((_info select _c)=="FALSE")then{_useAI=FALSE};_c=_c+1;

if((count dmpWaterAreas)==0)exitWith{
	if(dmpDebug)then{systemChat format["Populate Ships %1 exited because no water areas are defined",_side]};
};

if(dmpDebug)then{systemChat format["Populate Ships %1",_side]};

_pos=[];
_count=[(_groups select 0),(_groups select 1)]call BIS_fnc_randomInt;
_tries=10;
while{_count>0}do{
	_pos=selectRandom dmpWaterAreas;
	//_pos pushBack 0;
	_tries=10;
	while{_tries>0}do{
		_pos=[[[_pos,dmpRemoteSize]],["ground"]]call BIS_fnc_randomPos;
		if((getTerrainHeightASL[_pos select 0,_pos select 1])<-1)exitWith{[_unitTypes,_pos,_side,_groupSize,_scriptMen,_scriptShip,_useAI]execVM _script};
		_tries=_tries-1;
		sleep .2;
	};
	_count=_count-1;
	sleep 2;
};

if(dmpDebug)then{systemChat format["Populate Ships %1 DONE",_side]};