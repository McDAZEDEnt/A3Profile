private["_info","_c","_unitsIn","_module","_pos","_xPos","_yPos","_zPos","_scatterArray","_AItypes","_unit","_jump","_parachute","_units","_goCodeIn","_goCodeOut","_scatter","_AI","_delay","_groups","_group"];
_info=_this;

_c=0;
_unitsIn=_info select _c;_c=_c+1;
_module=_info select _c;_c=_c+1;
//_pos=_info select _c;_c=_c+1;
_zPos=_info select _c;_c=_c+1;
_scatterArray=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_AItypes=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_delay=_info select _c;_c=_c+1;
_goCodeIn=_info select _c;_c=_c+1;
_goCodeOut=_info select _c;_c=_c+1;

_scatter=_scatterArray call BIS_fnc_RandomInt;

_groups=[];
_group=grpNull;
{_groups pushBackUnique(group _x)}forEach _unitsIn;

if!(_goCodeIn=="")then{
	while{TRUE}do{
		sleep 1;
		if(_goCodeIn in dmpGoCodes)exitWith{};
	};
};
sleep _delay;

_pos=getPos _module;
_pos=[_pos,_scatter]call dmp_fnc_ScatterCircle;

_xPos=_pos select 0;
_yPos=_pos select 1;

_units=[];
_unit=objNull;
_parachute=objNull;
_jump=TRUE;
{
_unit=_x;
{_units pushBackUnique(vehicle _x)}forEach units(group _unit);
}forEach _unitsIn;

{
_unit=_x;
_jump=TRUE;
if!(isTouchingGround _unit)then{_jump=FALSE};
//if!((vehicle _unit)==_unit)then{
if!(_unit isKindOf"Man")then{
	_jump=FALSE;
	if!(isTouchingGround _unit)exitWith{};
	_xPos=_xPos-10;
	_pos=[_xPos,_yPos,_zPos];
	_unit setPosATL _pos;
	[_pos,_zPos,_unit]execVM"DMP\Scripts\Parachute\Vehicle.sqf";
	sleep .5;
};
if(_jump)then{
	_xPos=_xPos-10;
	_pos=[_xPos,_yPos,_zPos];
	_unit setPosATL _pos;
	_parachute="Steerable_Parachute_F"createVehicle _pos;
	_parachute setPosATL _pos;
	_unit assignAsDriver _parachute;
	_unit moveInDriver _parachute;
	sleep 1;
};
}forEach _units;

/*
{
_unit=_x;
_jump=TRUE;
//if!(isTouchingGround _unit)then{_jump=FALSE};
if!((vehicle _unit)==_unit)then{_jump=FALSE};
if(_jump)then{
	_xPos=_xPos-5;
	_pos=[_xPos,_yPos,_zPos];
	_unit setPosATL _pos;
	_parachute="Steerable_Parachute_F"createVehicle _pos;
	_parachute setPosATL _pos;
	_unit assignAsDriver _parachute;
	_unit moveInDriver _parachute;
	sleep 1;
};
}forEach _units;
*/

_AI="";
{
_group=_x;
if((count _AItypes)>0)then{_AI=selectRandom _AItypes};
if(_AI=="Attack")then{[_group,_pos]execVM"DMP\Scripts\AI\Attack.sqf"};
if(_AI=="Security")then{_group execVM"DMP\Scripts\AI\Security.sqf"};
if(_AI=="Hunt")then{_group execVM"DMP\Scripts\AI\Hunt.sqf"};
if(_AI=="Patrol")then{_group execVM"DMP\Scripts\AI\EnhancedPatrol.sqf"};
if(_AI=="LongPatrol")then{[_group,_pos]execVM"DMP\Scripts\AI\LongPatrol.sqf"};
{_x setVariable["dmpAItype",_AI,TRUE]}forEach units _group;
//{_x setVariable["dmpFaction","",TRUE]}forEach units _group;
//sleep 10;
_group execVM"DMP\Scripts\Spawn\PrepGroup.sqf";
}forEach _groups;

if!(_goCodeOut=="")then{dmpGoCodes pushBack _goCodeOut;publicVariable"dmpGoCodes"};