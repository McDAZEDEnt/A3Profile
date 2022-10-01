private["_group","_pos","_radius","_buildings","_building","_allPositions","_wp"];
_group=_this select 0;
_pos=_this select 1;
_radius=_this select 2;
_buildings=nearestObjects[_pos,["HOUSE"],_radius];
_building=objNull;
_allPositions=[];
_wp=[];
{
_building=_x;
{_allPositions pushback _x}forEach([_building]call BIS_fnc_buildingPositions);
}forEach _buildings;
{
_wp=_group addWaypoint[_x,0];
_wp setWaypointCompletionRadius 2;
}forEach _allPositions;
_wp=_group addWaypoint[_pos,0];
_wp setWaypointType"CYCLE";