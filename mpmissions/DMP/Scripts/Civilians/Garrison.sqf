private["_units","_outside","_group","_radius","_buildings","_building","_allPositions","_positions","_position","_marker"];
_group=_this select 0;
_radius=_this select 1;
_debug=false;
if(dmpDebug)then{_debug=true};
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
	//reverse _positions;
	{_allPositions pushback _x}forEach _positions;
};
}forEach _buildings;
//if((count _allPositions)==0)exitWith{if(_debug)then{systemChat "Drongo's Garrison: No building positions found"}};
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
while{true}do{
	_allPositions=_allPositions-[_position];
	// If empty, proceed
	if((count(_position nearEntities["Man",1]))==0)exitWith{};
	// If not empty, keep searching. Exit if out of positions
	if((count _allPositions)==0)exitWith{};
	_position=_allPositions select 0;
};
//if((count _allPositions)==0)exitWith{if(_debug)then{systemChat "No positions"}};
if((count _allPositions)==0)exitWith{};
_x setPosATL _position;
//_position=[_position select 0,_position select 1,(_position select 2)+1];
//_position=[_position select 0,_position select 1,50];
_x setVehiclePosition[_position,[],0,"NONE"];
_x forceSpeed 0;
_x setDir(random 360);
_x call DMP_fnc_SafeSpawn;
//if((random 1)>.5)then{_x setUnitPos "MIDDLE"};
sleep .1;
}forEach _units;
//{_x setVariable["dmpAItype","CivilianGarrison",TRUE]}forEach units _group;
_marker="";