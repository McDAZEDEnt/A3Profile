private["_group","_vehicles","_type","_pos","_dir","_dam","_fuel","_cargo","_var","_vehicleInfo"];
_group=_this;
_vehicles=[];
_type="";
_pos=[];
_dir=0;
_dam=0;
_fuel=0;
_cargo=[];
_vars=[];
_vehicleInfo=[];
{
if!((vehicle _x)==_x)then{
	_vehicles pushBackUnique(vehicle _x);
};
}forEach(units _group);
{
if((count(crew _x))>0)then{
	_type=typeOf _x;
	_pos=getPosATL _x;
	_dir=getDir _x;
	_dam=getDammage _x;
	_fuel=fuel _x;
	_cargo=[itemCargo _x,weaponCargo _x,magazineCargo _x,backpackCargo _x];
	_vars=_x call dmp_fnc_GetVariables;
	_vehicleInfo pushBack[_type,_pos,_dir,_dam,_fuel,_cargo,_vars];
};
}forEach _vehicles;
_vehicleInfo