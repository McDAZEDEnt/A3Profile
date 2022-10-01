private["_info","_c","_delay","_units","_registered"];
_info=_this;
_c=0;
dmpKnockdownThreshold=_info select _c;_c=_c+1;
dmpKnockdownDuration=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
dmpKnockdownAffectPlayers=FALSE;
if((_info select _c)=="TRUE")then{dmpKnockdownAffectPlayers=TRUE};_c=_c+1;
dmpKnockdownAffectCrew=TRUE;
if((_info select _c)=="FALSE")then{dmpKnockdownAffectCrew=FALSE};_c=_c+1;
_delay=_info select _c;_c=_c+1;
dmpKnockdownDebug=FALSE;
if((_info select _c)=="TRUE")then{dmpKnockdownDebug=TRUE};_c=_c+1;
if!(isServer)exitWith{};
if(dmpKnockdownDebug)then{systemChat"DMP Knockdown is active"};

_units=[];
_registered=[];
while{TRUE}do{
	_units=allUnits;
	_units=_units-_registered;
	{if(isPlayer _x)then{_units=_units-[_x]}}forEach _units;
	{if((toUpper(typeOf _x))in dmpSpookClasses)then{_units=_units-[_x];_registered pushBack _x}}forEach _units;
	{_x addMPEventHandler["mpHit",{_this execVM"DMP\Scripts\Knockdown\Hit.sqf"}];_registered pushBack _x}forEach _units;
	if(_delay<1)exitWith{};
	sleep _delay;
};