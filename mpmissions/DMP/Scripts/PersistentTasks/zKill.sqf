private["_units","_text","_pos","_cycles","_target","_taskName","_marker","_script","_taskInfo"];
_units=_this select 0;
_pos=_this select 1;
_text=_this select 2;
_script=_this select 3;
_goCodeIn=_this select 4;
_goCodeOut=_this select 5;

// PT code
_code=_this select 6;

if((count _units)==0)exitWith{};
while{TRUE}do{if!(isNil"dmpMissionsReady")exitWith{};sleep 1};sleep .5;while{TRUE}do{if(dmpMissionsReady)exitWith{};sleep 1};

//_pos=[];
_cycles=10;
{dmpMissionObjectives pushBack _x}forEach _units;
_target=_units select 0;

if!(_goCodeIn=="")then{
	while{TRUE}do{
		sleep 1;
		if(_goCodeIn in dmpGoCodes)exitWith{};
	};
};

//dmpVPtarget=dmpVPtarget+1;
_taskName=format["dmpTask%1%2%3",_text,serverTime,_target];
//_pos=[(getPos _target),dmpMissionScatter]call dmp_fnc_ScatterCircle;
_pos=[_pos,dmpMissionScatter]call dmp_fnc_ScatterCircle;
_marker="";
if(dmpUseMissionMarkers)then{_marker=[_pos,"KILL",_text]call dmp_fnc_MissionMarker};
_taskInfo=[TRUE,[_taskName],[_text,_text,"kill"],_pos,"Assigned",1,dmpTaskNotication,"kill",FALSE];
_taskInfo call BIS_fnc_taskCreate;
dmpAllTasks pushBack _taskInfo;
while{TRUE}do{
	{if((getDammage _x)>.8)then{_units=_units-[_x]}}forEach _units;
	if((count _units)<1)exitWith{};
	if(_cycles<1)then{
		if((_pos distance2D(getPos _target))>200)then{
			[_taskName,(getPos _target)]call BIS_fnc_taskSetDestination;
			_pos=getPos _target;
			if(dmpUseMissionMarkers)then{_marker setMarkerPos _pos};
			_cycles=10;
		};
	};
	_cycles=_cycles-1;
	sleep 5;
};
[_taskName,"SUCCEEDED",TRUE]call BIS_fnc_taskSetState;


///////////////

{
_task=_x;
if((_task select 0)==_code)exitWith{_found=TRUE};
}forEach dmpPersistentTasks;

///////////////

//dmpVP=dmpVP+1;
dmpCVP=dmpCVP+dmpCVPmission;
if(dmpUseMissionMarkers)then{deleteMarker _marker};
if!(_script=="")then{execVM _script};
sleep 1;dmpAllTasks=dmpAllTasks-[_taskInfo];publicVariable"dmpAllTasks";
if!(_goCodeOut=="")then{dmpGoCodes pushBack _goCodeOut;publicVariable"dmpGoCodes"};