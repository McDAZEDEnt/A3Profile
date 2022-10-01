private["_pos","_info","_spawnInfo","_spawnPoints","_c","_factionName","_radius","_maxGroups","_delayBeforeStart","_vehicleChance","_killTarget","_timeTarget","_text","_taskName","_type","_pos2","_victory","_script","_taskInfo","_goCodeIn","_goCodeOut"];
if(dmpDebug)then{systemChat "Generating spawn points"};
_pos=_this select 0;
_info=_this select 1;
_spawnInfo=_this select 2;
_spawnPoints=_this select 3;

_c=0;
_text=_info select _c;_c=_c+1;
_factionName=_info select _c;_c=_c+1;
// Generate spawnpoints
_c=_c+1;
_radius=_info select _c;_c=_c+1;
_maxGroups=_info select _c;_c=_c+1;
_delayBeforeStart=_info select _c;_c=_c+1;
_vehicleChance=_info select _c;_c=_c+1;
_killTarget=_info select _c;_c=_c+1;
_timeTarget=_info select _c;_c=_c+1;
_script=_info select _c;_c=_c+1;
_goCodeIn=_info select _c;_c=_c+1;
_goCodeOut=_info select _c;_c=_c+1;

//hintC format["2: _info: %1\n\n_goCodeIn: %2",_info,_goCodeIn];sleep .1;

if!(_goCodeIn=="")then{
	while{TRUE}do{
		sleep 1;
		if(_goCodeIn in dmpGoCodes)exitWith{};
	};
};

if(count(entities"NR6_HAL_Core_Module")>0)then{_pos execVM"DMP\Scripts\Missions\HALobjective.sqf"};

_timeTarget=(_timeTarget*60)+SERVERTIME;
_side=_spawnInfo select 1;

dmpVPtarget=dmpVPtarget+1;
//_text="Defend";
_pos=_pos call dmp_fnc_GroundPos;
_taskName=format["dmpTask%1%2%3",_text,_pos,time];
//[_taskName,TRUE,[_text,_text,"defend"],_pos,"Assigned",0,TRUE,TRUE,"defend",FALSE]call BIS_fnc_setTask;
_taskInfo=[TRUE,[_taskName],[_text,_text,"defend"],_pos,"Assigned",1,TRUE,"defend",FALSE];
_taskInfo call BIS_fnc_taskCreate;
dmpAllTasks pushBack _taskInfo;
//sleep _delayBeforeStart;

_type="";
_pos2=[];
_victory=FALSE;
_groups=[];
_count=0;
while{TRUE}do{
	_groups=[_side,["Attack","AttackV"],_pos,_radius]call dmp_fnc_GroupsBySideType;
	_count=_maxGroups-(count _groups);
	while{_count>0}do{
		_pos2=getMarkerPos(selectRandom _spawnPoints);
		_type="Attack";
		if((random 100)<_vehicleChance)then{_type="AttackV"};
		[_pos2,_pos,_type,_spawnInfo]execVM"DMP\Scripts\Spawn\Spawn.sqf";
		_count=_count-1;
		sleep 1;
	};
	if(TIME>_timeTarget)exitWith{_victory=TRUE};
	if(dmpDefendKills>=_killTarget)exitWith{_victory=TRUE};
	sleep 30;
};

if(_victory)then{
	[_taskName,"SUCCEEDED",TRUE]call BIS_fnc_taskSetState;
	dmpVP=dmpVP+1;
	sleep 1;dmpAllTasks=dmpAllTasks-[_taskInfo];publicVariable"dmpAllTasks";
	if!(_goCodeOut=="")then{dmpGoCodes pushBack _goCodeOut;publicVariable"dmpGoCodes"};
	{_group=_x;if!(((leader _group)getVariable"dmpAItype")in["Attack","AttackV"])then{{_x allowFleeing 1}forEach units _group}}forEach allUnits;
};

if!(_script=="")then{execVM _script};