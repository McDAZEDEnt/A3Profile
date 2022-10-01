private["_code","_selected","_item","_d"];
disableSerialization;
_code=_this;
_selected="";
_item="";
_d="";
if(_code=="Buy")exitWith{
	_selected=lbData[8030,lbCurSel 8030];
	_item=(_selected splitString"--")select 0;
	_d=getText(configFile>>"CfgWeapons">>_item>>"Library">>"libTextDesc");
	if(_d=="")then{_d=getText(configFile>>"CfgWeapons">>_item>>"descriptionShort")};
	if(_d=="")then{_d=getText(configFile>>"CfgMagazines">>_item>>"descriptionShort")};
	if(_d=="")then{_d=getText(configFile>>"CfgWeapons">>_item>>"Library">>"libTextDesc")};
	//if(_d=="")exitWith{hintSilent format["No info:\n%1",_item call dmp_fnc_GetDisplayName]};
	if(_d=="")exitWith{hintSilent format["%1",_item call dmp_fnc_GetDisplayName]};
	hintSilent parsetext format["%1",_d];
};
if(_code=="Sell")exitWith{
	_selected=lbData[8031,lbCurSel 8031];
	_item=(_selected splitString"--")select 0;
	_d=getText(configFile>>"CfgWeapons">>_item>>"Library">>"libTextDesc");
	if(_d=="")then{_d=getText(configFile>>"CfgWeapons">>_item>>"descriptionShort")};
	if(_d=="")then{_d=getText(configFile>>"CfgMagazines">>_item>>"descriptionShort")};
	if(_d=="")then{_d=getText(configFile>>"CfgWeapons">>_item>>"Library">>"libTextDesc")};
	if(_d=="")exitWith{hintSilent format["%1",_item call dmp_fnc_GetDisplayName]};
	hintSilent parsetext format["%1",_d];
};