params["_vehicle"];

_vehicle addEventHandler ["FiredNear",
{
  params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
  _unit = (_this select 0)
  _firer = (_this select 1)
  if
  (
    _unit == _firer
  )
  then
  {
    sleep 1;
    _unit setVehicleAmmo 1;
    _unit setFuel 1;
  };
}];