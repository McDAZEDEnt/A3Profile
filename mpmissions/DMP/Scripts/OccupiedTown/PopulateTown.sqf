private["_info","_unitTypes","_script","_c","_factionName","_chanceFactionPresent","_chanceFactionDead","_sideT","_side","_scriptMen","_scriptVehicles","_squadSize","_vehicleSize","_spawnInfo","_a","_countPatrols","_countPatrolsDeep","_countPatrolsVehicle","_countRoadblocks","_countGarrisons","_countCamps","_countHelos","_countPlanes","_countDrones","_countOccupiedTowns","_countStatics","_pos","_roads","_road","_minimumDistance","_safePos","_count","_tries","_towns","_town","_patrols","_garrisons","_vehicles","_statics","_HVTs","_occupiedPatrols","_occupiedGarrisons","_occupiedVehicles","_occupiedStatics","_ccupiedHVTchance","_useAI","_passengerChance","_passengerCount","_passengerJoin","_countCompounds","_spawnDelay","_secondsBetweenSpawns"];
//if(dmpDebug)then{systemChat"Populate Map FACTION..."};
_info=_this select 0;
_unitTypes=_this select 1;
_pos=_this select 2;
_script="DMP\Scripts\Spawn\Spawn.sqf";

_c=0;
_factionName=_info select _c;_c=_c+1;
_sideT=_info select _c;_c=_c+1;
_side=EAST;
if(_sideT=="WEST")then{_side=WEST};
if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
if(_sideT=="RANDOM")then{_side=selectRandom[WEST,EAST,RESISTANCE]};
_useAI=TRUE;
if((_info select _c)=="FALSE")then{_useAI=FALSE};_c=_c+1;
_chanceFactionPresent=_info select _c;_c=_c+1;
if((random 100)>_chanceFactionPresent)exitWith{if(dmpDebug)then{systemChat format["OCCUPIED TOWN: %1 NOT PRESENT",_factionName]}};
if(dmpDebug)then{systemChat format["OCCUPIED TOWN: %1",_factionName]};

_c=24; // dmpFactionOccupiedTownPatrols
_occupiedPatrols=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_occupiedGarrisons=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_occupiedVehicles=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_occupiedStatics=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_occupiedHVTchance=_info select _c;_c=_c+1;

//_spawnInfo=[_factionName,_side,_useAI,_chanceGroupDead,_scriptMen,_scriptVehicles,_squadSize,_vehicleSize,_passengerChance,_passengerCount,_passengerJoin,_spawnDelay,_secondsBetweenSpawns,_unitTypes];

//hintc format["%1",_info];sleep .3;

_spawnInfo=[_info,_unitTypes]call dmp_fnc_GetFactionInfo;

//hintc format["%1",_spawnInfo];sleep .3;

dmpOccupiedTowns pushBack[_side,_pos];
_patrols=_occupiedPatrols call BIS_fnc_randomInt;
_garrisons=_occupiedGarrisons call BIS_fnc_randomInt;
_vehicles=_occupiedVehicles call BIS_fnc_randomInt;
_statics=_occupiedStatics call BIS_fnc_randomInt;
_HVTs=0;
if((random 100)<_occupiedHVTchance)then{_HVTs=1};
_spawnDelay=_info select 32;
sleep _spawnDelay;
[_pos,_patrols,_garrisons,_vehicles,_statics,_HVTs,_spawnInfo]execVM"DMP\Scripts\Spawn\SpawnTown.sqf";

if(dmpDebug)then{systemChat format["OCCUPIED TOWN: %1 DONE",_factionName]};