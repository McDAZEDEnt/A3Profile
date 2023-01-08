_target = _this select 0;
_cost = _this select 1;
_location = getpos _target;

if (commandpointsblu1 < _cost) exitWith  
{
  ["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
};
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

hint localize "STR_DUWS_X_y91vei53";

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
	case "WW2": {
		_vehicle setVelocity [250,0,0];
		_vehicle flyInHeight 300;
	};
	case "VIETNAM": {
		_vehicle flyInHeight 150;
	};
};
	
_wp1 = _group addWaypoint [_location, -1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointStatements ["true", "onStation = true"]; 
_wp2 = _group addWaypoint [[0,0], 100];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";

hint localize "STR_DUWS_X_17hh9rx4";
sleep 40;
hint localize "STR_DUWS_X_zhiugl0g";
waitUntil {sleep 0.1;onStation||!alive _vehicle};

if (!alive _vehicle) exitWith {hint localize "STR_DUWS_X_trkhanzi"};

_parachute = "Steerable_Parachute_F" CreateVehicle _location;
_parachute setPos [_location select 0, _location select 1, (_location select 2)+100];
_ammobox = "";
switch (VERSION_X) do {
	case "MODERN": {
		_ammobox = CreateVehicle ["O_supplyCrate_F", [_location select 0,_location select 1,(_location select 2)+50], [], 0, "CAN_COLLIDE"];
	};
	case "WW2": {
		_ammobox = CreateVehicle ["WW2_Cle_Container", [_location select 0,_location select 1,(_location select 2)+50], [], 0, "CAN_COLLIDE"];
	};
	case "VIETNAM": {
		_ammobox = CreateVehicle ["C_IDAP_supplyCrate_F", [_location select 0,_location select 1,(_location select 2)+50], [], 0, "CAN_COLLIDE"];
	};
};
_ammobox attachTo [_parachute,[0,0,0]];

hint localize "STR_DUWS_X_wdttb5b8";

waitUntil {sleep 1; getpos _ammobox select 2 < 0.2};

// give ammobox a marker
[getPos _ammobox] spawn {
	_spawnPos = _this select 0;
	_markername = format["lbl%1",_spawnPos]; // Define marker name
	//hint _markername;
	createMarker [_markername, _spawnPos];
	_markername setMarkerShape "ICON";
	_markername setMarkerType "hd_objective";
	_markername setMarkerColor "ColorYellow";
	_markername setMarkerSize [.5,.5]; 
	_markername setMarkerText "Supply Drop";
	sleep 60;
	deletemarker _markername;
};

_smoke = "SmokeShellGreen" CreateVehicle (getpos _ammobox);
["info",[localize "STR_DUWS_X_lyxq9zpm",localize "STR_DUWS_X_5p6d9535"]] call bis_fnc_showNotification;

// Put some crap in the ammobox
[_ammobox,"blufor"] spawn fnc_fill_ammobox; 

[[_ammobox,[localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 8"]],"addAction",true,true] call BIS_fnc_MP;
[[_ammobox,[localize "STR_DUWS_X_gcidvhn3",fnc_AI_loadout_manager,[], 0, false, false, "", "_this distance _target < 8"]],"addAction",true,true] call BIS_fnc_MP;
[[_ammobox,[localize "STR_DUWS_X_xfgokhbc",fnc_AI_rearm,[], 0, false, false, "", "_this distance _target < 8"]],"addAction",true,true] call BIS_fnc_MP;

//DELETE THE PLANE
sleep 60;
{
	deleteVehicle _x;
} foreach units _group;

deleteVehicle _vehicle;

