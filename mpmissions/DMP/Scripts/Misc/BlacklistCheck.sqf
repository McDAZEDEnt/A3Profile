private["_pos","_safe","_radius"];
_pos=_this;
_safe=TRUE;
//{if((_pos distance2D _x)<dmpBlacklistRadius)exitWith{_safe=FALSE}}forEach dmpBlacklist;
_radius=0;
{
if(isNil{_x getVariable"dmpRadius"})then{_radius=dmpBlacklistRadius}else{_radius=_x getVariable"dmpRadius"};
if((_pos distance2D _x)<_radius)exitWith{_safe=FALSE};
}forEach dmpBlacklist;
_safe