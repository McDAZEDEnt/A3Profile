private["_mainMarker","_newWorld","_pos","_size","_locationTypes","_town","_towns","_marker"];
_mainMarker=_this select 0;
dmpWorldname=worldName;
//if((count dmpLocations)>0)exitWith{};
_pos=[];
// Get all towns on the map
_locationTypes=[];
_locationTypes=dmpLocationTypes;
//_pos=dmpCenter;
_size=dmpRadius;
_pos=getMarkerPos _mainMarker;
if((count _this)>1)then{_size=_this select 1};

_towns=[];
if(dmpAOcircle)then{_towns=nearestLocations[_pos,_locationTypes,_size]}else{
	// Brute force location check
	_towns=nearestLocations[_pos,_locationTypes,(_size*3)];
	{if!((getPos _x)inArea _mainMarker)then{_towns=_towns-[_x]}}forEach _towns;
};
sleep 1;
dmpLocations=[];
if((count _towns)==0)then{
	if(dmpDebug)then{hint"Warning: No towns in AO"};
};
_towns=_towns call BIS_fnc_ArrayShuffle;
_town=_towns select 0;
// Town processing START
_marker="";
{
_pos=getPos _x;
_pos=[_pos select 0,_pos select 1,(getTerrainHeightASL _pos)];
if(_pos call dmp_fnc_BlacklistCheck)then{
	if((count _pos)==2)then{_pos pushBack 0};
	// Prevent getting a town position in water
	if(surfaceIsWater _pos)then{
		_pos=_pos call dmp_fnc_GetShore;
		if(((_pos select 0)+(_pos select 1))==0)then{hint format["%1 bad pos",_x]};
	};
	if(dmpDebug)then{
		_marker=createMarkerLocal[format["dmp_TOWN_%1",_x],_pos];	
		_marker setMarkerTypeLocal"loc_tourism";
		_marker setMarkerColorLocal"ColorYELLOW";
		dmpDebugMarkers pushBack _marker;
	};
	dmpLocations pushBack _pos;
};
}forEach _towns;
if((count dmpLocations)==0)then{
	dmpLocations=[_pos];
	if(dmpDebug)then{
		_marker=createMarkerLocal[format["dmp_TOWN_%1",_pos],_pos];	
		_marker setMarkerTypeLocal"loc_tourism";
		_marker setMarkerColorLocal"ColorYELLOW";
		dmpDebugMarkers pushBack _marker;
	};
};