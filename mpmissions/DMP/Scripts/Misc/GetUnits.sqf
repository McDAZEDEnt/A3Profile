private["_pos","_types","_radius","_units","_v"];
_pos=_this select 0;
_types=_this select 1;
_radius=100;
if((count _this)>2)then{_radius=_this select 2};
_units=[];
_v=objNull;
_units=_pos nearEntities[_types,_radius];
{if(_x isKindOf"Animal")then{_units=_units-[_x]}}forEach _units;
if((count _units)<1)then{
	{_v=vehicle _x;if!(_v in _units)then{if((_v distance2D _pos)<_radius)then{_units pushBack _v}}}forEach allUnits;
	{_v=_x;if!(_v in _units)then{if((_v distance2D _pos)<_radius)then{_units pushBack _v}}}forEach vehicles;
};
//systemChat format["%1",_units];
_units