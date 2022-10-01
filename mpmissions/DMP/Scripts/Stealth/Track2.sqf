private["_group","_class","_pos","_o"];
_group=_this;
_class="Sign_Arrow_F";
_pos=[0,0,0];
_o=createSimpleObject[_class,_pos,FALSE];
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	if((behaviour(leader _group))=="SAFE")exitWith{_group execVM"DMP\Scripts\Stealth\Track.sqf"};
	_pos=getPosATL(leader _group);
	_pos=[_pos select 0,_pos select 1,((_pos select 2)+2.5)];
	_o setPosATL _pos;
	sleep .1;
};
deleteVehicle _o;