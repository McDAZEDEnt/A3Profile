private["_pos","_type","_marker","_text"];
_pos=_this select 0;
_type=_this select 1;
_text="";
if((count _this)>2)then{_text=_this select 2};
_marker="";
_text=toUpper _text;
_marker=createMarkerLocal[format["dmpTask%1%2%3",_text,_pos,TIME],_pos];	
_marker setMarkerAlphaLocal 0;
_marker setMarkerTypeLocal"mil_dot";
if(_type=="CONVOY")then{_marker setMarkerTypeLocal"mil_start"};
if(_type=="KILL")then{_marker setMarkerTypeLocal"DMP_marker_kill"};
if(_type=="GO")then{_marker setMarkerTypeLocal"DMP_marker_move"};
if(_type=="EXTRACT")then{_marker setMarkerTypeLocal"DMP_marker_extract"};
if(_type=="DEMO")then{_marker setMarkerTypeLocal"DMP_marker_destroy"};
if(_type=="DESTROY")then{_marker setMarkerTypeLocal"DMP_marker_destroy"};
if(_type=="LEAVE")then{_marker setMarkerTypeLocal"DMP_marker_exit"};
if(_type=="EXFIL")then{
	_marker setMarkerShapeLocal"ELLIPSE";
	_marker setMarkerSizeLocal[dmpRadius,dmpRadius];
	_marker setMarkerColorLocal"ColorYellow";
	_marker setMarkerBrushLocal"BORDER";
	_marker setMarkerAlphaLocal .9;
};
if!(_text=="")then{_marker setMarkerTextLocal _text};
_marker setMarkerColorLocal"ColorRED";
_marker setMarkerAlpha .6;
//if(dmpUseMissionMarkers)then{_marker setMarkerAlpha .6};
_marker