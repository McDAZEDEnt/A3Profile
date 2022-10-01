private["_unit","_radius","_side","_pos","_near"];
_unit=_this select 0;
_radius=_this select 1;
_side=side _unit;
_pos=getPosASL _unit;
_near=FALSE;
{if([_side,side _x]call BIS_fnc_SideIsEnemy)exitWith{_near=TRUE}}forEach(_pos nearEntities _radius);
_near