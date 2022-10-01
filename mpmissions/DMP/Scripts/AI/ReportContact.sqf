private["_group","_pos","_range","_groups","_leaders","_leader"];
_group=_this;
_pos=getPos(leader _group);
_range=1000;
_groups=allGroups;
_leaders=[];
_leader=objNull;
{
_leader=leader _x;
if((side _leader)==(side leader _group))then{_leaders pushBack(leader _x)};
}forEach _groups;
{_leader=_x;if((_leader distance2D _pos)<_range)then{if((behaviour _leader)=="Safe")then{_leader setBehaviour"Aware"}}}forEach _leaders;