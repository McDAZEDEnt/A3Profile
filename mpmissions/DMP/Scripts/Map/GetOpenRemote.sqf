private["_pos","_radius","_buildings","_building"];
_pos=selectRandom dmpRemoteAreas;
_radius=750;
_buildings=nearestObjects[_pos,["Building"],_radius];
_building=objNull;
// Remove closed buildings
{if(count([_x]call BIS_fnc_buildingPositions)==0)then{_buildings=_buildings-[_x]}}forEach _buildings;
if((count _buildings)==0)then{hintSilent "GET OPEN REMOTE: no building"};
if((count _buildings)>0)then{_building=(selectRandom _buildings)};
_building