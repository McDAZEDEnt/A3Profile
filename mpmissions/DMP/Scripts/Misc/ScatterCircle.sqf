private["_pos","_pos2","_size","_allowWater","_x","_y","_z"];
_pos=_this select 0;
_size=_this select 1;
_allowWater=FALSE;
_pos2=[];
if((count _this)>2)then{_allowWater=_this select 2};
if(_size<.1)then{_size=.1};
if((count _pos)<3)then{_pos pushBack 0};
if(_allowWater)then{_pos2=[[[_pos,_size]],[]]call BIS_fnc_randomPos}else{_pos2=[[[_pos,_size]],["water"]]call BIS_fnc_randomPos};
if(((_pos2 select 0)+(_pos2 select 1))==0)then{_pos2=_pos};
_x=_pos2 select 0;
_y=_pos2 select 1;
if(_x<0)then{_x=0};
if(_y<0)then{_y=0};
if(_x>dmpMapSize)then{_x=dmpMapSize};
if(_y>dmpMapSize)then{_y=dmpMapSize};
//[_x,_y,_pos select 2]
//_z=getTerrainHeightASL[_x,_y];
//if(_z<0)then{_z=0};
[_x,_y,0]