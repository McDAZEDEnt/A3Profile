if(dmpCVPvehicle==0)exitWith{};
if!(isServer)exitWith{};
private["_veh"];
_veh=_this;
if!((side _veh)==dmpEnemySide)exitWith{};
_veh addMPEventHandler["mpKilled",{_this execVM"DMP\Scripts\Spawn\KilledVehicle.sqf"}];