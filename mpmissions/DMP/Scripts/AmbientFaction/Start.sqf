private["_units","_info","_c","_factionName","_sideT","_side","_chance","_distance","_groupSize","_garrisonChance","_script","_squadLeaders","_infantry","_allowAir"];
//_units=(_this select 0)nearEntities[["Man"],200];
_units=[(_this select 0),["Man"],200]call dmp_fnc_GetUnits;
_info=_this select 1;

_c=0;
_factionName=_info select _c;_c=_c+1;
_sideT=_info select _c;_c=_c+1;
_side=EAST;
if(_sideT=="WEST")then{_side=WEST};
if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
if(_sideT=="CIVILIAN")then{_side=CIVILIAN};
if(_sideT=="RANDOM")then{_side=selectRandom[WEST,EAST,RESISTANCE]};
_chance=_info select _c;_c=_c+1;
_distance=_info select _c;_c=_c+1;
_groupSize=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_garrisonChance=_info select _c;_c=_c+1;
_allowAir=TRUE;if((_info select _c)=="FALSE")then{_allowAir=FALSE};_c=_c+1;
_stayCleared=TRUE;if((_info select _c)=="FALSE")then{_stayCleared=FALSE};_c=_c+1;
_script=_info select _c;_c=_c+1;

//hintc format["%1",_info];sleep .5;

_squadLeaders=[];
_infantry=[];
{
if(_x isKindOf"MAN")then{
	if((rank _x)=="SERGEANT")exitWith{_squadLeaders pushBack(typeOf _x)};
	if((toLower(getText(configfile>>"cfgVehicles">>(typeOf _x)>>"icon")))=="iconmanleader")exitWith{_squadLeaders pushBack(typeOf _x)};
	_infantry pushBack(typeOf _x);
};
}forEach _units;

{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
sleep .1;
}forEach _units;
sleep 1;

if((count _squadLeaders)==0)then{_squadLeaders=["B_G_Soldier_SL_F","B_G_Soldier_TL_F"]};
if((count _infantry)==0)then{_infantry=["B_G_Soldier_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_GL_F","B_G_soldier_M_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT2_F","B_G_Sharpshooter_F"]};

if(_chance>0)then{[_factionName,_side,_chance,_distance,_groupSize,_garrisonChance,_allowAir,_stayCleared,_script,[_squadLeaders,_infantry]]execVM"DMP\Scripts\AmbientFaction\SpawnLoop.sqf"};