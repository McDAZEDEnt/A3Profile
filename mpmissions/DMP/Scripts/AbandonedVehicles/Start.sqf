private["_units","_info","_vehicles","_helos","_planes","_drones"];
if!(isServer)exitWith{};
//_units=(_this select 0)nearEntities[["Air","Landvehicle"],200];
_units=[(_this select 0),["Air","Landvehicle"],200]call dmp_fnc_GetUnits;
_info=_this select 1;

_vehicles=[];
_helos=[];
_planes=[];
_drones=[];

{
if!(_x isKindOf"Man")then{
	if((getNumber(configFile>>"cfgVehicles">>(typeof _x)>>"isUAV"))==1)exitWith{_drones pushBack(typeOf _x)};
	if(_x isKindOf"Plane")exitWith{_planes pushBack(typeOf _x)};
	if(_x isKindOf"Helicopter")exitWith{_helos pushBack(typeOf _x)};
	if(_x isKindOf"Air")exitWith{_planes pushBack(typeOf _x)};
	if((_x isKindOf"Car")OR(_x isKindOf"Tank"))exitWith{_vehicles pushBack(typeOf _x)};
	if(_x isKindOf"LandVehicle")exitWith{_vehicles pushBack(typeOf _x)};
	sleep .01;
};
}forEach _units;
sleep .3;
//hintc format["_vehicles: %1",_vehicles];

if((count _vehicles)==0)then{_vehicles=["C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Quadbike_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_medevac_F","C_Van_02_vehicle_F","C_Van_02_transport_F","C_Truck_02_fuel_F","C_Offroad_02_unarmed_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_SUV_01_F"]};
if((count _helos)==0)then{_helos=["C_Heli_Light_01_Civil_F"]};
if((count _planes)==0)then{_planes=["C_Plane_Civil_01_F"]};
if((count _drones)==0)then{_drones=["C_UAV_06_F"]};

{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
sleep .1;
}forEach _units;

if!(call dmp_fnc_Proceed)exitWith{};

[_info,
[
_vehicles,
_helos,
_planes,
_drones
]
]execVM"DMP\Scripts\AbandonedVehicles\PopulateMap.sqf";