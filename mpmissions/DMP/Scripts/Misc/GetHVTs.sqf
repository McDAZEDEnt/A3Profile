// Returns an array of living HVTs by side, ordered from closest to furthest from the current position
private["_pos","_side","_target","_HVTs","_groups"];
_pos=_this select 0;
_side=_this select 1;
_target=objNull;
_HVTs=[];
_groups=_side call dmp_fnc_GroupsBySide;
{_target=leader _x;if(isNil{_target getVariable"dmpIsHVT"})then{_groups=_groups-[_x]}}forEach _groups;
{_target=leader _x;if!(_target getVariable"dmpIsHVT")then{_groups=_groups-[_x]}}forEach _groups;
if((count _groups)==0)exitWith{_HVTs};
{if(alive(leader _x))then{_HVTs pushBack(leader _x)}}forEach _groups;
_HVTs=[_HVTs,[],{_pos distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
_HVTs