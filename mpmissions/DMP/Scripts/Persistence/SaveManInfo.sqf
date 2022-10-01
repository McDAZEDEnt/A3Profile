// Gathers a unit's info for saving
private["_man","_vehicles","_characterInfo","_name","_type","_side","_rank","_face","_speaker","_pitch","_pos","_dir","_uPos","_dam","_loadout","_vars","_index","_vRole"];
_man=_this select 0;
_vehicles=_this select 1;
if!(alive _man)exitWith{[]};
_characterInfo=[];
_name=name _man;
_type=typeOf _man;
_side=side _man;
_rank=rank _man;
_face=face _man;
_speaker=speaker _man;
_pitch=pitch _man;
_pos=getPosATL _man;
_dir=getDir _man;
_uPos=unitPos _man;
_dam=getDammage _man;
_loadout=getUnitLoadout _man;
_vars=_man call dmp_fnc_GetVariables;
_index=0;
_vRole=[];
if!((vehicle _man)==_man)then{
	{
	if(_man in(crew _x))exitWith{_vRole=assignedVehicleRole _man};
	_index=_index+1;
	}forEach _vehicles;
};
_characterInfo=[
[_name,_type,_side,_rank,_face,_speaker,_pitch],
[_pos,_dir,_uPos,_dam],
_loadout,
_vars,
[_index,_vRole]
];
_characterInfo