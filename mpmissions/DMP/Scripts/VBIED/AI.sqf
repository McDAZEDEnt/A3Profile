private["_pos","_side","_activationDistance","_driverTypes","_vehicleTypes","_power","_bombType","_vehicle","_group","_driver","_c","_bomb","_triggerDistance","_targets","_b","_explode","_sleep"];

_pos=_this select 0;
_side=_this select 1;
_activationDistance=_this select 2;
_triggerDistance=_this select 3;
_driverTypes=_this select 4;
_vehicleTypes=_this select 5;
_power=_this select 6;
_bombType="Bomb_03_F";if(_power=="HUGE")then{_bombType="dmp_VBIED_huge"};

_driver=objNull;
_vehicle=objNull;
_group=grpNull;
if((count _this)>7)then{_driver=_this select 7;_group=group _driver}else{
	_vehicle=(selectRandom _vehicleTypes)createVehicle _pos;
	_group=createGroup _side;
	(selectRandom _driverTypes)createunit[_pos,_group,"",1,"COLONEL"];
	sleep 1;
	_driver=(units _group)select 0;
	sleep .2;
	_driver assignAsDriver _vehicle;
	sleep .2;
	_driver moveInDriver _vehicle;
	_vehicle setDir(random 360);				
};

{_x allowFleeing 0;_x disableAI"SUPPRESSION";_x disableAI"COVER";_x disableAI"AUTOCOMBAT";_x disableAI"MINEDETECTION"}forEach units _group;
_group setCombatMode"BLUE";
_group setBehaviour"CARELESS";
_group setSpeedMode"FULL";

_driver setSkill 1;

//_triggerDistance=20;
_vehicle=vehicle _driver;

_driver setVariable["dmpAItype","VBIEDdriver",TRUE];
_vehicle setVariable["dmpAItype","VBIED",TRUE];

if(dmpDebug)then{[_group,"VBIED"]execVM"DMP\Scripts\AI\Track.sqf"};
_driver allowFleeing 0;
_targets=[];
_b=objNull;
_explode=TRUE;
_sleep=5;
//_targets=_pos nearEntities[["Man","Landvehicle"],_activationDistance];
while{TRUE}do{
	if!(alive _vehicle)exitWith{};
	if!(alive _driver)exitWith{};
	_targets=_driver targets[TRUE,_activationDistance];
	//systemChat format["%1",_targets];
	if((count _targets)>0)then{
		_targets=[_targets,[],{(getPos _vehicle)distance _x},"ASCEND"]call BIS_fnc_sortBy;
		if(((_targets select 0)distance _vehicle)<_triggerDistance)exitWith{_sleep=-1};
		_group move(getPos(_targets select 0));
		_sleep=2;
	};
	if(_sleep<0)exitWith{};
	sleep _sleep;
	_sleep=5;
};
if(_explode)then{_b=_bombType createVehicle(getPos _vehicle);_b setDammage 1};