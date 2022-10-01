private["_item","_military"];
_item=_this;
if!(_item isEqualType"")then{if(dmpDebug)then{hintc format["%1",_item]}};
_military=FALSE;
if(_item in["list of food etc"])exitWith{FALSE};
if(getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"type")==701)exitWith{(_item call dmp_fnc_MilitaryVest)};
if(getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"type")==604)exitWith{(_item call dmp_fnc_MilitaryHeadgear)};
if((getNumber(configFile>>"CfgWeapons">>_item>>"itemInfo">>"type"))in[101,201,301,302])exitWith{(_item call dmp_fnc_MilitaryAttachment)};
_military