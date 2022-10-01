private["_pos","_xPos","_yPos","_zPos","_unit","_jump","_parachute","_units"];
_pos=_this;
hintSilent"";
_xPos=_pos select 0;
_yPos=_pos select 1;
_zPos=0;

_unit=objNull;
_jump=true;
_parachute=objNull;
_units=[];

if(isNil{dmpParachuteGroup})then{dmpParachuteGroup=FALSE};

if(player==(leader(group player)))then{
	if!(dmpParachuteGroup)exitWith{_units=[player]};
	{_units pushBackUnique(vehicle _x)}forEach units(group player);
};

if(dmpDebug)then{hintSilent format["Infiltrate: %1",_units]};
if((count _units)==0)then{_units=[player]};
//reverse _units;_units pushBack player;reverse _units;

{
_unit=_x;
_jump=TRUE;
if!(isTouchingGround _unit)then{_jump=FALSE};
if(_jump)then{
	_xPos=_xPos-10;
	_pos=[_xPos,_yPos,_zPos];
	//_pos=[_pos,0,100,1,0,1,0]call BIS_fnc_findSafePos;
	if(_unit isKindOf"Man")then{_unit setVehiclePosition[_pos,[],0,"none"]}else{_unit setVehiclePosition[_pos,[],100,"none"]};
	sleep .25;
};
}forEach _units;