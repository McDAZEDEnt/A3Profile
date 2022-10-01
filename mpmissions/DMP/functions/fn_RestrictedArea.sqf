private["_module","_units","_activated","_size","_marker"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
_size=0;
_marker="";
if(_activated)then{
	_size=_module getVariable"dmpSize";
	_marker=createMarkerLocal[(format["dmpRA%1",_module]),getPos _module];
	_marker setMarkerShapeLocal(_module getVariable"dmpShape");
	_marker setMarkerSizeLocal[_size,_size];
	_marker setMarkerColorLocal"ColorRed";
	//_marker setMarkerBrushLocal"SolidBorder";
	if(dmpDebug)then{_marker setMarkerAlpha 1}else{_marker setMarkerAlpha 0};
	dmpRestrictedAreas pushBackUnique _marker;
};
TRUE