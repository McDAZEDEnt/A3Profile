private["_unit","_safe","_pos"];
_unit=_this;
_pos=getPos _unit;
_safe=TRUE;
if((_pos select 2)<0)then{_safe=FALSE};
if((getPos _unit)call DMP_fnc_IsInGeometry)then{_safe=FALSE};
if(_safe)exitWith{_pos};
//_unit setVehiclePosition[_pos,[],0,"none"]
_pos=_pos findEmptyPosition[0,15,(typeOf _unit)];
_unit setPos _pos;
_pos