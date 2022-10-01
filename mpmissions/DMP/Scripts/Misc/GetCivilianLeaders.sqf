// Returns an array of civilian leaders, ordered from closest to furthest from the current position
private["_pos","_side","_target","_leaders","_groups"];
_pos=_this;
_side=CIVILIAN;
_target=objNull;
_leaders=[];
_groups=_side call dmp_fnc_GroupsBySide;
//{if(_x in dmpMissionObjectives)then{_groups=_groups-[_x]}}forEach _groups;
{_target=leader _x;if(isNil{_target getVariable"dmpAItype"})then{_groups=_groups-[_x]}}forEach _groups;
{_target=leader _x;if!((_target getVariable"dmpAItype")=="CivilianLeader")then{_groups=_groups-[_x]}}forEach _groups;
if((count _groups)==0)exitWith{_leaders};
{_leaders pushBack(leader _x)}forEach _groups;
_leaders=[_leaders,[],{_pos distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
_leaders