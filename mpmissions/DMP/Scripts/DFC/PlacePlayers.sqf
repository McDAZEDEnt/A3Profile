private["_pos","_newPos","_men","_vehicles","_vehicles2","_man","_groups","_group","_roads","_road","_pos2","_marker","_markers"];
_pos=_this select 0;
_newPos=_this select 1;
_men=[_pos,["Man"],200]call dmp_fnc_GetUnits;
_vehicles=[_pos,["LandVehicle","Air"],200]call dmp_fnc_GetUnits;
_vehicles=_vehicles-_men;
_vehicles2=[];
_vehicles2=_vehicles2+_vehicles;
_man=objNull;
_groups=[];
_group=grpNull;
_roads=[];
_road=objNull;
_pos2=[];
_markers=[];
_roads=_newPos nearRoads 400;
// First, try to place vehicles on roads
_marker="";
while{TRUE}do{
	if((count _vehicles)<1)exitWith{};
	if((count _roads)<1)exitWith{};
	_road=_roads select 0;
	_roads=_roads-[_road];
	_vehicle=_vehicles select 0;
	_vehicles=_vehicles-[_vehicle];
	_pos2=getPos _road;
	_vehicle setDir getDir _road;
	//_vehicle setPosATL[(_pos2 select 0),(_pos2 select 1),0.1];
	_vehicle setVehiclePosition[_pos2,[],0,"none"];
	_marker=createMarkerLocal[(format["%1",_vehicle]),(getPos _vehicle)];
	_marker setMarkerTypeLocal"mil_dot";
	_marker setMarkerColorLocal"ColorGreen";
	_marker setMarkerText(getText(configFile>>"cfgVehicles">>(typeOf _vehicle)>>"displayName"));
	_markers pushBack _marker;
	sleep 0.1;
};
// Next, try to place vehicles in safe positions off roads
while{TRUE}do{
	if((count _vehicles)<1)exitWith{};
	_vehicle=_vehicles select 0;
	_vehicles=_vehicles-[_vehicle];
	//_pos2=[_pos,0,150,20,0,35,0] call BIS_fnc_findSafePos;
	_pos2=[_newPos,0,200,1,0,1,0]call BIS_fnc_findSafePos;
	//_vehicle setPosATL[(_pos2 select 0),(_pos2 select 1),0.1];
	_vehicle setVehiclePosition[_pos2,[],0,"none"];
	_vehicle setDir dmpDFCdirection;
	_marker=createMarkerLocal[(format["%1",_vehicle]),(getPos _vehicle)];
	_marker setMarkerTypeLocal"mil_dot";
	_marker setMarkerColorLocal"ColorGreen";
	_marker setMarkerText(getText(configFile>>"cfgVehicles">>(typeOf _vehicle)>>"displayName"));
	_markers pushBack _marker;
	sleep 0.1;
};

{if!((group _x)in _groups)then{_groups pushBack(group _x)}}forEach _men;
while{TRUE}do{
	if((count _groups)<1)exitWith{};
	_group=_groups select 0;
	_groups=_groups-[_group];
	_pos2=[_newPos,0,200,1,0,1,0]call BIS_fnc_findSafePos;
	//_vehicle setVehiclePosition[_pos2,[],100,"none"];
	//{if((vehicle _x)==_x)then{_x setPos _pos2}}forEach(units _group);
	{if((vehicle _x)==_x)then{_x setVehiclePosition[_pos2,[],0,"none"]}}forEach(units _group);
	sleep 0.1;
};
sleep 1;
{_x setDammage 0}forEach _vehicles2;
sleep 120;
{deleteMarker _x}forEach _markers;