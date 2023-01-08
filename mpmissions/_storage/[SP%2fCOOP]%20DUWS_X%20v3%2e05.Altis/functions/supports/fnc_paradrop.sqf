_target = _this select 0;
_cost = _this select 1;
_location = getpos _target;

if (commandpointsblu1 < _cost) exitWith  
{
  ["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
};
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

hint localize "STR_DUWS_X_r8ubc9jy";

// SEND A PLANE
_group = "";
_vehicle = "";

// FIND A RANDOM LOCATION
_spawnPos = _location;
_vec =[random [-1,0,1], random [-1,0,1], 0];
_dist = 3100;
_spawnPos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _spawnPos;
_grouptype = "";
onStation = false;

switch (VERSION_X) do {
	case "MODERN": {
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2)+400];
		_grouptype = [blufor_HELI_TRANS_UNARM_X];
		//_grouptype = ["O_Heli_Light_02_unarmed_F"];
	};
	case "WW2": {
		_spawnPos = [_spawnPos select 0, (_spawnPos select 1)-_dist, (_spawnPos select 2)+800];
		_grouptype = [blufor_PLANE_SUPP_X];
	};
	case "VIETNAM": {
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2)+300];
		_grouptype = [blufor_HELI_TRANS_UNARM_X];
	};
};

_group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
_pilot = units _group select 0;
_vehicle = vehicle _pilot;
_vehicle setVehicleAmmo 0;
_vehicle allowdamage false;
_vehicle engineOn true;

switch (VERSION_X) do {
	case "MODERN": {
		_vehicle flyInHeight 250;
	};
	case "WW2": {
		_vehicle setVelocity [250,0,0];
		_vehicle flyInHeight 300;
	};
	case "VIETNAM": {
		_vehicle flyInHeight 250;
	};
};
	
_wp1 = _group addWaypoint [_location, -1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointStatements ["true", "onStation = true"]; 
_wp2 = _group addWaypoint [[0,0], 100];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";

hint localize "STR_DUWS_X_5iciamva";
sleep 40;
hint localize "STR_DUWS_X_o4p4grm4";
waitUntil {sleep 0.1;onStation||!alive _vehicle};

if (!alive _vehicle) exitWith {hint localize "STR_DUWS_X_2bwz0z4w"};

_group2 = creategroup WEST;
_radius = 130;
_group2 deleteGroupWhenEmpty true;

private ["_soldier1","_soldier2","_soldier3","_soldier4","_soldier5","_soldier6","_soldier7","_soldier8"];
switch (VERSION_X) do {
	case "MODERN": {
		_soldier1 = _group2 createUnit [blufor_SOLDIER_X,[0,0,0],[],0,"form"];
		_soldier2 = _group2 createUnit [blufor_SOLDIER_LAT_X,[0,0,0],[],0,"form"];
		_soldier3 = _group2 createUnit [blufor_SOLDIER_GL_X,[0,0,0],[],0,"form"];
		_soldier4 = _group2 createUnit [blufor_SPECOPS_ENG_X,[0,0,0],[],0,"form"];
		_soldier5 = _group2 createUnit [blufor_SOLDIER_AR_X,[0,0,0],[],0,"form"];
		_soldier6 = _group2 createUnit [blufor_SOLDIER_X,[0,0,0],[],0,"form"];
		_soldier7 = _group2 createUnit [blufor_SPECOPS_MEDIC_X,[0,0,0],[],0,"form"];
		_soldier8 = _group2 createUnit [blufor_SOLDIER_AR_X,[0,0,0],[],0,"form"];
	};
	case "WW2": {
		_soldier1 = _group2 createUnit [blufor_PARA_TL_X,[0,0,0],[],0,"form"];
		_soldier2 = _group2 createUnit [blufor_PARA_RAD_X,[0,0,0],[],0,"form"];
		_soldier3 = _group2 createUnit [blufor_PARA_MED_X,[0,0,0],[],0,"form"];
		_soldier4 = _group2 createUnit [blufor_PARA_GL_X,[0,0,0],[],0,"form"];
		_soldier5 = _group2 createUnit [blufor_PARA_X,[0,0,0],[],0,"form"];
		_soldier6 = _group2 createUnit [blufor_PARA_AR_X,[0,0,0],[],0,"form"];
		_soldier7 = _group2 createUnit [blufor_PARA_AT_X,[0,0,0],[],0,"form"];
		_soldier8 = _group2 createUnit [blufor_PARA_AT_X,[0,0,0],[],0,"form"];
	};
	case "VIETNAM": {
		_soldier1 = _group2 createUnit [blufor_SOLDIER_X,[0,0,0],[],0,"form"];
		_soldier2 = _group2 createUnit [blufor_SOLDIER_LAT_X,[0,0,0],[],0,"form"];
		_soldier3 = _group2 createUnit [blufor_SOLDIER_GL_X,[0,0,0],[],0,"form"];
		_soldier4 = _group2 createUnit [blufor_SPECOPS_ENG_X,[0,0,0],[],0,"form"];
		_soldier5 = _group2 createUnit [blufor_SOLDIER_AR_X,[0,0,0],[],0,"form"];
		_soldier6 = _group2 createUnit [blufor_SOLDIER_X,[0,0,0],[],0,"form"];
		_soldier7 = _group2 createUnit [blufor_SPECOPS_MEDIC_X,[0,0,0],[],0,"form"];
		_soldier8 = _group2 createUnit [blufor_SOLDIER_AR_X,[0,0,0],[],0,"form"];
	};
};

_lz = _location;
_parachute1 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute1 setPos [_lz select 0, _lz select 1, (_lz select 2)+150];
_soldier1 moveindriver _parachute1;
if (player_fatigue == 0) then {_soldier1 enablefatigue false;};

_parachute2 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute2 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier2 moveindriver _parachute2;
if (player_fatigue == 0) then {_soldier2 enablefatigue false;};

_parachute3 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute3 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier3 moveindriver _parachute3;
if (player_fatigue == 0) then {_soldier3 enablefatigue false;};

_parachute4 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute4 setPos [_lz select 0, _lz select 1, (_lz select 2)+150];
_soldier4 moveindriver _parachute4;
if (player_fatigue == 0) then {_soldier4 enablefatigue false;};

_parachute5 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute5 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier5 moveindriver _parachute5;
if (player_fatigue == 0) then {_soldier5 enablefatigue false;};

_parachute6 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute6 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier6 moveindriver _parachute6;
if (player_fatigue == 0) then {_soldier6 enablefatigue false;};

_parachute7 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute7 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier7 moveindriver _parachute7;
if (player_fatigue == 0) then {_soldier7 enablefatigue false;};

_parachute8 = "Steerable_Parachute_F" CreateVehicle _lz;  
_parachute8 setPos [(_lz select 0)+(random _radius)-(random _radius), (_lz select 1)+(random _radius)-(random _radius), (_lz select 2)+150];
_soldier8 moveindriver _parachute8;
if (player_fatigue == 0) then {_soldier8 enablefatigue false;};

hint localize "STR_DUWS_X_zm99dbgu";

sleep 5;

{[_x] joinSilent player} forEach units _group2;
hint localize "STR_DUWS_X_0xtit0ht";

["info",[localize "STR_DUWS_X_4i4h6z3t",localize "STR_DUWS_X_0xtit0ht"]] call bis_fnc_showNotification;

//DELETE THE PLANE
sleep 60;
{
	deleteVehicle _x;
} foreach units _group;

deleteVehicle _vehicle;

