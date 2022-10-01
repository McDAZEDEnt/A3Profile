private["_w","_isMilitary","_mags"];
_w=_this;
_isMilitary=false;
_mags=[];
if((getNumber(configFile>>"CfgWeapons">>_w>>"FullAuto">>"autofire"))==1)exitWith{TRUE};
if((getNumber(configFile>>"CfgWeapons">>_w>>"type"))==4)exitWith{TRUE};
//if!(_isMilitary)then{if((getText(configFile>>"CfgWeapons">>_w>>"cursor"))=="mg")exitWith{TRUE}};
if("EGLM"in(getArray(configFile>>"CfgWeapons">>_w>>"muzzles")))exitWith{TRUE};
if!(_isMilitary)then{
	_mags=getArray(configFile>>"CfgWeapons">>_w>>"magazines");
	{if(getNumber(configFile>>"CfgMagazines">>_w>>"count")>30)exitWith{_isMilitary=TRUE}}forEach _mags;
};
_isMilitary