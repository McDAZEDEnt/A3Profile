private["_pos","_xPos","_yPos","_zPos","_unit","_jump","_parachute","_units"];
_pos=_this select 0;
openMap FALSE;
hintSilent"";
_xPos=_pos select 0;
_yPos=_pos select 1;
_zPos=520;
_zPos=dmpParachuteAlt;

if(dmpParachuteAlt<1)exitWith{_pos execVM"DMP\Scripts\Parachute\Infiltrate.sqf"};

_unit=objNull;
_jump=true;
_parachute=objNull;
_units=[];

if(isNil{dmpParachuteGroup})then{dmpParachuteGroup=FALSE};

//if(isTouchingGround player)exitWith{};

//if!((vehicle player)==player)exitWith{};

if(player==(leader(group player)))then{
	if!(dmpParachuteGroup)exitWith{_units=[player]};
	//_units=units(group player);
	//{if(isPlayer _x)then{_units=_units-[_x]}}forEach _units;
	{_units pushBackUnique(vehicle _x)}forEach units(group player);
};

if(dmpDebug)then{hint format["Airdrop: %1",_units]};
if((count _units)==0)then{_units=[player]};
//reverse _units;_units pushBack player;reverse _units;

{
_unit=_x;
_jump=TRUE;
if!(isTouchingGround _unit)then{_jump=FALSE};
//if!((vehicle _unit)==_unit)then{
if!(_unit isKindOf"Man")then{
	_jump=FALSE;
	if!(isTouchingGround _unit)exitWith{};
	if!((player distance _unit)>300)exitWith{};
	_xPos=_xPos-10;
	_pos=[_xPos,_yPos,_zPos];
	_unit setPosATL _pos;
	[_pos,200,_unit]execVM"DMP\Scripts\Parachute\Vehicle.sqf";
	sleep .5;
};
if(_jump)then{
	_xPos=_xPos-10;
	_pos=[_xPos,_yPos,_zPos];
	_unit setPosATL _pos;
	//if(dmpDebug)then{systemChat format["%1 jumping",_unit]};
	sleep .5;
};
}forEach _units;
sleep .3;

player setVariable["dmpDeployChute",FALSE,FALSE];
// Taken from here: https://community.bistudio.com/wiki/BIS_fnc_holdActionAdd
[
player,
"Deploy chute",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa",
"_this distance _target < 3",
"_caller distance _target < 3",
{},
{},
{player setVariable["dmpDeployChute",TRUE,FALSE];},
{},
[],
.3,
0,
TRUE,
FALSE
]remoteExec["BIS_fnc_holdActionAdd",0,player];

{if!(isPlayer _x)then{_x execVM"DMP\Scripts\Parachute\AI.sqf";sleep .1}}forEach _units;

while{TRUE}do{
	//if!(isNull(findDisplay 602))exitWith{};
	if(player getVariable"dmpDeployChute")exitWith{player setVariable["dmpDeployChute",FALSE,FALSE]};
	if!(alive player)exitWith{};
	sleep .1;
};

{
if(alive _x)then{
	if!((vehicle _x)==_x)exitWith{};
	if!(_x isKindOf"Man")exitWith{};
	_pos=getPosATL _x;
	_parachute="Steerable_Parachute_F"createVehicle _pos;
	_parachute setPosATL _pos;
	_x assignAsDriver _parachute;
	_x moveInDriver _parachute;
	sleep .2;
};
}forEach _units;