private["_units"];
if!(isServer)exitWith{};
_units=_this;

{
if!(_x isKindOf"Man")then{
	dmpTypesDemo pushBack(typeOf _x);
	sleep .01;
};
}forEach _units;
sleep .3;

{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
sleep .1;
}forEach _units;