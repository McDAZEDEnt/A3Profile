private["_info","_c","_delay","_cycle","_registered","_waitForFaction"];
_info=[
"FALSE",
0,
"TRUE",
"TRUE",
"FALSE",
"FALSE",
"TRUE",
1000,
1000,
5,
5,
"TRUE"
];

_info=_this;
_c=0;
dmpCacheSides=[];
_delay=_info select _c;_c=_c+1;
_waitForFaction=TRUE;
if((_info select _c)=="FALSE")then{_waitForFaction=FALSE};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpCacheSides pushBack WEST};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpCacheSides pushBack EAST};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpCacheSides pushBack RESISTANCE};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpCacheSides pushBack CIVILIAN};_c=_c+1;
dmpCacheSimulation=TRUE;if((_info select _c)=="FALSE")then{dmpCacheSimulation=FALSE};_c=_c+1;
dmpCacheDistance=_info select _c;_c=_c+1;
dmpCacheDistanceV=_info select _c;_c=_c+1;
dmpCacheCycle=_info select _c;_c=_c+1;
_cycle=_info select _c;_c=_c+1;
dmpDebugCache=FALSE;

if(_waitForFaction)then{
	while{TRUE}do{
		if(dmpFactionReady)exitWith{};
		sleep 1;
	};
};

if((_info select _c)=="TRUE")then{dmpDebugCache=TRUE;execVM"DMP\Scripts\Caching\FPS.sqf"};

dmpAIcache=["TARGET","AUTOTARGET","TEAMSWITCH","FSM","WEAPONAIM","AIMINGERROR","SUPPRESSION","CHECKVISIBLE","COVER","AUTOCOMBAT","PATH","MINEDETECTION","NVG","LIGHTS","RADIOPROTOCOL"];
//"ANIM"

DMP_fnc_CacheGroup=compile preprocessFile"DMP\Scripts\Caching\CacheGroup.sqf";
DMP_fnc_UncacheGroup=compile preprocessFile"DMP\Scripts\Caching\UncacheGroup.sqf";
DMP_fnc_CacheCheck=compile preprocessFile"DMP\Scripts\Caching\CheckGroup.sqf";

sleep _delay;
_registered=[];
while{TRUE}do{
	{[_x]spawn DMP_fnc_CacheCheck;_registered pushBackUnique _x}forEach(allGroups-_registered);
	if(_cycle<1)exitWith{};
	sleep _cycle;
};