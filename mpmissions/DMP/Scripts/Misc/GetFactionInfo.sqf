private["_info","_unitTypes","_c","_a","_factionName","_sideT","_side","_useAI","_chanceFactionPresent","_chanceFactionDead","_chanceGroupDead","_scriptMen","_scriptVehicles","_squadSize","_vehicleSize","_passengerChance","_passengerCount","_passengerJoin","_countCompounds","_spawnDelay","_secondsBetweenSpawns","_spawnInfo"];
_info=_this select 0;
_unitTypes=_this select 1;
_c=0;
_a=[];
_factionName=_info select _c;_c=_c+1;
_sideT=_info select _c;_c=_c+1;
_side=EAST;
if(_sideT=="WEST")then{_side=WEST};
if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
if(_sideT=="RANDOM")then{_side=selectRandom[WEST,EAST,RESISTANCE]};
_useAI=TRUE;
if((_info select _c)=="FALSE")then{_useAI=FALSE};_c=_c+1;
_chanceFactionPresent=_info select _c;_c=_c+1;
_chanceFactionDead=_info select _c;_c=_c+1;
_chanceGroupDead=_info select _c;_c=_c+1;
if((random 100)<=_chanceFactionDead)then{_chanceGroupDead=101};
_scriptMen=_info select _c;_c=_c+1;
_scriptVehicles=_info select _c;_c=_c+1;
//_squadSize=parseSimpleArray(_info select _c);_c=_c+1;
//_vehicleSize=parseSimpleArray(_info select _c);_c=_c+1;
_squadSize=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_vehicleSize=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;

//_c=_c+16;
_c=29;
// Note: You will also need to edit Defend, Occupied town and AAA if you change the value of _c

_passengerChance=_info select _c;_c=_c+1;
//_passengerCount=parseSimpleArray(_info select _c);
_passengerCount=(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_passengerJoin=_info select _c;_c=_c+1;
_spawnDelay=0;
_secondsBetweenSpawns=0;
_spawnInfo=[_factionName,_side,_useAI,_chanceGroupDead,_scriptMen,_scriptVehicles,_squadSize,_vehicleSize,_passengerChance,_passengerCount,_passengerJoin,_spawnDelay,_secondsBetweenSpawns,_unitTypes];
_spawnInfo