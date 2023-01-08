params ["_newVehicle", "_oldVehicle"];

_newVehicle allowDamage false;
sleep 5;
createVehicleCrew _newVehicle;
_newVehicle allowDamage true;
