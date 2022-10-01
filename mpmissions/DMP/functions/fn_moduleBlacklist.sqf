private["_module","_units","_activated","_marker","_radius"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
//sleep .1;
if!(isServer)exitWith{};
_radius=_module getVariable"dmpRadius";
waitUntil{!(isNil"dmpBlacklist")};
//dmpBlacklist pushBack(getPos _module);
dmpBlacklist pushBack _module;
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};

_marker="";
if(dmpDebug)then{
	_marker=createMarkerLocal[(format["%1",_module]),getPos _module];
	_marker setMarkerShapeLocal"ELLIPSE";
	_marker setMarkerSizeLocal[_radius,_radius];
	//_marker setMarkerSizeLocal[dmpBlacklistRadius,dmpBlacklistRadius];
	_marker setMarkerColorLocal"ColorBlack";
	_marker setMarkerBrushLocal"BORDER";
	_marker setMarkerAlphaLocal .9;
};