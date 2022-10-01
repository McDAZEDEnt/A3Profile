private["_vehicles","_status","_cargo","_vars","_vehicle"];
_vehicleInfo=drpgVehicleInfo;
_status=[];
_cargo=[];
_vars=[];
_vehicle=objNull;
if(dmpDebug)then{systemChat "Loading objects"};
// Delete existing vehicles
{deleteVehicle _x}forEach vehicles;

{
_status=_x select 0;
_cargo=_x select 1;
_vars=_x select 2;
_vehicle=createVehicle[_status select 0,_status select 1,[],0,"can_collide"];
// Need a sleep here?
_vehicle setPosASL(_status select 1);
_vehicle setDir(_status select 2);
_vehicle setDammage(_status select 3);
_vehicle setFuel(_status select 4);
{_vehicle addItemCargoGlobal[_x,1]}forEach(_cargo select 0);
{_vehicle addWeaponCargoGlobal[_x,1]}forEach(_cargo select 1);
{_vehicle addMagazineCargoGlobal[_x,1]}forEach(_cargo select 2);
[_vehicle,_vars]call dmp_fnc_SetVariables;
//sleep .1;
}forEach _vehicleInfo;
if(dmpDebug)then{systemChat"Loading objects DONE"};