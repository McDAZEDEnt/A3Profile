private["_mainMarker","_pos","_marker","_buildings","_building","_close","_locationTypes","_compoundSize","_minimumBuildings","_towns"];
_pos=_this select 0;
_mainMarker=_this select 1;
_buildings=nearestObjects[_pos,["Building"],dmpRemoteDistance];
_building=objNull;
_close=[];
_compoundSize=90;
_minimumBuildings=2;
_towns=[];
// Remove closed buildings
{if(count([_x]call BIS_fnc_buildingPositions)==0)then{_buildings=_buildings-[_x]}}forEach _buildings;
// Check it isn't close to a town
_locationTypes=["NameCity","NameCityCapital","NameLocal","NameVillage"];
{_towns=nearestLocations[getPos _x,_locationTypes,dmpRemoteDistance];if((count _towns)>0)then{_buildings=_buildings-[_x]}}forEach _buildings;
{
if!(_x in dmpCompoundIgnore)then{
	_close=nearestObjects[getPos _x,["Building"],_compoundSize];
	{dmpCompoundIgnore pushBack _x}forEach _close;
	{_buildings=_buildings-[_x]}forEach _close;
	{if(count([_x]call BIS_fnc_buildingPositions)==0)then{_close=_close-[_x]}}forEach _close;
	if((count _close)>_minimumBuildings)then{
		_pos=[dmpCompounds,(getpos _x)]call BIS_fnc_nearestPosition;
		if((_pos distance2D(getpos _x)<200))exitWith{};
		if!((getpos _x)inArea _mainMarker)exitWith{};
		dmpCompounds pushBack(getpos _x);
		if(dmpDebug)then{_marker=format["C%1%2",time,_x];createMarkerLocal[_marker,getPos _x];_marker setMarkerColorLocal"ColorBlue";_marker setMarkerTypeLocal"loc_bunker";dmpDebugMarkers pushBack _marker};
	};
};
}forEach _buildings;
TRUE