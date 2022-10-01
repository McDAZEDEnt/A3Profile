private["_in","_typeName","_units"];
_in=_this;
_typeName=typeName _in;
_units=[];
if!(_typeName in["GROUP","OBJECT"])exitWith{};
if(_typeName=="GROUP")then{_units=units _in};
if(_typeName=="OBJECT")then{_units=units(group _in)};
{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
}forEach _units;