private["_units","_outside","_group","_radius","_buildings","_building","_allPositions","_positions","_position","_marker","_roof","_man"];
_group=_this select 0;
_radius=_this select 1;
_roof=TRUE;
if((count _this)>2)then{
	if((_this select 2)=="FALSE")then{_roof=FALSE};
};
_buildings=nearestObjects[(vehicle(leader _group)),["HOUSE"],_radius];
_building=objNull;
_allPositions=[];
_positions=[];
_position=[];
{
_building=_x;
_positions=[_building]call BIS_fnc_buildingPositions;
if((count _positions)>0)then{
	_positions=[_building]call BIS_fnc_buildingPositions;
	if(_roof)then{reverse _positions};
	{_allPositions pushback _x}forEach _positions;
};
}forEach _buildings;
//if((count _allPositions)==0)exitWith{if(dmpDebug)then{systemChat "Drongo's Garrison: No building positions found"}};
if((count _allPositions)==0)exitWith{};
_units=[];
_outside=true;
_empty=false;
{
_outside=true;
_out=lineIntersectsWith[(getPosASL _x),[getPosASL _x select 0,getPosASL _x select 1,(getPosASL _x select 2)+5]];
if((_out select 0)isKindOf"House")then{_outside=false};
if(_x!=(vehicle _x))then{_outside=false};
if(_outside)then{_units pushback _x};
}forEach(units _group);
{
if((count _allPositions)==0)exitWith{};
_position=_allPositions select 0;
// Check the position is empty
while{TRUE}do{
	_allPositions=_allPositions-[_position];
	// If empty, proceed
	if((count(_position nearEntities["Man",.3]))==0)exitWith{};
	// If not empty, keep searching. Exit if out of positions
	if((count _allPositions)==0)exitWith{};
	_position=_allPositions select 0;
};
if((count _allPositions)==0)exitWith{};
_x setPosATL _position;
//_position=[_position select 0,_position select 1,20];
_x setVehiclePosition[_position,[],0,"NONE"];
sleep 1;
_x forceSpeed 0;
_x disableAI"COVER";
_x disableAI"RADIOPROTOCOL";
_x setDir(random 360);
if((random 1)>.5)then{_x setUnitPos"MIDDLE"};
_x call DMP_fnc_SafeSpawn;
sleep .1;
}forEach _units;

if(isNull _group)exitWith{};
if((count(units _group))<1)exitWith{};
if(isNull(leader _group))exitWith{};

_man=leader _group;
if((_man getVariable"dmpAItype")=="Trader")exitWith{};
if((random 10)>8)exitWith{};
// Patrol the building
_man execVM"DMP\Scripts\AI\Garrison2.sqf";