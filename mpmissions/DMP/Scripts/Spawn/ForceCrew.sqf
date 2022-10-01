private["_vehicle","_group","_c"];
_vehicle=_this select 0;
_group=_this select 1;
_c=5;
while{TRUE}do{
	createVehicleCrew _vehicle;
	sleep 1;
	if((count(crew _vehicle))>0)exitWith{};
	_c=_c-1;
	if(_c<1)exitWith{};
};
if!(alive _vehicle)exitWith{};
(crew _vehicle)joinSilent _group;