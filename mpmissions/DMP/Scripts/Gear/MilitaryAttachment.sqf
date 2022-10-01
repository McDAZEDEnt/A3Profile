private["_item","_military","_modes","_visionModes","_NVG","_TI","_type"];
_item=_this;
if!(_item isEqualType"")then{if(dmpDebug)then{hintc format["%1",_item]}};
_military=FALSE;
_modes=[];
_zoomLevel="";
_visionModes=[];
_NVG=FALSE;
_TI=FALSE;
_type=getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"type");
//if(_type==101)then{_price=10};
//if(_type==301)then{_price=10};
//if(_type==302)then{_price=10};
if(_type==201)then{
	_modes="TRUE" configClasses(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes");
	_visionModes=[];
	_NVG=FALSE;
	_TI=FALSE;
	{
		_visionModes=getArray(_x>>"visionMode");
		if("Ti"in _visionModes)then{_TI=TRUE};
		if("NVG"in _visionModes)then{_NVG=TRUE};
	}forEach _modes;
	if(_TI)exitWith{_military=TRUE};
	if(_NVG)exitWith{_military=TRUE};
};
_military