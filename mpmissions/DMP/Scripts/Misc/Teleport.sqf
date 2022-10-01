private["_group","_pos","_vehicles","_men"];
_group=_this select 0;
_pos=_this select 1;
_vehicles=[];
_men=[];
{if((vehicle _x)==_x)then{_men pushBackUnique _x}else{_vehicles pushBackUnique(vehicle _x)}}forEach(units _group);
{_x setPos([_pos,0,200,1,0,1,0]call BIS_fnc_findSafePos)}forEach _vehicles;
{_x setPos _pos}forEach _men;