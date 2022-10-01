// Returns all empty vehicles and their status for saving
private["_type","_pos","_dir","_dam","_fuel","_cargo","_vehicles","_vars"];
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
	if(_x getVariable"dmpDontSave")exitWith{};
	_type=typeOf _x;
	_pos=getPosATL _x;
	_dir=getDir _x;
	_dam=getDammage _x;
	_fuel=fuel _x;
	_cargo=[itemCargo _x,weaponCargo _x,magazineCargo _x,backPackCargo _x];
	_vars=_x call dmp_fnc_GetVariables;
	_vehicles pushBack[[_type,_pos,_dir,_dam,_fuel],_cargo,_vars];
};
}forEach vehicles;
_vehicles