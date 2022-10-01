private["_pos","_sideT","_side","_name","_radius","_show","_text","_taskName","_unitsF","_unitsH","_clear","_marker","_script","_taskInfo","_goCodeIn","_goCodeOut","_fail"];
_pos=_this select 0;
_sideT=_this select 1;
_name=_this select 2;
_radius=_this select 3;
_time=_this select 4;
_show=TRUE;if((_this select 5)=="FALSE")then{_show=FALSE};
_script=_this select 6;
_goCodeIn=_this select 7;
_goCodeOut=_this select 8;

_side=EAST;if(_sideT=="WEST")then{_side=WEST};if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
_text="";
_taskName="";
_unitsF=[];
_unitsH=[];
_clear=FALSE;
_time=(_time*60)+TIME;

if!(_goCodeIn=="")then{
	while{TRUE}do{
		sleep 1;
		if(_goCodeIn in dmpGoCodes)exitWith{};
	};
};

if(count(entities"NR6_HAL_Core_Module")>0)then{_pos execVM"DMP\Scripts\Missions\HALobjective.sqf"};

dmpVPtarget=dmpVPtarget+1;
//dmpFailLimit=dmpFailLimit+1;
_marker="";
if(_show)then{
	_marker=createMarkerLocal[(format["%1%2",_pos,_name]),_pos];
	_marker setMarkerAlphaLocal 0;
	_marker setMarkerShapeLocal"ELLIPSE";
	_marker setMarkerBrushLocal"Border";
	_marker setMarkerColorLocal"colorRED";
	_marker setMarkerSize[_radius,_radius];
	_marker setMarkerAlpha 1;
};

_text=format["%1",_name];
_taskName=format["dmpTask%1%2",_text,_pos];
_taskInfo=[TRUE,[_taskName],[_text,_text,"defend"],_pos,"Assigned",1,TRUE,"defend",FALSE];
_taskInfo call BIS_fnc_taskCreate;
dmpAllTasks pushBack _taskInfo;
_marker2="";
if(dmpUseMissionMarkers)then{_marker2=[_pos,"HOLD",""]call dmp_fnc_MissionMarker};
sleep 3;

// Wait for spawning to finish
sleep 60;
dmpDFCdefendBreakpoint=floor(dmpDFCenemyCount*(dmpDFCdefendBreakpoint/100));

_fail=FALSE;
while{TRUE}do{
	_unitsF=[];
	_unitsH=[];
	_clear=FALSE;
	{if((side _x)==_side)then{_unitsF pushBack _x}else{_unitsH pushBack _x}}forEach([_pos,["Man","LandVehicle"],_radius]call dmp_fnc_GetUnits);
	if((count _unitsF)<1)then{
		_clear=FALSE;
		{
		if([_side,side _x]call BIS_fnc_sideIsEnemy)exitWith{_clear=TRUE};
		}forEach _unitsH;
		sleep .2;
	};
	if(_clear)exitWith{_fail=TRUE};
	if(TIME>_time)exitWith{_fail=FALSE};
	if(dmpDFCenemyBroken)exitWith{_fail=FALSE};
	sleep 10;
};

if(_fail)then{
	[_taskName,"FAILED",TRUE]call BIS_fnc_taskSetState;
	dmpFailPoints=dmpFailPoints+1;
	dmpVP=-1;
	dmpCVP=dmpCVP-dmpCVPmission;
}else{
	[_taskName,"SUCCEEDED",TRUE]call BIS_fnc_taskSetState;
	dmpVP=dmpVP+1;
	dmpCVP=dmpCVP+dmpCVPmission;
};

if(_show)then{deleteMarker _marker};
if(dmpUseMissionMarkers)then{deleteMarker _marker2};
if!(_script=="")then{execVM _script};
sleep 1;dmpAllTasks=dmpAllTasks-[_taskInfo];publicVariable"dmpAllTasks";
if!(_goCodeOut=="")then{dmpGoCodes pushBack _goCodeOut;publicVariable"dmpGoCodes"};