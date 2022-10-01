private["_count","_countHelos","_countPlanes","_script","_carTypes","_heloTypes","_planeTypes","_manTypes","_pos","_vehicle","_group","_man","_towns","_town","_roads","_roads","_pos2","_manCount"];
if!(isServer)exitWith{};
_count=_this select 0;
_script=_this select 1;

_vehicleTypes=[];
_manTypes=[];
while{((count dmpTypesCivilian)==0)}do{sleep .3};
while{((count dmpTypesCivilianCar)==0)}do{sleep .3};
_manTypes=dmpTypesCivilian;
_carTypes=dmpTypesCivilianCar;
//_heloTypes=dmpTypesCivilianHelo;
//_planeTypes=dmpTypesCivilianPlane;
_pos=[];
_pos2=[];
_vehicle=objNull;
_group=grpNull;
_man=objNull;
_manCount=0;
//_roads=[];
//_road=objNull;
sleep 3;
if((count dmpCompounds)==0)exitWith{};
_towns=dmpCompounds;
//_town=_towns select 0;
while{(_count>0)}do{
	//_pos=getPos(selectRandom dmpLocations);
	if((count _towns)<1)then{_towns=dmpCompounds};
	_pos=(selectRandom _towns);
	_towns=_towns-[_pos];
	if(_pos call dmp_fnc_BlacklistCheck)then{
		_group=createGroup CIVILIAN;
		_manCount=[2,9]call BIS_fnc_RandomInt;
		while{(_manCount>0)}do{
			_type=selectRandom _manTypes;
			_type createunit[_pos,_group,"",1,"Private"];
			_manCount=_manCount-1;
		};
		//[_group,200]execVM"DMP\Scripts\AI\Garrison.sqf";
		[_group,200]execVM"DMP\Scripts\CivilianS\Garrison.sqf";
		if(dmpDebug)then{[_group,"COMPOUND"]execVM"DMP\Scripts\AI\Track.sqf"};
		if!(_script=="")then{{_x execVM _script}forEach units _group};
		{_x execVM"DMP\Scripts\Civilians\PrepCiv.sqf"}forEach units _group;
		{_x setVariable["dmpAItype","CivilianGarrison",TRUE]}forEach units _group;
		// Cars
		_manCount=0;
		if((random 10)>5)then{_manCount=1};
		while{(_manCount>0)}do{
			_pos2=[_pos,0,70,0,0,1,0]call BIS_fnc_findSafePos;
			_vehicle=(selectRandom _carTypes)createVehicle _pos2;
			_vehicle setVariable["dmpAItype","CivilianCar",TRUE];
			_vehicle setDir(random 360);
			_manCount=_manCount-1;
		};
	};
	_count=_count-1;
	sleep .3;
};
