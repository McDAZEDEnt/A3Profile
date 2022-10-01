// Gets a point between two positions
private["_pos1","_pos2","_distance","_dir","_out"];
_pos1=_this select 0;
_pos2=_this select 1;
// From _pos2
_distance=_this select 2;
_dir=_pos2 getDir _pos1;
_out=_pos2 getPos[_distance,_dir];
_out