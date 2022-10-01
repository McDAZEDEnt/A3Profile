private["_inside","_tent","_bed","_inside","_objects","_stored"];
_inside=FALSE;
_tent=FALSE;
_bed=FALSE;
_inside=player call dmp_fnc_Inside;
_objects=(getPos player)nearObjects 10;
_stored=[];
//{if(((toLower(typeOf _x))find"tent")>-1)then{_tent=TRUE}}forEach _objects;
{if(((toLower(str _x))find"tent")>-1)then{_tent=TRUE}}forEach _objects;
if("deiSleepingBag"call dmp_fnc_HasItem)then{_bed=TRUE};
if!(_bed)then{
	//{if(((toLower(typeOf _x))find"bed")>-1)exitWith{_bed=TRUE}}forEach _objects;
	//{if(((toLower(typeOf _x))find"sleepingbag")>-1)exitWith{_bed=TRUE}}forEach _objects;
	{if(((toLower(str _x))find"bed")>-1)exitWith{_bed=TRUE}}forEach _objects;
	{if(((toLower(str _x))find"sleepingbag")>-1)exitWith{_bed=TRUE}}forEach _objects;
	{
	_stored=itemCargo _x;
	//{if(((toLower(typeOf _x))find"sleepingbag")>-1)exitWith{_bed=TRUE;_stored=[];_objects=[]}}forEach _stored;
	{if(((toLower _x)find"sleepingbag")>-1)exitWith{_bed=TRUE;_stored=[];_objects=[]}}forEach _stored;
	}forEach _objects;
};
[_inside,_tent,_bed]