private["_pos","_vehicles"];
hintSilent"";
_pos=_this select 0;
_vehicles=[];
{_vehicles pushBackUnique(vehicle _x)}forEach(units dmpAdminGroup);
{_x setVehiclePosition[_pos,[],0,"NONE"];sleep .2}forEach _vehicles;