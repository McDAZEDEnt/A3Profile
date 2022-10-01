private["_pos","_info","_c","_text","_factionName","_generateSpawns","_radius","_maxGroups","_delayBeforeStart","_vehicleChance","_killTarget","_timeTarget","_pos","_radius","_marker","_markerName","_angle","_pos2","_roads","_spawnPoints","_factionInfo","_unitTypes","_c","_a","_factionName","_sideT","_side","_useAI","_chanceFactionPresent","_chanceFactionDead","_chanceGroupDead","_scriptMen","_scriptVehicles","_squadSize","_vehicleSize","_passengerChance","_passengerCount","_passengerJoin","_spawnDelay","_secondsBetweenSpawns","_spawnInfo","_script","_goCodeIn","_goCodeOut"];
_pos=_this select 0;_info=_this select 1;
if!((count(entities"DMP_MissionGenerator"))>0)exitWith{hint"DMP Defend module requires a DMP Mission Generator module to be placed"};
_c=0;
_text=_info select _c;_c=_c+1;
_factionName=_info select _c;_c=_c+1;
_generateSpawns=TRUE;
if((_info select _c)=="FALSE")then{_generateSpawns=FALSE};_c=_c+1;
_radius=_info select _c;_c=_c+1;
_maxGroups=_info select _c;_c=_c+1;
_delayBeforeStart=_info select _c;_c=_c+1;
_vehicleChance=_info select _c;_c=_c+1;
_killTarget=_info select _c;_c=_c+1;
_timeTarget=_info select _c;_c=_c+1;
_script=_info select _c;_c=_c+1;
_goCodeIn=_info select _c;_c=_c+1;
_goCodeOut=_info select _c;_c=_c+1;

//hintC format["1: _info: %1\n\n_goCodeIn: %2",_info,_goCodeIn];sleep .1;

sleep _delayBeforeStart;

_marker="";
_markerName="";
_angle=0;
_pos2=[];
_roads=[];
_spawnPoints=[];

{
if((_x distance2D _pos)<_radius)then{
	_pos2=getPos _x;
	_marker=createMarkerLocal[(format["dmpDefence_%1%2",_pos2,_x]),_pos2];
	_marker setMarkerAlphaLocal 0;
	_spawnPoints pushback _marker;
	_marker setMarkerDirLocal(_pos2 getDir _pos);
	_marker setMarkerTypeLocal"mil_arrow";
	_marker setMarkerColorlocal"ColorRED";
	sleep .1;
}else{if(dmpDebug)then{systemChat"Defend Spawnpoint module rejected (too far from Defend module)"}};
}forEach(entities"DMP_DefendSpawnpoint");

if((count _spawnPoints)==0)then{_generateSpawns=TRUE};

while{_generateSpawns}do{
	_pos2=[_pos,_radius,_angle]call BIS_fnc_relPos;
	if!(surfaceIsWater _pos2)then{
		_pos2=[_pos2,0,100,0,0,1,0]call BIS_fnc_findSafePos;
		_roads=_pos2 nearRoads 100;
		if((count _roads)>0)then{_pos2=getPos(_roads select 0)};
		_marker=createMarkerLocal[(format["dmpDefence_%1%2",_angle,_pos2]),_pos2];
		_marker setMarkerAlphaLocal 0;
		_spawnPoints pushback _marker;
		_marker setMarkerDirLocal(_angle+180);
		_marker setMarkerTypeLocal"mil_arrow";
		_marker setMarkerColorlocal"ColorRED";
	};
	sleep .1;
	_angle=_angle+45;
	if(_angle>359)exitWith{};
};

if(dmpDebug)then{{_x setMarkerAlpha 1}forEach _spawnPoints};
if((count _spawnPoints)==0)exitWith{hint"DMP Defend Error: No spawn points could be created"};
sleep 1;

_factionInfo=[];
_unitTypes=[];
while{TRUE}do{
	{if(((_x select 0)select 0)==_factionName)exitWith{_factionInfo=_x select 0;_unitTypes=_x select 1}}forEach dmpAllFactions;
	if((count _factionInfo)>0)exitWith{};
	sleep 1;
};
sleep 1;

_c=0;
_a=[];
_factionName=_factionInfo select _c;_c=_c+1;
_sideT=_factionInfo select _c;_c=_c+1;
_side=EAST;
if(_sideT=="WEST")then{_side=WEST};
if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
if(_sideT=="RANDOM")then{_side=selectRandom[WEST,EAST,RESISTANCE]};
_useAI=TRUE;
if((_factionInfo select _c)=="FALSE")then{_useAI=FALSE};_c=_c+1;
_chanceFactionPresent=_factionInfo select _c;_c=_c+1;
if((random 100)>_chanceFactionPresent)exitWith{if(dmpDebug)then{systemChat format["DEFEND FROM: %1 NOT PRESENT",_factionName]}};
_chanceFactionDead=_factionInfo select _c;_c=_c+1;
_chanceGroupDead=_factionInfo select _c;_c=_c+1;
if(dmpDebug)then{systemChat format["DEFEND FROM: %1",_factionName]};
if((random 100)<=_chanceFactionDead)then{_chanceGroupDead=101};

//_spawnInfo=[_factionName,_side,_useAI,_chanceGroupDead,_scriptMen,_scriptVehicles,_squadSize,_vehicleSize,_passengerChance,_passengerCount,_passengerJoin,_spawnDelay,_secondsBetweenSpawns,_unitTypes];

_spawnInfo=[_factionInfo,_unitTypes]call dmp_fnc_GetFactionInfo;

if!(call dmp_fnc_Proceed)exitWith{};

[_pos,_info,_spawnInfo,_spawnPoints]execVM"DMP\Scripts\Defend\MasterSpawn.sqf";