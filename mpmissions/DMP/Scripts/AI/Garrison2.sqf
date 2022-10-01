private["_man","_group","_buildings","_building","_positions","_pos","_nPos","_o"];
_man=_this;
_group=group _man;
_buildings=nearestObjects[_man,["HOUSE"],100];
if((count _buildings)<1)exitWith{};
_building=_buildings select 0;
_positions=[_building]call BIS_fnc_buildingPositions;
if((count _positions)<2)exitWith{};
_man setBehaviour"SAFE";
_o=objNull;
//{_o="VR_3DSelector_01_default_F"createVehicle _x;_o setPosATL _x}forEach _positions;
//{_o="VR_3DSelector_01_default_F"createVehicle _x}forEach _positions;
_pos=[];
_nPos=[];
while{TRUE}do{
	//systemChat"Loop START";
	if!(alive _man)exitWith{};
	while{TRUE}do{
		if!(alive _man)exitWith{};
		_nPos=selectRandom _positions;
		if!(_nPos isEqualTo _pos)exitWith{_pos=_nPos};
		sleep 1;
	};
	if!(alive _man)exitWith{};
	_man forceSpeed 1;
	_man setUnitPos"UP";
	//_man setUnitPos"AUTO";
	_man doMove _pos;
	//systemChat"Moving 1";
	while{TRUE}do{
		sleep 5;
		if!(alive _man)exitWith{};
		//systemChat format["Moving 2 (%1)",TIME];
		if((_man distance _pos)<1.2)exitWith{
			//systemChat"Stop";
			//_man forceSpeed 0;
			sleep 3;
			sleep(random 10);
		};
	};
	//systemChat"END";
	sleep(random 3);
};
sleep 1;

if((random 10)>8)exitWith{};

if(isNull _group)exitWith{};
if((count(units _group))<1)exitWith{};
if(isNull((units _group)select 0))exitWith{};

_man=(units _group)select 0;
if(alive _man)then{_man execVM"DMP\Scripts\AI\Garrison2.sqf"};