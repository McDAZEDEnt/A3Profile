private["_group","_type"];
_group=_this select 0;
_type=_this select 1;
_group setBehaviour"AWARE";
_group setCombatMode"YELLOW";
{
(vehicle _x)setVehicleReportRemoteTargets TRUE;
(vehicle _x)setVehicleReceiveRemoteTargets TRUE;
}forEach units _group;
