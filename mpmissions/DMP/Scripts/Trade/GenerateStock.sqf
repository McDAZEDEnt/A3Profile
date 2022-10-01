private["_trader","_items","_c","_food","_medical","_items","_weapons","_primary","_handgun","_launcher","_magazines","_attachmentsIn","_attachments","_uniformsIn","_uniforms","_vestsIn","_vests","_headgearIn","_headgear","_other","_otherIn","_traderInfo"];
_trader=_this;
//_trader=player;
_items=[];
_c=0;
_food=[];
_medical=[];
_items=[];
_weapons=[];
_primary=[];
_handgun=[];
_launcher=[];
_magazines=[];
_attachmentsIn=[];
_attachments=[];
_uniformsIn=[];
_uniforms=[];
_vestsIn=[];
_vests=[];
_headgearIn=[];
_headgear=[];
_other=[];
_otherIn=[];
_traderInfo=[];

{_food pushbackUnique[_x,(_x call dmp_fnc_GetPriceItem)]}forEach dmpTradeGearFood;
_food=_food call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _food)>_c)then{_good resize _c};

{_medical pushbackUnique[_x,(_x call dmp_fnc_GetPriceItem)]}forEach dmpTradeGearMedical;
_medical=_medical call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _medical)>_c)then{_good resize _c};

{_items pushbackUnique[_x,(_x call dmp_fnc_GetPriceItem)]}forEach dmpTradeGearItems;
_items=_items call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _items)>_c)then{_items resize _c};

// Weapons
{_weapons pushbackUnique[_x,(_x call dmp_fnc_GetPriceWeapon)]}forEach dmpTradeGearWeapons;
_weapons=_weapons call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _weapons)>_c)then{_weapons resize _c};

_magazines=[];

_attachmentsIn=[]+dmpTradeGearAttachments;
_attachmentsIn=_attachmentsIn call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _attachmentsIn)>_c)then{_attachmentsIn resize _c};
{_attachments pushbackUnique[_x,(_x call dmp_fnc_GetPriceAttachment)]}forEach _attachmentsIn;
systemChat str _attachments;

_uniformsIn=[]+dmpTradeGearUniforms;
_uniformsIn=_uniformsIn call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _uniformsIn)>_c)then{_uniformsIn resize _c};
{_uniforms pushbackUnique[_x,(_x call dmp_fnc_GetPriceUniform)]}forEach _uniformsIn;

_vestsIn=[]+dmpTradeGearVests;
_vestsIn=_vestsIn call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _vestsIn)>_c)then{_vestsIn resize _c};
{
_vests pushbackUnique[_x,(_x call dmp_fnc_GetPriceVest)];
}forEach _vestsIn;

_headgearIn=[]+dmpTradeGearHeadgear;
_headgearIn=_headgearIn call BIS_fnc_ArrayShuffle;
_c=dmpTradeItemCount call BIS_fnc_randomInt;
if((count _headgearIn)>_c)then{_headgearIn resize _c};
{_headgear pushbackUnique[_x,(_x call dmp_fnc_GetPriceHeadgear)]}forEach _headgearIn;

//_other=[];
/*
_other=[
["I_G_Offroad_01_armed_F",10],
["I_G_Offroad_01_AT_F",10],
["B_T_LSV_01_armed_F",20],
["B_T_LSV_01_armed_F",25],
["O_T_LSV_02_armed_F",20],
["B_T_APC_Wheeled_01_cannon_F",50],
["B_Heli_Light_01_F",20]
];
*/

/*
_c=10;
_otherIn=dmpTypesMerchantVehicles;
_otherIn=_otherIn call BIS_fnc_ArrayShuffle;
if((count _otherIn)>_c)then{_otherIn resize _c};
_pr=-1;
{_pr=_x call dmp_fnc_GetPriceVehicle;_other pushback [_x,_pr]}forEach _otherIn;
sleep .3;
*/

_other=[];
//_attachments=[];
_traderInfo pushBack _food;
_traderInfo pushBack _medical;
_traderInfo pushBack _items;
_traderInfo pushBack _weapons;
_traderInfo pushBack _magazines;
_traderInfo pushBack _attachments;
_traderInfo pushBack _uniforms;
_traderInfo pushBack _vests;
_traderInfo pushBack _headgear;
_traderInfo pushBack _other;
_trader setVariable["dmpTraderInfo",_traderInfo,true];

//hint format["TRDINFO: %1",_trader getVariable"_traderInfo"];