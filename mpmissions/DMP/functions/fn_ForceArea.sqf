private["_module","_units","_activated","_pos","_type","_marker"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
_pos=getPos _module;
_type=_module getVariable"dmpAreaType";
_marker="";
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
if(_type=="Remote")then{
	dmpRemoteAreas pushBack _pos;
	if(dmpDebug)then{
		_marker=format["dmpRA%1%2",TIME,_pos];
		createMarkerLocal[_marker,_pos];
		_marker setMarkerShape"ELLIPSE";
		_marker setMarkerBrush"SOLID";
		_marker setMarkerColor"colorKHAKI";
		_marker setMarkerSize[dmpRemoteSize,dmpRemoteSize];
	};
};
if(_type=="Water")then{
	dmpWaterAreas pushBack _pos;
	if(dmpDebug)then{
		_marker=format["dmpWA%1%2",TIME,_pos];
		createMarkerLocal[_marker,_pos];
		_marker setMarkerAlpha .2;
		_marker setMarkerShape"ELLIPSE";
		_marker setMarkerBrush"SOLID";
		_marker setMarkerColor"colorBLUE";
		_marker setMarkerSize[dmpRemoteSize,dmpRemoteSize];
	};
};
sleep(random 30);
deleteVehicle _module;