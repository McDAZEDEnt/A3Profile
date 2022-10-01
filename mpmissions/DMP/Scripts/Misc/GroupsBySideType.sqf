private["_side","_groups","_pos","_type","_radius","_leader"];
_side=_this select 0;
_types=_this select 1;
_pos=_this select 2;
_radius=_this select 3;
_groups=[];
_leader=objNull;
_type="";
{if(((side _x)==_side)AND(_x call dmp_fnc_GroupIsAlive))then{_groups pushBack _x}}forEach allGroups;
{
_leader=leader _x;
_type="";
if!(isNil{_leader getVariable"dmpAItype"})then{_type=_leader getVariable"dmpAItype"};
if!(_type in _types)then{_groups=_groups-[_x]};
}forEach allGroups;
{if(((leader _x)distance2D _pos)>_radius)then{_groups=_groups-[_x]}}forEach _groups;
_groups