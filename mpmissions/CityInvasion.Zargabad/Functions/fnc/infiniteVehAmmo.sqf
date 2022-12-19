params["_vehicle"];

_vehicle addEventHandler ["fired", {
  params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

  {
    _unit setVehicleAmmo 1;
  } forEach (units (group _unit));
}];
