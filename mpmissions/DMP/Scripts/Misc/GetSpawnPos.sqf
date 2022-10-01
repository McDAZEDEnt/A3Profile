private["_pos","_distance","_allowWater","_pos2","_units","_tries"];
_pos=_this select 0;
_distance=_this select 1;
_allowWater=_this select 2;
_pos2=[];
_units=[];
_tries=10;
_canSpawn=FALSE;
while{_tries>0}do{
	_pos2=_pos getPos[_distance,(random 360)];
	_units=_pos2 nearEntities[["Man","Air","Landvehicle"],_distance-50];
	{if(isPlayer _x)exitWith{_canSpawn=FALSE}}forEach _units;
	if((!_allowWater)AND(surfaceIsWater _pos2))then{_canSpawn=FALSE};
	if(_canSpawn)exitWith{};
	_tries=_tries-1;
};
_pos=_pos2;
_pos