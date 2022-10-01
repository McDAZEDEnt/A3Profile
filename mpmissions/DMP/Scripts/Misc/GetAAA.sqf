private["_side","_pos","_radius","_vehicles","_AAA"];
_side=_this select 0;
_pos=[];
_radius=0;
if((count _this)>1)then{
	_pos=_this select 1;
	_radius=_this select 2;
};
_vehicles=[];
_AAA=[];
if((count _pos)==0)then{_vehicles=vehicles}else{
	_vehicles=[_pos,["Landvehicle"],_radius]call dmp_fnc_GetUnits;
};
{
if((side _x)==_side)then{
	if((getDammage _x)>.7)exitWith{};
	if!(isNil{_x getVariable"dmpAItype"})then{
		if((_x getVariable"dmpAItype")in["AAA","Radar","SAM"])then{_AAA pushBack _x};
	};
};
}forEach _vehicles;
_AAA