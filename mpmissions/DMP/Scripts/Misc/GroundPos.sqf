private["_pos","_x","_y","_z"];
_pos=_this;
_x=_pos select 0;
_y=_pos select 1;
_z=getTerrainHeightASL _pos;
[_x,_y,_z]