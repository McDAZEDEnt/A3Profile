private["_module","_units","_activated","_pos","_location"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
sleep .2;
_pos=getPos _module;
_pos=[_pos select 0,_pos select 1,(getTerrainHeightASL[_pos select 0,_pos select 1])];
if((_pos select 2)<0)then{_pos=[_pos select 0,_pos select 1,0]};
_location=createLocation[(_module getVariable"dmpDesignateLocationType"),_pos,100,100];
_location setText format["%1",(_module getVariable"dmpDesignateLocationName")];