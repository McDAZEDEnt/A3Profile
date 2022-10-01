private["_item","_isBIS"];
_item=_this;
_isBIS=false;
if(getText(configFile>>"CfgWeapons">>_item>>"author")=="Bohemia Interactive")then{_isBIS=true};
if(getText(configFile>>"CfgMagazines">>_item>>"author")=="Bohemia Interactive")then{_isBIS=true};
_isBIS