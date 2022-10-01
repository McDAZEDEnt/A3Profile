private["_pos","_radius","_building","_buildings","_types","_found"];
_pos=_this select 0;
_radius=_this select 1;
_building=objNull;
_buildings=nearestObjects[_pos,["Building"],_radius];
if((count _buildings)==0)exitWith{objNull};
_buildings=_buildings call BIS_fnc_ArrayShuffle;
_types=[];
_types=_types+dmpTargetStructures;
_types=_types call BIS_fnc_ArrayShuffle;
_found=FALSE;
while{TRUE}do{
	if((count _buildings)==0)exitWith{};
	_building=_buildings select 0;
	_buildings=_buildings-[_building];
	{if(((typeOf _building)find _x)>-1)exitWith{_found=TRUE;_buildings=[]}}forEach _types;
};
if!(_found)then{_building=selectRandom _buildings};
_building