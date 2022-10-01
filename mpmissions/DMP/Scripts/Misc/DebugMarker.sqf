private["_pos","_description","_marker","_colour"];
_pos=_this select 0;
_description=_this select 1;
_colour="ColorYellow";
if((count _this)>2)then{_colour=_this select 2};
_marker="";
_marker=createMarkerLocal[format["DMP_debug_%1_%2_%3",_description,_pos,TIME],_pos];	
_marker setMarkerTypeLocal"mil_dot";
_marker setMarkerTextLocal _description;
_marker setMarkerColorLocal _colour;
_marker