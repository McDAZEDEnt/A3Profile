private["_pos"];
_pos=[];
while{true}do{
	_pos=selectRandom dmpRemoteAreas;
	if(_pos call dmp_fnc_BlacklistCheck)exitWith{};
};
_pos=[_pos,500]call dmp_fnc_ScatterCircle;
_pos