private["_groups","_ms","_m"];
_groups=[];
_ms=[];
_m="";
{
if((side _x)==dmpAdminSide)then{_groups pushBack _x};
}forEach allGroups;

{
_m=createMarkerLocal[format["dmp_Admin_%1_%2",TIME,_x],(getpos leader _x)];	
_m setMarkerTypeLocal"mil_dot";
_m setMarkerTextLocal(format["%1",_x]);
_m setMarkerColorLocal"ColorYELLOW";
_ms pushBack _m;
}forEach _groups;
sleep 20;
{deleteMarker _x}forEach _ms;