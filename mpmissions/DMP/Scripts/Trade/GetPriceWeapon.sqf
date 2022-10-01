private["_item","_price","_typeNum","_autoFire","_gl","_mags","_count","_countMax"];
_item=_this;
_price=10;
_typeNum=0;
_autoFire=0;
_gl=false;
_mags=[];
_count=0;
_countMax=0;

_typeNum=getNumber(configFile>>"CfgWeapons">>_item>>"type");  //1 = rifle, 2 = pistol, 4 = launcher
_price=30;
if(_typeNum==2)then{_price=20};
if(_typeNum==3)then{_price=50};
//systemChat format["Base Price: %1",_price];
// Automatic?
_autoFire=getNumber(configFile>>"CfgWeapons">>_item>>"Autofire");
if(_autoFire>0)then{_price=_price+10};
//systemChat format["Plus auto: %1",_price];
// Can have attachments?
_attachments="true" configClasses(configFile>>"CfgWeapons">>_item>>"WeaponSlotsInfo");
//systemChat format["_attachments %1",_attachments];
_price=_price+((count _attachments)*3);
//systemChat format["Plus attachments: %1",_price];
// Has GL?
{
if("GrenadeLauncher"in([configFile>>"CfgWeapons">>_item>>_x,true]call BIS_fnc_returnParents))exitWith{_gl=true};
}forEach getArray(configFile>>"CfgWeapons">>_item>>"Muzzles");
//["UGL_F","GrenadeLauncher","Default"]
if(_gl)then{_price=_price+10};
//systemChat format["Plus GL: %1",_price];

// Get magazines (MG or not is determined by mag capacity)
_mags=getArray(configFile>>"CfgWeapons">>_item>>"Magazines");
//systemChat format["mags: %1",_mags];
_count=0;
_countMax=0;
{
_count=getNumber(configFile>>"CfgMagazines">>_x>>"Count");
if(_count>_countMax)then{_countMax=_count};
//_ammo=getText(configFile>>"CfgMagazines">>_x>>"Ammo");
}forEach _mags;
if(_countMax>50)then{_price=_price+15};
//systemChat format["Plus MG: %1",_price];
//_price=ceil _price;
//systemChat format["Price %1",_price];
ceil _price

/*
types:
muzzle: 101
optic: 201
pointer: 301
bipod: 302
visionMode[] = {"Normal","NVG","Ti"};
//getArray(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes">>_x>>"visionMode");