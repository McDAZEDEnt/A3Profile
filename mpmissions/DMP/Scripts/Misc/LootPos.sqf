private["_posIn","_crateType","_safe","_pos"];
_posIn=_this select 0;
_crateType=_this select 1;
if((count _posIn)==0)exitWith{[]};
_safe=TRUE;
_pos=_posIn;
if(_pos call DMP_fnc_IsInside)then{_safe=FALSE};
if!(_safe)then{if(_pos call DMP_fnc_IsInGeometry)then{_safe=FALSE}};
if!(_safe)then{_pos=_pos findEmptyPosition[0,20,_crateType]};
//if((count _pos)==0)then{_pos=_posIn findEmptyPosition[0,50]};
if((count _pos)==0)then{_pos=[_posIn select 0,_posIn select 1,2]};
_pos