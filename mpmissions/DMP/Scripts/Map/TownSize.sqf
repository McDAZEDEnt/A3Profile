// Gets the size of a town, returns all buildings and buildings with positions
private["_pos","_radius","_debug","_buildings","_openBuildings","_marker"];
_pos=_this select 0;
_radius=_this select 1;
_debug=_this select 2;
_buildings=nearestObjects[_pos,["HOUSE"],_radius];
_openBuildings=[];
_marker="";
{
if((count([_x]call BIS_fnc_buildingPositions))>0)then{_openBuildings pushback _x};
}forEach _buildings;
if(_debug)then{
	_marker=createMarkerLocal[(format["%1%2",_pos,time]),_pos];
	_marker setMarkerAlphaLocal 0;
	_marker setMarkerShapeLocal"ELLIPSE";
	_marker setMarkerBrushLocal"Border";
	_marker setMarkerColorLocal"colorBLUFOR";
	_marker setMarkerSize[_radius,_radius];
	_marker setMarkerAlpha 1;
	systemChat format["%1 %2",count _buildings,count _openBuildings];
};
[count _buildings,count _openBuildings]