private["_man","_side","_count","_groups"];
_man=_this;
_side=side _man;
_count=0;
_groups=allGroups-[group _man];
{if!([(side _x),_side]call BIS_fnc_SideIsEnemy)then{_groups=_groups-[_x]}}forEach _groups;
{if(((leader _x)distance _man)>dmpMoraleRange)then{_groups=_groups-[_x]}}forEach _groups;
{_count=_count+(count(units _x))}forEach _groups;
_count