private["_pos","_side","_radius","_units","_v","_enemy"];
_pos=_this select 0;
_side=_this select 1;
_radius=200;
if((count _this)>2)then{_radius=_this select 2};
_units=[];
_v=objNull;
//_units=_pos nearEntities[_types,_radius];
_enemy=[];
while{TRUE}do{
	_units=_pos nearEntities[["Man","Air","Landvehicle"],_radius];
	{if(_x isKindOf"Animal")then{_units=_units-[_x]}}forEach _units;
	{if([_side,(side _x)]call BIS_fnc_SideIsEnemy)then{_enemy pushBackUnique(group _x)}}forEach _units;
	if((count _enemy)>0)exitWith{};
	_radius=_radius*2;
	if(_radius>30000)exitWith{};
};
_enemy