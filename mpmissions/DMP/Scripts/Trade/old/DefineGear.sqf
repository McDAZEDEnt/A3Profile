// Define stuff that is for sale
private["_pos","_crate","_index","_weapons","_magazines","_items","_backpacks","_allLoot"];
dmpTradeGearItems=[];
dmpTradeGearWeapons=[];
dmpTradeGearMagazines=[];
dmpTradeGearAttachments=[];
dmpTradeGearUniforms=[];
dmpTradeGearVests=[];
dmpTradeGearHeadgear=[];
dmpTradeGearBackpacks=[];
//dmpCrateTrade=objNull;
//dmpTradeLoadDefaults=TRUE;
_pos=[];
_crate=objNull;
if(isNil"dmpCrateTrade")then{
	_pos=[[0,0],0,3000,0,0,1,0]call BIS_fnc_findSafePos;sleep .3;
	dmpCrateTrade="B_supplyCrate_F"createVehicle _pos;sleep .1;_crate=dmpCrateTrade;//_crate hideObjectGlobal TRUE;
	_crate allowDamage FALSE;clearItemCargoGlobal _crate;clearWeaponCargoGlobal _crate;clearMagazineCargoGlobal _crate;clearBackpackCargoGlobal _crate;
	sleep .3;
};
sleep .5;

if(dmpTradeLoadDefaults)then{
	_crate=dmpCrateTrade;
	//clearItemCargoGlobal _crate;clearWeaponCargoGlobal _crate;clearMagazineCargoGlobal _crate;clearBackpackCargoGlobal _crate;
	{_crate addItemCargoGlobal[_x,1]}forEach["FirstAidKit","ItemMap","ItemCompass","ItemWatch","U_I_L_uniform_01_deserter_F","Optic_ARCO_blk_F"];
	{_crate addWeaponCargoGlobal[_x,1]}forEach["Binocular","hgun_P07_F","V_TacVest_blk","arifle_MX_Black_F"];
	{_crate addMagazineCargoGlobal[_x,1]}forEach[];
	{_crate addBackpackCargoGlobal[_x,1]}forEach["B_AssaultPack_blk"];
};
sleep .3;

_index=0;
_weapons=[];
_magazines=[];
_items=[];
_backpacks=[];
_allLoot=[];
_crate=dmpCrateTrade;
//player setPos getPos _crate;
_weapons=weaponCargo _crate;dmpTradeGearWeapons=dmpTradeGearWeapons+_weapons;
_magazines=magazineCargo _crate;dmpTradeGearMagazines=dmpTradeGearMagazines+_magazines;
_items=itemCargo _crate;dmpTradeGearItems=dmpTradeGearItems+_items;
_backpacks=backpackCargo _crate;dmpTradeGearBackpacks=dmpTradeGearBackpacks+_backpacks;
_allLoot=_weapons+_magazines+_items+_backpacks;
//hintc format["AllLoot: %1 %2 %3",_crate,_index,_allLoot];
sleep .3;
deleteVehicle _crate;
{
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==801)then{dmpTradeGearWeapons=dmpTradeGearWeapons-[_x];dmpTradeGearUniforms pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==701)then{dmpTradeGearWeapons=dmpTradeGearWeapons-[_x];dmpTradeGearVests pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==605)then{dmpTradeGearWeapons=dmpTradeGearWeapons-[_x];dmpTradeGearHeadgear pushBack _x};
}forEach dmpTradeGearWeapons;
sleep .3;
{
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==801)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearUniforms pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==701)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearVests pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"ItemInfo">>"type")==605)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearHeadgear pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"itemInfo">>"type")==101)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearAttachments pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"itemInfo">>"type")==201)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearAttachments pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"itemInfo">>"type")==301)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearAttachments pushBack _x};
	if(getNumber(configFile>>"cfgWeapons">>_x>>"itemInfo">>"type")==302)then{dmpTradeGearItems=dmpTradeGearItems-[_x];dmpTradeGearAttachments pushBack _x};
}forEach dmpTradeGearItems;