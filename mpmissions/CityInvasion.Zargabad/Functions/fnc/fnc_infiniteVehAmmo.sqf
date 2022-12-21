params["_vehicle"];

sleep 5;

_vehicle addEventHandler ["Fired", {


  params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
  {
    _unit setFuel 0.8;
    _unit setVehicleAmmo 0.8;
  } forEach (units (group _unit));

}];
