private["_info","_c","_units","_applyToGroup","_noise","_visibility","_load","_animSpeed","_weaponSway","_medic","_engineer","_explosives","_UAVhacker","_interpreter","_script","_allUnits"];
_info=_this;
_c=0;
_units=_info select _c;_c=_c+1;
_applyToGroup=TRUE;if((_info select _c)=="FALSE")then{_applyToGroup=FALSE};_c=_c+1;
_noise=_info select _c;_c=_c+1;
_visibility=_info select _c;_c=_c+1;
_load=_info select _c;_c=_c+1;
_weaponSway=_info select _c;_c=_c+1;
_animSpeed=_info select _c;_c=_c+1;
_medic=TRUE;if((_info select _c)=="FALSE")then{_medic=FALSE};_c=_c+1;
_engineer=TRUE;if((_info select _c)=="FALSE")then{_engineer=FALSE};_c=_c+1;
_explosives=TRUE;if((_info select _c)=="FALSE")then{_explosives=FALSE};_c=_c+1;
_UAVhacker=TRUE;if((_info select _c)=="FALSE")then{_UAVhacker=FALSE};_c=_c+1;
_interpreter=TRUE;if((_info select _c)=="FALSE")then{_interpreter=FALSE};_c=_c+1;
_script=_info select _c;_c=_c+1;

{if!(_x isKindOf"Man")then{_units=_units-[_x]}}forEach _units;
{if!(local _x)then{_units=_units-[_x]}}forEach _units;
_allUnits=[];
if(_applyToGroup)then{
	{_allUnits pushBackUnique(units(group _x))}forEach _units;
}else{_allUnits=_allUnits+_units};

{
if(_noise>-1)then{_x setUnitTrait["audibleCoef",_noise,TRUE]};
if(_visibility>-1)then{_x setUnitTrait["camouflageCoef",_visibility,TRUE]};
if!(_load==1)then{_x setUnitTrait["loadCoef",_load,TRUE]};
if(_weaponSway>-1)then{_x setCustomAimCoef _weaponSway};
if(_animSpeed>-1)then{_x setAnimSpeedCoef _animSpeed};
if(_medic)then{_x setUnitTrait["medic",TRUE,TRUE]};
if(_engineer)then{_x setUnitTrait["engineer",TRUE,TRUE]};
if(_explosives)then{_x setUnitTrait["explosiveSpecialist",TRUE,TRUE]};
if(_UAVhacker)then{_x setUnitTrait["UAVHacker",TRUE,TRUE]};
if(_interpreter)then{_x setVariable["dmpInterpreter",TRUE,TRUE]};
if!(_script=="")then{_x execVM _script};
}forEach _allUnits;