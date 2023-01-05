params["_thisVeh"];
_thisVeh = (this select 0);

_thisVeh addEventHandler ["Engine", 
{
  params ["_vehicle", "_engineState"];
  _thisVeh setVehicleAmmo 1;
  _thisVeh setFuel 1;
}];
