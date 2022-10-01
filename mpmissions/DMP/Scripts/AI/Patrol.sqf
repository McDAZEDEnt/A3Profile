private["_group","_pos"];
_group=_this select 0;
_pos=_this select 1;
if((random 10)>5)exitWith{[_group,_pos,200]call BIS_fnc_taskPatrol};
[_group,_pos,200]execVM"DMP\Scripts\AI\PatrolStructures.sqf";