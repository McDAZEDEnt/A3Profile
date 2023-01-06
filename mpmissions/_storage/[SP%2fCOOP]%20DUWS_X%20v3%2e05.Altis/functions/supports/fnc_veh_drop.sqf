_target = _this select 0;
_cost = _this select 1;
_location = getpos _target;

if (commandpointsblu1 < _cost) exitWith  
{
  ["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
};
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

hint localize "STR_DUWS_X_q76uei82";

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

hint localize "STR_DUWS_X_6cwj6h8z";
sleep 40;
hint localize "STR_DUWS_X_9tpm5uf6";
waitUntil {sleep 0.1;onStation||!alive _vehicle};

if (!alive _vehicle) exitWith {hint localize "STR_DUWS_X_7h0bmzi7"};

_parachute = "Steerable_Parachute_F" CreateVehicle _location;
_parachute setPos [_location select 0, _location select 1, (_location select 2)+100];
_cargo = "";
switch (VERSION_X) do {
	case "MODERN": {
		_cargo = CreateVehicle ["I_G_Van_01_transport_F", [_location select 0,_location select 1,(_location select 2)+50], [], 0, "CAN_COLLIDE"];
	};
	case "VIETNAM": {
		_cargo = CreateVehicle ["uns_m37b1", [_location select 0,_location select 1,(_location select 2)+50], [], 0, "CAN_COLLIDE"];
	};
};
_cargo attachTo [_parachute,[0,0,0]];

hint localize "STR_DUWS_X_iv3s5xlc";

waitUntil {sleep 1; getpos _cargo select 2 < 0.2};
_smoke = "SmokeShellGreen" CreateVehicle (getpos _cargo);
["info",[localize "STR_DUWS_X_2oefoo3j",localize "STR_DUWS_X_pvue8vst"]] call bis_fnc_showNotification;

//DELETE THE PLANE
sleep 60;
{
	deleteVehicle _x;
} foreach units _group;

deleteVehicle _vehicle;

