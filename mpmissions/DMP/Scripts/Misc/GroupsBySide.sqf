private["_side","_groups"];
_side=_this;
_groups=[];
{if(((side _x)==_side)AND(_x call dmp_fnc_GroupIsAlive))then{_groups pushBack _x}}forEach allGroups;
_groups