private["_item","_price","_modes","_zoomLevel","_visionModes","_NVG","_TI","_type"];
_item=_this;
if!(_item isEqualType"")then{if(dmpDebug)then{hintc format["%1",_item]}};
_price=10;
_modes=[];
_zoomLevel="";
_visionModes=[];
_NVG=false;
_TI=false;
_type=getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"type");
if(_type==101)then{_price=10};
if(_type==301)then{_price=10};
if(_type==302)then{_price=10};
if(_type==201)then{
	_price=10;
	//_modes=getArray(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes");
	_modes="true" configClasses(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes");
//	systemChat format["Modes: %1",_modes];
	_zoomLevel="Low";
	_visionModes=[];
	_NVG=false;
	_TI=false;
	{
		//_zoom=getNumber(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes">>_x>>"distanceZoomMax");
		_zoom=getNumber(_x>>"distanceZoomMax");
		//systemChat format["%1",_zoom];
		if(_zoom>200)then{_zoomLevel="Med"};
		if(_zoom>300)then{_zoomLevel="High"};
		//_visionModes=getArray(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes">>_x>>"visionMode[]");
		_visionModes=getArray(_x>>"visionMode");
		//systemChat format["%1",_visionModes];
		if("Ti"in _visionModes)then{_TI=true};
		if("NVG"in _visionModes)then{_NVG=true};
	}forEach _modes;
	if(_zoomLevel=="Low")then{_price=10};
	if(_zoomLevel=="Med")then{_price=15};
	if(_zoomLevel=="High")then{_price=20};
	if(_TI)then{_price=_price*2};
	if(_NVG)then{_price=_price*2};
};
ceil _price

/*
types:
muzzle: 101
optic: 201
pointer: 301
bipod: 302
visionMode[] = {"Normal","NVG","Ti"};
//getArray(configFile>>"CfgWeapons">>_item>>"ItemInfo">>"OpticsModes">>_x>>"visionMode");