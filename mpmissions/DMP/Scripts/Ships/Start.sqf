// Examines a group and stores the units as spawnable
private["_units","_info","_crew","_ships"];
if!(isServer)exitWith{};
_units=[(_this select 0),["Man","Ship"],200]call dmp_fnc_GetUnits;
_info=_this select 1;

_crew=[];
_ships=[];
{
if(_x isKindOf"MAN")then{_crew pushBack(typeOf _x)};
if(_x isKindOf"Ship")then{
	if(isNull attachedTo _x)then{_ships pushBack(typeOf _x)};
};
}forEach _units;

if((count _crew)==0)then{_crew=["B_crew_F"]};
if((count _ships)==0)then{_ships=["B_Boat_Armed_01_minigun_F","B_Boat_Transport_01_F"]};

{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
sleep .1;
}forEach _units;

if!(call dmp_fnc_Proceed)exitWith{};

[_info,[_crew,_ships]]execVM"DMP\Scripts\Ships\PopulateMap.sqf";