private["_info","_c","_units","_count","_towns","_compounds","_remote","_script","_types","_locations","_pos","_buildings","_building","_cache"];
_info=_this;
_c=0;
_units=_info select _c;_c=_c+1;
_count=_info select _c;_c=_c+1;
_towns=TRUE;if((_info select _c)=="FALSE")then{_towns=FALSE};_c=_c+1;
_compounds=TRUE;if((_info select _c)=="FALSE")then{_compounds=FALSE};_c=_c+1;
_remote=TRUE;if((_info select _c)=="FALSE")then{_remote=FALSE};_c=_c+1;
_script=_info select _c;_c=_c+1;
_types=[];
_locations=[];
_pos=[];
_buildings=[];
_building=objNull;
_cache=objNull;
if((count _units)<1)then{_types=["Box_NATO_Equip_F"]}else{
	{_types pushBack(typeOf _x)}forEach _units;
};
if(_towns)then{_locations=_locations+dmpLocations};
if(_compounds)then{_locations=_locations+dmpCompounds};
if(_remote)then{_locations=_locations+dmpRemoteAreas};
while{TRUE}do{
	if(_count<1)exitWith{};
	if((count _locations)<1)exitWith{};
	_pos=selectRandom _locations;
	_locations=_locations-[_pos];
	_buildings=[_pos,100]call DMP_fnc_GetOpenBuildings;
	if((count _buildings)>0)then{
		_building=selectRandom _buildings;
		_pos=selectRandom([_building]call BIS_fnc_buildingPositions);
	};
	_pos=_pos call DMP_fnc_LootPos;
	_cache=createVehicle[(selectRandom _types),_pos,[],0,"none"];
	_cache setDir(random 360);
	if!(_script=="")then{_cache execVM _script};
	_count=_count-1;
};