private["_pos","_pos2","_dir","_distance","_distanceText","_dirText","_i","_text"];
_pos=_this select 0;
_pos2=_this select 1;
_dir=_pos getDir _pos2;
_distance=_pos distance2D _pos2;
_distanceText=_distance call dmp_fnc_RoughDistance;
_dirText=["south","south west","west","north west","north","north east","east","south east","south"];
_i=round((((_dir)%360)/45));
_text=format["%1 %2",_distanceText,_dirText select _i];
_text