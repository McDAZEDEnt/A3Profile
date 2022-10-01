private["_w","_isMilitary","_mags"];
_w=_this;
_isMilitary=FALSE;
_mags=[];
//if(getNumber(configFile>>"CfgWeapons">>_w>>"scope")<2)then{_isMilitary=true;systemChat "dont add HIDDEN"};
if(getNumber(configFile>>"CfgWeapons">>_item>>"type")==4)exitWith{TRUE};
if((getNumber(configFile>>"CfgWeapons">>_w>>"FullAuto">>"autofire"))==1)exitWith{TRUE};
if((getText(configFile>>"CfgWeapons">>_w>>"cursor"))=="mg")exitWith{TRUE};
_mags=getArray(configFile>>"CfgWeapons">>_w>>"magazines");
{if(getNumber(configFile>>"CfgMagazines">>_w>>"count")>30)exitWith{_isMilitary=TRUE}}forEach _mags;
_isMilitary