if((count entities"DMP_DFC")>0)exitWith{};
private["_module","_center","_radius","_circle","_marker","_done"];
_module=_this;
_center=getPos _module;
_radius=_module getVariable"dmpRadius";
_name=format["dmp%1%2",_module,TIME];
_marker=createMarkerLocal[_name,_center];
//if((_module getVariable"dmpCircle")=="TRUE")then{"dmpAOmarker"setMarkerShapeLocal"ELLIPSE"}else{"dmpAOmarker"setMarkerShapeLocal"RECTANGLE"};
if(dmpAOcircle)then{_marker setMarkerShapeLocal"ELLIPSE"}else{_marker setMarkerShapeLocal"RECTANGLE"};
_marker setMarkerSizeLocal[_radius,_radius];
_marker setMarkerColorLocal"ColorYellow";
_marker setMarkerBrushLocal"BORDER";
_marker setMarkerAlpha 0;
if(dmpDebug)then{_marker setMarkerAlpha .9};
_done=[_marker,_radius]execVM"DMP\Scripts\Map\Locations.sqf";waitUntil{scriptDone _done};
_done=[_marker,_radius]execVM"DMP\Scripts\Map\RemoteAreas.sqf";waitUntil{scriptDone _done};
{[_x,_marker]call dmp_fnc_Compounds}forEach dmpRemoteAreas;