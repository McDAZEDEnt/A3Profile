private["_trader","_items","_c","_items","_weapons","_primary","_handgun","_launcher","_magazines","_attachmentsIn","_attachments","_uniformsIn","_uniforms","_vestsIn","_vests","_headgearIn","_headgear","_other","_otherIn","_traderInfo"];
_trader=_this;
//_trader=player;
_items=[];
_c=0;
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

_items=[
["FirstAidKit",5],
["B_Carryall_khk",1]
];

//{_items pushBackUnique[_x,(_x call dmp_fnc_GetPriceItem)]}forEach(dmp

/*
[
"dmpBottleFull",
"dmpBeans",
"dmpRice",
"dmpCereal",
"dmpFranta",
"dmpSprint",
"dmpEnergyDrink",
"dmpBandage",
"dmpMatches",
"dmpMesstin",
"dmpWaterPurification",
"dmpTacticalBacon",
"dmpAntibiotics",
"dmpPainkillers",
"dmpAntidote",
"dmpHeatpack",
"dmpCampingLamp",
"dmpSleepingBag",
"dmpTent"
];
*/
_c=50;

// Weapons
//_c=20;
{_weapons pushback[_x,(_x call dmp_fnc_GetPriceWeapon)]}forEach(dmpGearWeapons+dmpGearWeaponsM);
sleep .3;

_magazines=[
["1Rnd_HE_Grenade_shell",2],
["3Rnd_HE_Grenade_shell",2],
["HandGrenade",2],
["MiniGrenade",1],
["SatchelCharge_Remote_Mag",5],
["DemoCharge_Remote_Mag",5],
["ClaymoreDirectionalMine_Remote_Mag",5],
["APERSMine_Range_Mag",5],
["APERSTripMine_Wire_Mag",5],
["ATMine_Range_Mag",5],
["Laserbatteries",1]
];

//_c=20;
_attachmentsIn=dmpGearAttachments+dmpGearAttachmentsM;
_attachmentsIn=_attachmentsIn call BIS_fnc_ArrayShuffle;
if((count _attachmentsIn)>_c)then{_attachmentsIn resize _c};
_pr=-1;

//_c=10;
_uniformsIn=dmpGearUniforms+dmpGearUniformsM;
_uniformsIn=_uniformsIn call BIS_fnc_ArrayShuffle;
if((count _uniformsIn)>_c)then{_uniformsIn resize _c};
{_uniforms pushback[_x,5]}forEach _uniformsIn;

//_c=10;
_vestsIn=dmpGearVests+dmpGearVestsM;
_vestsIn=_vestsIn call BIS_fnc_ArrayShuffle;
if((count _vestsIn)>_c)then{_vestsIn resize _c};
{
_vests pushback[_x,(_x call dmp_fnc_GetPriceVest)];
}forEach _vestsIn;
sleep .3;

//_c=10;
_headgearIn=dmpGearHeadgear+dmpGearHeadgearM;
_headgearIn=_headgearIn call BIS_fnc_ArrayShuffle;
if((count _headgearIn)>_c)then{_headgearIn resize _c};
{_headgear pushback[_x,(_x call dmp_fnc_GetPriceHeadgear)]}forEach _headgearIn;
sleep .3;

_other=[];
_attachments=[];
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