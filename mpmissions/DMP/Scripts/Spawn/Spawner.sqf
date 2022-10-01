private["_pos","_units","_info","_checkUnits","_c","_a","_factionName","_types","_delayBeforeStart","_delay","_waves","_type","_factionInfo","_spawnInfo","_goCode"];
_pos=_this select 0;
_units=_this select 1;
_info=_this select 2;

_checkUnits=FALSE;
if((count _units)>0)then{_checkUnits=TRUE};

_c=0;
_a=[];
_factionName=_info select _c;_c=_c+1;
_types=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_delayBeforeStart=_info select _c;_c=_c+1;
_delay=_info select _c;_c=_c+1;
_waves=_info select _c;_c=_c+1;
_goCode=_this select _c;_c=_c+1;

if!(_goCode=="")then{
	while{TRUE}do{
		sleep 1;
		if(_goCode in dmpGoCodes)exitWith{};
	};
};

_type="";
sleep _delayBeforeStart;

_factionInfo=[];
while{TRUE}do{
	{if(((_x select 0)select 0)==_factionName)exitWith{_factionInfo=_x}}forEach dmpAllFactions;
	if((count _factionInfo)>0)exitWith{};
	sleep 1;
};

_spawnInfo=_factionInfo call dmp_fnc_GetFactionInfo;
sleep .3;
//hintc format["%1",_spawnInfo];

while{_waves>0}do{
	if(_checkUnits)then{
		{if((getDammage _x)>.7)then{_units=_units-[_x]}}forEach _units;
		if((count _units)<1)exitWith{_waves=-1};
	};
	if(_waves<1)exitWith{};
	_type=selectRandom _types;
	if(dmpDebug)then{systemChat format["Spawner: %1",_type]};
	[_pos,_pos,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
	_waves=_waves-1;
	sleep 1;
	sleep _delay;
};