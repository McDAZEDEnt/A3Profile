// Returns open buildings in the area
private["_pos","_radius","_buildings","_building"];
_pos=_this select 0;
_radius=_this select 1;
_buildings=nearestObjects[_pos,["Building"],_radius];
_building=objNull;
// Remove closed buildings
{if(count([_x]call BIS_fnc_buildingPositions)==0)then{_buildings=_buildings-[_x]}}forEach _buildings;
_buildings