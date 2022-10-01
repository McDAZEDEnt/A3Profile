private["_men","_units","_info","_done","_synced"];
if((count(entities"DMP_Loot"))<1)exitWith{hint"DMP Traders requires a DMP Loot module to be placed"};
_units=[(_this select 0),["Man"],200]call dmp_fnc_GetUnits;
_synced=_this select 1;
_info=_this select 2;
_units=_units-_synced;
_men=[];
dmpTypesTrader=["C_man_1"];
{if(_x isKindOf"MAN")then{_men pushBack(typeOf _x)}}forEach _units;
sleep .3;
{if(_x isKindOf"MAN")then{deleteVehicle _x};sleep .1}forEach _units;
sleep 1;
if((count _men)>0)then{dmpTypesTrader=_men};

dmpTradeAutoGen=TRUE;
if((_info select 0)=="FALSE")then{dmpTradeAutoGen=FALSE};
if((dmpTradeAutoGen)AND((count(entities"DMP_Loot"))<1))then{dmpTradeAutoGen=FALSE};

dmpTradeItemCount=(_info select 3)call dmp_fnc_ParseArray;

dmpTradeLoadDefaults=TRUE;
if((_info select 11)=="FALSE")then{dmpTradeLoadDefaults=FALSE};
if(dmpTradeAutoGen)then{dmpTradeLoadDefaults=FALSE};

_done=execVM"DMP\Scripts\Trade\DefineGear.sqf";waitUntil{scriptDone _done};

dmpPlayerCash=0;
dmpCurrentTraderInfo=[];
// 
dmpCurrentTraderModes=["Food","Medical","Items","Weapons","Magazines","Attachments","Uniforms","Vests","Headgear","Other"];
dmpCurrentTraderMode="Food";
dmpTradeBuying=TRUE;

dmpAllowBIS=TRUE;

dmp_fnc_GetItems=compile preprocessFile"DMP\Scripts\Trade\GetItems.sqf";
dmp_fnc_GetItems2=compile preprocessFile"DMP\Scripts\Trade\GetItems2.sqf";
dmp_fnc_GetPriceVest=compile preprocessFile"DMP\Scripts\Trade\GetPriceVest.sqf";
dmp_fnc_GetPriceHeadgear=compile preprocessFile"DMP\Scripts\Trade\GetPriceHeadgear.sqf";
dmp_fnc_GetPriceAttachment=compile preprocessFile"DMP\Scripts\Trade\GetPriceAttachment.sqf";
dmp_fnc_GetPriceWeapon=compile preprocessFile"DMP\Scripts\Trade\GetPriceWeapon.sqf";
dmp_fnc_GetPriceItem=compile preprocessFile"DMP\Scripts\Trade\GetPriceItem.sqf";
dmp_fnc_GetPriceUniform=compile preprocessFile"DMP\Scripts\Trade\GetPriceUniform.sqf";
dmp_fnc_GetPriceBackpack=compile preprocessFile"DMP\Scripts\Trade\GetPriceBackpack.sqf";
dmp_fnc_GetPrice=compile preprocessFile"DMP\Scripts\Trade\GetPrice.sqf";
dmp_fnc_MilitaryWeapon=compile preprocessFile"DMP\Scripts\Trade\MilitaryWeapon.sqf";
dmp_fnc_GetPriceVehicleWeapon=compile preprocessFile"DMP\Scripts\Trade\GetPriceVehicleWeapon.sqf";
dmp_fnc_GetPriceVehicle=compile preprocessFile"DMP\Scripts\Trade\GetPriceVehicle.sqf";

sleep 2;
{[_x,TRUE,FALSE,FALSE]execVM"DMP\Scripts\Trade\PrepTrader.sqf"}forEach _synced;
sleep 2;

if!(call dmp_fnc_Proceed)exitWith{};

[dmpTypesTrader,_info]execVM"DMP\Scripts\Trade\PopulateMap.sqf";