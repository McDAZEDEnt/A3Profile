private["_group","_pos"];
_group=_this select 0;
_pos=_this select 1;
sleep 2;
if(((random 10)>5)AND((count dmpLocations)>0))then{
	_pos=selectRandom dmpLocations;
}else{
	_pos=selectRandom dmpRemoteAreas;
	_pos=[_pos,500]call dmp_fnc_ScatterCircle;
};
_group move _pos;
_group setCombatMode"RED";
_group setBehaviour"SAFE";
_group setFormation"FILE";
while{TRUE}do{
	if({alive _x}count(units _group)==0)exitWith{};
	if(((leader _group)distance2D _pos)<100)then{
		if(((random 10)>5)AND((count dmpLocations)>0))then{
			_pos=selectRandom dmpLocations;
		}else{
			_pos=selectRandom dmpRemoteAreas;
			_pos=[_pos,500]call dmp_fnc_ScatterCircle;
		};
		_group move _pos
	};
	sleep 60;
};