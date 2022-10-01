// Saves all objects and empty vehicles near players and dmpTents
private["_type","_pos","_dir","_dam","_fuel","_cargo","_vehicles","_radius","_objects","_remove","_text"];
_pos=_this select 0;_radius=_this select 1;
_type="";
//_pos=[];
_dir=0;
_dam=0;
_fuel=0;
_cargo=[];
_vehicles=[];
_vars=[];
_vehicles=_pos nearEntities[["Reammobox_F","Reammobox","WeaponHolder","AllVehicles"],_radius];
_vehicles=_vehicles+(_pos nearObjects["WeaponHolder",_radius]);
_vehicles=_vehicles+(_pos nearObjects["ReammoBox",_radius]);
_vehicles=_vehicles+(allMissionObjects"dmpTent_v");
_objects=[];
_crew=[];
{if(_x in dmpRPGsavedObjects)then{_vehicles=_vehicles-[_x]}}forEach _vehicles;
{
if!(isNil{(_x getVariable"dmpPreventSave")})then{
	if(_x getVariable"dmpPreventSave")then{_vehicles=_vehicles-[_x]};
};
}forEach _vehicles;

_remove=FALSE;
{
_remove=FALSE;
if(_x isKindOf"Man")then{_remove=TRUE};
if(_x isKindOf"Animal")then{_remove=TRUE};
_crew=crew _x;
if(_remove)then{_crew=[]};
if((count _crew)>0)then{
	{if(isPlayer _x)exitWith{_crew=[]}}forEach _crew;
	if((count _crew)>0)exitWith{_remove=TRUE};
};
if(_remove)then{_vehicles=_vehicles-[_x]};
}forEach _vehicles;
{_objects pushBackUnique _x}forEach _vehicles;
_vehicles=[];
{
_type=typeOf _x;
_pos=getPosASL _x;
_dir=getDir _x;
_dam=getDammage _x;
_fuel=fuel _x;
_cargo=[itemCargo _x,weaponCargo _x,magazineCargo _x,backPackCargo _x];
//_vars=_x call dmp_fnc_GetVariables;
_vars=[];
//_vehicles pushBack[[_type,_pos,_dir,_dam,_fuel],_cargo,_vars];
dmpRPGsavedObjects pushBackUnique _x;
dmpRPGsavedObjectInfo pushBackUnique[[_type,_pos,_dir,_dam,_fuel],_cargo,_vars];
}forEach _objects;
_text="";
if(dmpDebug)then{{_text=format["SaveObjects: %1\n\n%2",_text,(typeOf _x)]}forEach _vehicles;hint _text};
TRUE