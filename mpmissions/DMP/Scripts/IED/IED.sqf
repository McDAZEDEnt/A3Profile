private["_IED","_side","_triggerDistance","_d","_close","_t","_count","_dummy","_targets"];
_IED=_this select 0;
_side=_this select 1;
_triggerDistance=_this select 2;
_close=FALSE;
_t=[];
_count=0;
_dummy=objNull;

_targets=["Landvehicle"];
if(dmpIEDtargetMen)then{_targets=["Man","Landvehicle"]};

if(dmpDebug)then{[getPos _IED,(format["%1",typeOf _IED]),"ColorRed"]call dmp_fnc_DebugMarker};
while{TRUE}do{
	if!(alive _IED)exitWith{};if(isNull _IED)exitWith{};
	_close=FALSE;
	_t=_IED nearEntities[_targets,300];
	{if!((side _x)==_side)then{_t=_t-[_x]}}forEach _t;
	if((count _t)>0)then{_close=TRUE};
	_count=10;
	// Go into a loop for a tighter check when target side vehicles are close
	while{_close}do{
		_t=_IED nearEntities[_targets,_triggerDistance];
		//systemChat format["1: %1",_t];
		{if!((side _x)==_side)then{_t=_t-[_x]}}forEach _t;
		//systemChat format["2: %1",_t];
		if((count _t)>0)exitWith{_IED setDammage 1};
		_count=_count-1;
		if(_count<1)then{
			_t=_IED nearEntities[_targets,300];
			{if!((side _x)==_side)then{_t=_t-[_x]}}forEach _t;
			if((count _t)==0)then{_close=FALSE};
			_count=10;
		};
		sleep 2;
	};
	if!(alive _IED)exitWith{};if(isNull _IED)exitWith{};
	sleep 10;
};
if!(isNull _dummy)then{deleteVehicle _dummy};