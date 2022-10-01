private["_group"];
_group=_this;
{
_x removeAllMPEventHandlers"mpkilled";
(vehicle _x)removeAllMPEventHandlers"mpkilled";
}forEach(units _group);
{deleteVehicle(vehicle _x)}forEach(units _group);
{deleteVehicle _x}forEach(units _group);