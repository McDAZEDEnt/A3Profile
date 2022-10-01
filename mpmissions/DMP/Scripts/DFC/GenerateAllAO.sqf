// For when no objectives have been placed
private["_size","_N","_E","_S","_W","_marker","_dirs","_objectives","_closest","_radius","_center","_pos","_locationTypes","_locations","_location","_markerName","_count","_posX","_posY"];
_marker="";
_count=0;
_objectives=[];
if((count(entities"DMP_DFCAO"))>0)exitWith{
	if(dmpDFCdebug)then{hintSilent"Manual AO placement"};
	_objectives=entities"DMP_DFCAO";
	_objectives=[_objectives,[],{dmpDFCmodulePos distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
	{
		dmpDFCAOs pushBack(getPos _x);
		if(dmpDFCdebug)then{
			_marker=createMarkerLocal[(format["dmpDFCobj_%1",_count]),getPos _x];
			_marker setMarkerType"mil_objective";
			_marker setMarkerText format["%1",_count];
			_marker setMarkerAlpha 1;
		};
		//deleteVehicle _x;
		_count=_count+1;
	}forEach _objectives;
	sleep .3;
};

if(dmpDFCdebug)then{hintSilent"Automatic AO placement"};

_size=worldSize;
_N=[_size/2,_size];
_E=[_size,_size/2];
_S=[_size/2,0];
_W=[0,_size/2];
_marker=createMarkerLocal["N",_n];
_marker setMarkerAlpha 0;
_marker=createMarkerLocal["E",_e];
_marker setMarkerAlpha 0;
_marker=createMarkerLocal["S",_S];
_marker setMarkerAlpha 0;
_marker=createMarkerLocal["W",_W];
_marker setMarkerAlpha 0;
_dirs=["N","E","S","W"];
_objectives=[_dirs,[],{dmpDFCstartPos distance2D(getMarkerPos _x)},"ASCEND"]call BIS_fnc_sortBy;
_closest=(_objectives select 0);
_radius=_size/2;
_center=[_radius,_radius];
_pos=_center;
//_locationTypes=["NameCityCapital","NameCity","NameVillage","CityCenter","NameLocal","Hill"];
//_locationTypes=["NameCityCapital","NameCity","NameVillage","CityCenter","NameLocal"];
//_locationTypes=["NameCityCapital","NameCity","NameVillage","CityCenter"];
_locationTypes=[];
_locationTypes=_locationTypes+dmpLocationTypes;
_locations=nearestLocations[_pos,_locationTypes,_radius];
_locations=[_locations,[],{dmpDFCstartPos distance2D(getPos _x)},"ASCEND"]call BIS_fnc_sortBy;
{if!((getPos _x)call dmp_fnc_BlackListCheck)then{_locations=_locations-[_x]}}forEach _locations;

_location=_locations select 0;
_locations=_locations-[_location];
_markerName="";
_count=0;
_posX=0;
_posY=0;
_d=0;
_lastLocation=_location;
while{TRUE}do{
	if((count _locations)==0)exitWith{};
	{if(((getPos _location)distance2D(getPos _x))>dmpDFCdistance)exitWith{};_locations=_locations-[_x]}forEach _locations;
	if((count _locations)==0)exitWith{};
	_location=_locations select 0;
	_locations=_locations-[_location];
	_posX=(getPos _location)select 0;
	_posY=(getPos _location)select 1;
	// Delete everything behind the position
	if(_closest=="N")then{{if(((getPos _x)select 1)>_posY)then{_locations=_locations-[_x]}}forEach _locations};
	if(_closest=="S")then{{if(((getPos _x)select 1)<_posY)then{_locations=_locations-[_x]}}forEach _locations};
	if(_closest=="W")then{{if(((getPos _x)select 0)<_posX)then{_locations=_locations-[_x]}}forEach _locations};
	if(_closest=="E")then{{if(((getPos _x)select 0)>_posX)then{_locations=_locations-[_x]}}forEach _locations};
	if((count _locations)==0)exitWith{};
	dmpDFCAOs pushBack(getPos _location);
	if(dmpDFCdebug)then{
		_marker=createMarkerLocal[(format["dmpDFCobj_%1",_count]),getPos _location];
		_marker setMarkerType"mil_objective";
		_marker setMarkerText format["%1",_count];
		_marker setMarkerAlpha 1;
	};
	if(_count>0)then{_d=(getPos _location)distance2D(getPos _lastlocation)};
	if(_d>90000)exitWith{_locations=[]};
	_lastLocation=_location;
	_count=_count+1;
	_locations=[_locations,[],{(getPos _location)distance2D(getPos _x)},"ASCEND"]call BIS_fnc_sortBy;
	sleep .01;
};