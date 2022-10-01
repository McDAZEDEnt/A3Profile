private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
_radius=_module getVariable"dmpRadius";
_pos=getPos _module;
_marker="";
if(_activated)then{
	{_x setVariable["dmpDontSave",TRUE,TRUE]}forEach _units;
	_units=_pos nearEntities _radius;
	_marker=createMarkerLocal[(format["dmp%1",_module]),_pos];
	_marker setMarkerShapeLocal"ELLIPSE";
	_marker setMarkerSizeLocal[_radius,_radius];
	_marker setMarkerColorLocal"ColorWHITE";
	_marker setMarkerBrushLocal"BORDER";
	_marker setMarkerAlpha 1;
};
TRUE

/*
[
getPos _module,
_units,
(_module getVariable"dmpRadius")
]execVM"DMP\Scripts\Persistence\BlackList.sqf";
