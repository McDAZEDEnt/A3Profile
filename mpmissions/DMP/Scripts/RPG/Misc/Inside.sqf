// Check if a man is in a house
private["_man","_inside","_x","_y","_z","_pos","_out"];
_man=_this;
_inside=FALSE;
_x=getPosASL _man select 0;
_y=getPosASL _man select 1;
_z=getPosASL _man select 2;
_z=_z+5;
_pos=[_x,_y,_z];
_out=lineIntersectsWith[(getPosASL _man),_pos];
if((_out select 0)isKindOf"House")then{_inside=TRUE};
if(_man!=(vehicle _man))then{_inside=TRUE};
_inside