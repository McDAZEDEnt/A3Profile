private["_men","_units","_info"];
_units=[(_this select 0),["Man"],200]call dmp_fnc_GetUnits;
_info=_this select 1;

_men=[];
dmpTypesTrader=["C_man_1"];

{if(_x isKindOf"MAN")then{_men pushBack(typeOf _x)}}forEach _units;
sleep .3;
{if(_x isKindOf"MAN")then{deleteVehicle _x}else{{deleteVehicle _x}forEach(crew _x)deleteVehicle _x};sleep .1}forEach _units;
sleep 1;
if((count _men)>0)then{dmpTypesTrader=_men};

















/*
dmpPlayerCash=[];

dmpTypesMerchant=[];
dmpCurrentTraderInfo=[];
dmpCurrentTraderMode=[];

dmp_fnc_GetDisplayName

dmp_fnc_GetPriceWeapon
dmp_fnc_GetPriceAttachment

dmp_fnc_GetPriceVehicleWeapon
