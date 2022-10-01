private["_group","_pos"];
_group=_this select 0;
_pos=_this select 1;
[_group,_pos]execVM"DMP\Scripts\AI\RoadPatrol.sqf";