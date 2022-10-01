// Returns all empty vehicles and their status for saving
private["_type","_pos","_dir","_dam","_fuel","_cargo","_vehicles"];
_type="";
_pos=[];
_dir=0;
_dam=0;
_fuel=0;
_cargo=[];
_vehicles=[];
_vars=[];
{
if((count(crew _x))==0)then{
	_type=typeOf _x;
	_pos=getPosASL _x;
	_dir=getDir _x;
	_dam=getDammage _x;
	_fuel=fuel _x;
	_cargo=[itemCargo _x,weaponCargo _x,magazineCargo _x];
	_vars=_x call dmp_fnc_GetVariables;
	_vehicles pushBack[[_type,_pos,_dir,_dam,_fuel],_cargo,_vars];
	//sleep .1;
};
}forEach vehicles;
_vehicles