private["_item","_price","_armour"];
_item=_this;
_price=5;
_armour=0;
{
_armour=getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"HitpointsProtectionInfo">>_x>>"armor");
if(_armour>0)then{_price=_price+_armour};
}forEach["chest","body","abdomen","diaphragm","neck","pelvis","arms","legs"];
ceil _price