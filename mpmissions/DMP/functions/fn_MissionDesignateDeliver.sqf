private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
{dmpDeliverVehicles pushBack _x}forEach _units;
TRUE