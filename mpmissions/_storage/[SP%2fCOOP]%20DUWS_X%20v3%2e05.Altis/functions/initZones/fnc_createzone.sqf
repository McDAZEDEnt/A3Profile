//  _generatezonescript = [format["Zone %1",_i],_points_zone,_zone_radius,_MissionPos,_fortified,true,_i] spawn fnc_createzone
// 	Name of the place,pts,radius,position,fortified,prefab,zone#
//

_name = _this select 0; //name
_points = _this select 1;
_size = _this select 2;
_zonePos = _this select 3;  //position
_fortified = _this select 4;
_prefab = _this select 5;
_zone_num = _this select 6;

// Zone visibility
_visible = true;
if (hardcore_mode_enable) then {_visible = false};

diag_log format ["Create Zone variables: %1", str [_name,_points,_size,_zonePos,_fortified,_prefab,_zone_num]];

amount_zones_created = amount_zones_created + 1;
publicVariable "amount_zones_created";
zones_created = true; // Tell that at least 1 zone is created
publicVariable "zones_created";

// Add the zone to the array of zones (need for manual placement of zones and WARCOM)
if (isNil ("Array_of_OPFOR_zones")) then {Array_of_OPFOR_zones = [];};
Array_of_OPFOR_zones = Array_of_OPFOR_zones + [_zonePos];
// Add the zone name, position, and visibility(hardcore) to zone_namePOS_pairs 
zone_namePOS_pairs = zone_namePOS_pairs + [[_name,_zonePos,_visible]];
publicVariable "zone_namePOS_pairs";

// Add zone to the spawn/despawn array [number, blufor_close, noDespawn]
zone_spawn_array = zone_spawn_array + [[_zone_num,false,false]];

// CREATE MARKER (ICON)
_markername = format["%1%2",round(_zonePos select 0),round(_zonePos select 1)]; // Define marker name
//hint _markername;
_markerstr = createMarker [str(_markername),_zonePos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "o_inf";
str(_markername) setMarkerColor "ColorRed";
str(_markername) setMarkerText _name;
str(_markername) setMarkerSize [0, 0];
// hardcore mode makes marker invisible
if (hardcore_mode_enable) then {
	str(_markername) setMarkerAlpha 0; 
} else {	
	str(_markername) setMarkerAlpha 1; 
};

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipse",round(_zonePos select 0),round(_zonePos select 1)]; // Define marker name
//hint _markername2;
_markerstr2 = createMarker [str(_markername2),_zonePos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorRed";
str(_markername2) setMarkerSize [_size, _size];
// hardcore mode makes marker invisible
if (hardcore_mode_enable) then {
	str(_markername2) setMarkerAlpha 0; 
} else {	
	str(_markername2) setMarkerAlpha 0.3; 
};

// CREATE ZONE CAPTURABLE TRIGGER
_trg=createTrigger["EmptyDetector",_zonePos];
_trg setTriggerArea[_size,_size,0,false];
_trg setTriggerActivation["WEST SEIZED","PRESENT",true];
_trg setTriggerStatements["this", format["[""%1"",%2,""%3"",""%4"",%5,%6] spawn fnc_captured",_name,_points,_markername,_markername2,_zonePos,_size], ""];
_trg setTriggerTimeout [30, 60, 300, true ];
// CREATE VARNAME FOR ZONE TRIGGER --> use the pos of the trigger
_zonePosName = format["trigger%1%2",round (_zonePos select 0),round (_zonePos select 1)];
call compile format["%1 = _trg",_zonePosName];

//diag_log format ["Before Prefab: %1", _prefab];

// CREATE PREFAB
if (_prefab) then {

	//diag_log format ["Start Prefab: %1", _prefab];
	_array_of_prefabs = [];

	// FACTION DEFAULTS
	switch (VERSION_X) do {
	
		case "MODERN": {
			// ["Display Name, fortified, script, frequency"]
			_array_of_prefabs = [
				["Vehicle Refit",true,fnc_modern_vehfittingstation,0.1],
				["Storage Bunker",true,fnc_modern_StorageBunker,0.4],
				["Comm Station",true,fnc_modern_CommStation,1.0],
				["Recon Outpost",true,fnc_modern_reconOutpost,1.0],
				["Outpost",true,fnc_modern_outpost1,1.0],
				["Outpost",true,fnc_modern_Outpost2,1.0]
			];
		};
		
		case "WW2": {
			// ["Display Name, fortified, script, frequency"]
			_array_of_prefabs = [
				["Vehicle Refit",true,fnc_ww2_vehfittingstation,0.4],
				["Field Hospital",true,fnc_ww2_FieldHospital,0.4],
				["Comm Station",true,fnc_ww2_CommStation,1.0],
				["Outpost",true,fnc_ww2_Outpost,1.0],
				["Bunker",true,fnc_ww2_Bunker,1.0],
				["Checkpoint",true,fnc_ww2_Checkpoint,0.7]
			];
		};
		case "VIETNAM": {
			// ["Display Name, fortified, script, frequency"]
			_array_of_prefabs = [
				["Vehicle Refit",true,fnc_vietnam_vehfittingstation,0.7],
				["Field Hospital",true,fnc_vietnam_FieldHospital,0.6],
				["Comm Station",true,fnc_vietnam_CommStation,1.0],
				["Storage Bunker",true,fnc_vietnam_StorageBunker,1.0],
				["Outpost",true,fnc_vietnam_Outpost1,1.0],
				["Outpost",true,fnc_vietnam_Outpost2,1.0]
			];
		};
	};
	_amount_of_prefabs = count _array_of_prefabs;
	_indexedAmount = _amount_of_prefabs - 1;
	_dice = round random _indexedAmount;

	// Randomize which prefab
	_prefab_array = selectRandomWeighted [
		(_array_of_prefabs select 0),((_array_of_prefabs select 0) select 3),	
		(_array_of_prefabs select 1),((_array_of_prefabs select 1) select 3),	
		(_array_of_prefabs select 2),((_array_of_prefabs select 2) select 3),	
		(_array_of_prefabs select 3),((_array_of_prefabs select 3) select 3),	
		(_array_of_prefabs select 4),((_array_of_prefabs select 4) select 3),	
		(_array_of_prefabs select 5),((_array_of_prefabs select 5) select 3)	
	];
	 
	_name = _prefab_array select 0;
	_fortified = _prefab_array select 1;
	_path = _prefab_array select 2;
	//diag_log format ["Prefab: %1 %2 %3", _name,_fortified,_path];

	// Generate the prefab
	[_zonePos] spawn _path;
	str(_markername) setMarkerText format["%1. %2", _zone_num, _name];

// Simple Zone prefab
} else {
	switch (VERSION_X) do {
		case "MODERN": {
			_prefab = ["Outpost",true,fnc_modern_simple_zone];
		};
		case "WW2": {
			_prefab = ["Outpost",true,fnc_ww2_simple_zone];
		};
		case "VIETNAM": {
			_prefab = ["Outpost",true,fnc_vietnam_simple_zone];
		};
	};
	//_prefab_array = _array_of_prefabs select _dice;
	_name = _prefab select 0;
	_fortified = _prefab select 1;
	_path = _prefab select 2;

	[_zonePos] spawn _path;
	str(_markername) setMarkerText format["%1. %2", _zone_num, _name];
};

// ADD THE QRF OBJECT
_vehicle_0 = objNull;
_vehicle_0 = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_vehicle_0 allowDamage false;
_vehicle_0 setPos [(_zonePos select 0)+20,(_zonePos select 1)];
hideObjectGlobal _vehicle_0;

//ADD QRF EventHandler to object
_null = _vehicle_0 addEventHandler ["FiredNear", {[_this select 0] spawn fnc_QRF_test}];

// CREATE ZONE NOTIFICATION TRIGGER
_trg2=createTrigger["EmptyDetector",_zonePos];
_trg2 setTriggerArea[_size,_size,0,false];
_trg2 setTriggerActivation["ANYPLAYER","PRESENT",true];
_trg2 setTriggerStatements["this", format["['Zone %1',%2,'%3','%4',thislist] spawn fnc_enterlocation;",_zone_num,_zonePos,_markername,_markername2], ""];
// CREATE VARNAME FOR NOTIFICATION TRIGGER --> use the pos of the trigger
_zonePosName2 = format["trigger2%1%2",round (_zonePos select 0),round (_zonePos select 1)];
call compile format["%1 = _trg2",_zonePosName2];
// move the spawn location, or units get stuck
_spawnPos = _zonePos;

///////////////////////////////////////////////
// CREATE OPFOR. HEAVY CLUSTERFUCK INCOMING.
///////////////////////////////////////////////

//diag_log format ["Create Zone. Check size: %1 ", str _name];

_index = zone_spawn_array find [_zone_num,false,false];
_opfor_spawn = (zone_spawn_array select _index) select 1;
_noDespawn = (zone_spawn_array select _index) select 2;

sleep 60;
[_spawnPos,_size,_index] spawn fnc_spawnWait;

_fnc_spawn_size = "";
switch (true) do {
	case (_size < 101): {
		_fnc_spawn_size = fnc_100_zone;
	};
	case (_size < 251): {
		_fnc_spawn_size = fnc_250_zone;
	};
	case (_size < 501): {
		_fnc_spawn_size = fnc_500_zone;
	};
	case (_size < 1001): {
		_fnc_spawn_size = fnc_1000_zone;
	};
	case (_size < 1501): {
		_fnc_spawn_size = fnc_1500_zone;
	};
	case (_size > 1500): {
		_fnc_spawn_size = fnc_1501_zone;
	};
};
		
while {true} do {

	if (_opfor_spawn == true) then {
			
		_opfor_spawn = false;
		(zone_spawn_array select _index) set [1,false];
				
		[_spawnPos] spawn fnc_createopfortified;
		sleep 2;
		[_spawnPos,_size] spawn _fnc_spawn_size;
	
	};
			
	// Loop until blufor comes back after despawn or blufor still close after 10 min
	while {true} do {
	
		if (_opfor_spawn == true || _noDespawn == true) exitWith {};
	
		sleep 10;
	
		_opfor_spawn = (zone_spawn_array select _index) select 1;
		_noDespawn = (zone_spawn_array select _index) select 2;
	
	};
			
	// if _noDespawn, leave the zone as is
	//if (_noDespawn == true) exitWith {};
	if (_noDespawn == true) then {
		waitUntil {sleep 60;(!(_spawnPos in WARCOM_zones_controled_by_OPFOR) || count WARCOM_zones_controled_by_OPFOR < 1)};
		if (count WARCOM_zones_controled_by_OPFOR < 1) exitWith {};
		waitUntil {sleep 60;(_spawnPos in WARCOM_zones_controled_by_OPFOR || count WARCOM_zones_controled_by_OPFOR < 1)};
		if (count WARCOM_zones_controled_by_OPFOR < 1) exitWith {};
		_opfor_spawn = false;
		_noDespawn = false;
		(zone_spawn_array select _index) set [1,false];
		(zone_spawn_array select _index) set [2,false];
	};
	if (count WARCOM_zones_controled_by_OPFOR < 1) exitWith {};
};


