private["_vehicleInfo","_status","_cargo","_vars","_vehicles","_vehicle","_pos"];
_vehicleInfo=_this; // all vehicle info
_status=[]; // single vehicle status
_cargo=[];
_vars=[];
_vehicles=[];
_vehicle=objNull;
_pos=[];
{
_cargo=_x select 5;
_vars=_x select 6;
_pos=_x select 1;
_pos=[_pos select 0,_pos select 1,(_pos select 2)+1];
_vehicle=createVehicle[(_x select 0),_pos,[],0,"none"];
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
_vehicle setDir(_x select 2);
_vehicle setDammage(_x select 3);
_vehicle setFuel(_x select 4);
{_vehicle addItemCargoGlobal[_x,1]}forEach(_cargo select 0);
{_vehicle addWeaponCargoGlobal[_x,1]}forEach(_cargo select 1);
{_vehicle addMagazineCargoGlobal[_x,1]}forEach(_cargo select 2);
{_vehicle addBackpackCargoGlobal[_x,1]}forEach(_cargo select 3);
[_vehicle,_vars]call dmp_fnc_SetVariables;
_vehicles pushBack _vehicle;
}forEach _vehicleInfo;
_vehicles