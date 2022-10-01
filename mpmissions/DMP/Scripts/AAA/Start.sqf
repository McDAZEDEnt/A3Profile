private["_pos","_info","_units","_types","_radars","_SAMs","_vehicles","_crew","_leaders","_unitTypes"];
if!(isServer)exitWith{};
_pos=_this select 0;_info=_this select 1;

_units=[_pos,["Man","Air","Landvehicle"],200]call dmp_fnc_GetUnits;
sleep .3;

_types=[];
{_types pushBack(typeOf _x)}forEach _units;

_radars=[];
_SAMs=[];
_vehicles=[];
_crew=[];
_leaders=[];
{
if(_x isKindOf"MAN")then{
	if((rank _x)=="COLONEL")exitWith{_crew pushBack(typeOf _x)};
	//if((rank _x)=="SERGEANT")exitWith{_leaders pushBack(typeOf _x)};
	if((toLower(getText(configfile>>"cfgVehicles">>(typeOf _x)>>"icon")))=="iconmanleader")exitWith{_leaders pushBack(typeOf _x)};
	_crew pushBack(typeOf _x);
}else{
	if(((getNumber(configfile>>"cfgVehicles">>(typeOf _x)>>"Components">>"SensorsManagerComponent">>"Components">>"ActiveRadarSensorComponent">>"AirTarget">>"maxRange"))>0)AND((count(magazines _x))==0))exitWith{_radars pushBack(typeOf _x)};
	if(_x call dmp_fnc_IsAAA)exitWith{_vehicles pushBack(typeOf _x)};
	if(_x call dmp_fnc_IsSAM)exitWith{_SAMs pushBack(typeOf _x)};
	_vehicles pushBack(typeOf _x);
};
}forEach _units;
sleep .5;

{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
sleep .1;
}forEach _units;

if((count _leaders)==0)then{_leaders=_crew};
if((count _radars)==0)then{_radars=["B_Radar_System_01_F"]};
if((count _SAMs)==0)then{_SAMs=["B_SAM_System_03_F"]};
if((count _vehicles)==0)then{_vehicles=["B_APC_Tracked_01_AA_F"]};
if((count _crew)==0)then{_crew=["B_crew_F"]};
if((count _leaders)==0)then{_leaders=["B_crew_F"]};
_unitTypes=[_leaders,_crew,_vehicles,_SAMs,_radars];

if!(call dmp_fnc_Proceed)exitWith{};

[_unitTypes,_info]execVM"DMP\Scripts\AAA\PopulateMap.sqf";