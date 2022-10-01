private["_info","_c","_a","_sideT","_side","_count","_countFake","_pos","_roads","_IED","_IEDtypes","_tries","_triggerDistance","_scatterDistance"];
if!(call dmp_fnc_Proceed)exitWith{};
_info=_this;
_c=0;
_sideT=_info select _c;_c=_c+1;
_side=EAST;
if(_sideT=="WEST")then{_side=WEST};
if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
_a=(_info select _c)call dmp_fnc_ParseArray;_count=_a call BIS_fnc_randomInt;_c=_c+1;
_a=(_info select _c)call dmp_fnc_ParseArray;_countFake=_a call BIS_fnc_randomInt;_c=_c+1;
_triggerDistance=_info select _c;_c=_c+1;
_scatterDistance=_info select _c;_c=_c+1;
dmpIEDtargetMen=TRUE;if((_info select _c)=="FALSE")then{dmpIEDtargetMen=FALSE};_c=_c+1;

_pos=[];
_roads=[];
_IED=objNull;
_IEDtypes=["IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F"];
_tries=0;
while{_count>0}do{
	_tries=10;
	while{_tries>0}do{
		//_pos=selectRandom dmpRemoteAreas;
		//_roads=(_pos nearRoads dmpRemoteSize);
		if((random 10)>5)then{_pos=selectRandom dmpRemoteAreas;_roads=(_pos nearRoads dmpRemoteSize)}
		else{_pos=selectRandom dmpLocations;_roads=(_pos nearRoads 200)};
		if((count _roads)>0)exitWith{
			_pos=getPos(selectRandom _roads);
			if(_pos call dmp_fnc_BlacklistCheck)then{
				_pos=[_pos,_scatterDistance]call dmp_fnc_ScatterCircle;
				//_IED=(selectRandom _IEDtypes)createVehicle _pos;
				_IED=createMine[(selectRandom _IEDtypes),_pos,[],0];
				_IED setPosATL[_pos select 0,_pos select 1,0];
				_IED setDir(random 360);
				//_IED setPos([_pos,_scatterDistance]call dmp_fnc_ScatterCircle);
				[_IED,_side,_triggerDistance]execVM"DMP\Scripts\IED\IED.sqf";
				_tries=0;
			};
		};
		_tries=_tries-1;
		sleep .1;
	};
	_count=_count-1;
	sleep .3;
};

_count=_countFake;
_IEDtypes=["IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F"];
while{_count>0}do{
	_tries=10;
	while{_tries>0}do{
		//_pos=getMarkerPos(selectRandom dmpRemoteAreas);
		//_roads=(_pos nearRoads dmpRemoteSize);
		if((random 10)>5)then{_pos=selectRandom dmpRemoteAreas;_roads=(_pos nearRoads dmpRemoteSize)}
		else{_pos=selectRandom dmpLocations;_roads=(_pos nearRoads 200)};
		if((count _roads)>0)exitWith{
			_pos=getPos(selectRandom _roads);
			if(_pos call dmp_fnc_BlacklistCheck)then{
				_pos=[_pos,_scatterDistance]call dmp_fnc_ScatterCircle;
				_IED=(selectRandom _IEDtypes)createVehicle _pos;
				_IED setPosATL[_pos select 0,_pos select 1,0];
				_IED setDir(random 360);
				//_IED setPos([_pos,_scatterDistance]call dmp_fnc_ScatterCircle);
				_tries=0;
				if(dmpDebug)then{[getPos _IED,(format["FAKE IED: %1",typeOf _IED]),"ColorOrange"]call dmp_fnc_DebugMarker};
			};
		};
		_tries=_tries-1;
		sleep .1;
	};
	_count=_count-1;
	sleep .3;
};