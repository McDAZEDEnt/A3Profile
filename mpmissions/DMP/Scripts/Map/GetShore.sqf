// Find the closest land to a position in water
private["_pos","_pos2","_maxDist"];
_pos=_this;
_maxDist=50;
if((count _pos)<3)then{_pos pushBack 0};
while{true}do{
	_pos2=[_pos,1,_maxDist,0,0,1,0]call BIS_fnc_findSafePos;
	if((_pos distance2D _pos2)<1000)exitWith{};
	_maxDist=_maxDist+50;
};
_pos2=[_pos2 select 0,_pos2 select 1,0];
_pos2