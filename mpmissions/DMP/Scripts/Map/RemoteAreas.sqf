// Find places far from towns
private["_mainMarker","_size","_posX","_posY","_pos","_marker","_increment","_radius","_radius2","_stage","_locationTypes","_AOpos","_AOsize","_unused"];
_mainMarker=_this select 0;
// Map size
_size=worldSize;
_posX=0;
_posY=0;
_pos=[];
_marker="";
// Space between checks
_increment=dmpRemoteIncrement;
// Size of the area to be checked
// Size of a remote area
_radius=dmpRemoteSize;
// Distance from towns
_radius2=dmpRemoteDistance;
_stage=0;
_locationTypes=dmpLocationTypes;
// All markers that are used for an area check
//dmpRemoteAreas=[];dmpUnusedAreas=[];dmpWaterAreas=[];
//_AOpos=dmpCenter;
_AOpos=getMarkerPos _mainMarker;
_AOsize=dmpRadius;
if((count _this)>1)then{_AOsize=_this select 1};

_unused=TRUE;
while{TRUE}do{
	_unused=TRUE;
	_pos=[_posX,_posY];
	_pos=[_pos select 0,_pos select 1,0];
	if(_pos inArea _mainMarker)then{
		if(_pos call dmp_fnc_BlacklistCheck)then{
			if!(surfaceIsWater _pos)then{
				if((count nearestLocations[_pos,_locationTypes,_radius2])==0)then{
					dmpRemoteAreas pushBack _pos;
					_unused=FALSE;
					if(dmpDebug)then{
						_marker=createMarker[(format["%1%2",time,_pos]),_pos];
						_marker setMarkerAlpha 1;
						_marker setMarkerShape"ELLIPSE";
						_marker setMarkerBrush"SOLID";
						_marker setMarkerColor"colorKHAKI";
						_marker setMarkerSize[_radius,_radius];
						dmpDebugMarkers pushBack _marker;
					};
				};
			}else{
				_pos=[_pos select 0,_pos select 1,0];
				dmpWaterAreas pushBack _pos;
				if(dmpDebug)then{
					_marker=createMarker[(format["%1%2",time,_pos]),_pos];
					_marker setMarkerAlpha .2;
					_marker setMarkerShape"ELLIPSE";
					_marker setMarkerBrush"SOLID";
					_marker setMarkerColor"colorBLUE";
					_marker setMarkerSize[_radius,_radius];
					dmpDebugMarkers pushBack _marker;
				};
			};
		};
	};
	if(_unused)then{dmpUnusedAreas pushback _pos};
	_posX=_posX+_increment;
	if(_posX>(_size+_increment))then{
		_posX=0;
		if(_stage==1)then{_posX=_posX+(_increment/2);_stage=0}else{_stage=1};
		_posY=_posY+_increment;
	};
	if(_posY>_size)exitWith{};		
};