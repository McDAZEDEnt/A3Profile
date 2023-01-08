//////////////////
// Random Zones
//////////////////
diag_log "WAITING FOR MASTER_allLocations_filtered";
waitUntil {sleep 0.1;count(MASTER_allLocations_filtered) > 0};
diag_log "RECEIVED MASTER_allLocations_filtered";

_radius = _this select 0;
_diff = _this select 1;
_infinite_failsafe_loop = true;
failsafe_zones_not_found1 = false;
failsafe_zones_not_found2 = false;
_zones_array = [];

_ZnObjects = MASTER_allLocations_filtered;

_half = worldSize / 2;
_safehalf = worldSize / 2.2;  //STAY OFF THE EDGES OF SMALL MAPS
_mapradius = sqrt 2 * _safehalf;
_mapcenter = [_half, _half, 0];

// Spawn failsafe 1
[] spawn {  
	for [{_i=1}, {_i<=2}, {_i=_i+1}] do {
		sleep 30;
		if !(WARCOM_init_done) then {
			[{hint localize "STR_DUWS_X_2amacebc"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
		};	
	};
	sleep 30;
	failsafe_zones_not_found1 = true;
};

//[
//	[
//		["The zones are being generated","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
//		["Please wait for mission initialization to complete...","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]
//	]	
//] spawn BIS_fnc_typeText;

[{hint localize "STR_DUWS_X_2amacebc"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

// ON WATER ? >> FLAT ? >> DISTANCE BETWEEN ZONES ? >> OK !

_worldName = getText(configFile >> "cfgWorlds" >> worldName >> "description");

_fortified = false;

_zones_array = [[-9999,-9999,-9999]]; //dummy location 

_distances = [];

////////////////////////
// Loop for each zone
////////////////////////
for "_i" from 1 to zones_number do {
	[{hint localize "STR_DUWS_X_2amacebc"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
	trap = _i;
	publicVariable "trap";
	[{player globalChat format[localize "STR_DUWS_X_dkajkn5v",trap]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
	_found = false;
	_zone_radius = 0;
	_points_zone = 0;

	// CREATE RANDOM PARAMETERS FOR THE ZONE -- BEGIN
	// generate random radius (max zones_max_radius) and then determine the pts
	while {_zone_radius<=zones_min_radius} do { 
		_random_zones_max_radius = random zones_max_radius;
		_zone_radius = round _random_zones_max_radius;   
		_points_zone = round (_zone_radius/10);
		
	}; 
	
	/////////////////////////////////////
	// Loop for Urban and Distance
	/////////////////////////////////////
	while {!_found} do
	{
		if (failsafe_zones_not_found1) then {
		
			hintSilent localize "STR_DUWS_X_zjb75rxm";
			
			_ZnObjects = [];
			_ZnObjects = nearestLocations [PosOfBLUHQ, ["NameLocal","Hill"], (zones_max_dist_from_hq*1.2)];

			[] spawn {  // Spawn the 2nd failsafe
				sleep 60;
				failsafe_zones_not_found2 = true;
			};

			if (failsafe_zones_not_found2) exitWith {  // FAILSAFE. IF ZONES NOT FOUND AFTER X SECONDS, RESET.        
				forceMap false;
				openMap [false, false];
				closeDialog 0;
				while {_infinite_failsafe_loop} do {

					[{player globalChat localize "STR_DUWS_X_1rqkf85t"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

					[{hint localize "STR_DUWS_X_4zwea7it"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

					failsafe_zones_not_found2 = false; 
					chosen_settings = false;
					sleep 1;
				};
			};     // END OF FAILSAFE EXECUTION, RESET OVER.
		};  // If NO urban areas qualify then use "NameLocal"
		
		_Posfound = false;
		_ZnLocation = [];
		_posDeMeilleurTruc = [];

		/////////////////////////////////////
		// Find a safe place for this zone
		/////////////////////////////////////
		while {!_Posfound} do {
		
			if (moreUrban == 1) then {
				// MORE URBAN
				_ZnAnchor = getPos (_ZnObjects select (floor (random (count _ZnObjects))));
				_count = 1;
				
				// Make sure no previous zones or FOBs are nearby
				if (DUWS_MODE == "DOMINATION") then {
					_fob_locations = [];
					_too_close = [];
					{
						_fob_locations = _fob_locations + [getPos _x];
					} forEach Array_of_FOBS;

					if (count(_fob_locations) > 0) then {
						{
							_too_close = serv_zones_array_temp + [_x];
						} forEach _fob_locations;
					} else {
						_too_close = serv_zones_array_temp ;
					};
					{
						if ((_x distance _ZnAnchor) < 1500) then {
							_count = 11;  // trick the _Posfound loop
						};
					} forEach _too_close;
				};

				while {true} do {
					if (_count > 10) exitWith {}; 
					if (count _ZnObjects < 3) then {
						_ZnLocation = [_mapcenter, 0, _mapradius,5,0,0.3,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
					} else {
						//_ZnLocation = [_ZnAnchor, 50,200,10,0,0.3,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
						_ZnLocation = _ZnAnchor;
					};

					_Building = "";
					_nearBuildings = [];
					_nearBuildings = nearestTerrainObjects [_ZnLocation, ["House"], 200, true];

					// only use buildings with positions
					_usableBuildings = [];
					{
						_bPos = _x buildingPos 0;
						if not ((_bPos select 0) == 0) then	{
							_usableBuildings pushBack _x;
						};
					} foreach _nearBuildings;

					if (count _usableBuildings == 0) then {
						_Building = nearestBuilding _ZnLocation;
					} else {
						_Building = _usableBuildings select 0;						
					};

					_numBuildings = count (nearestTerrainObjects [position _Building, ["House"], 100, true]);
					if (_numBuildings > 20) then {
						_posDeMeilleurTruc = [_Building, 20,300,15,0,0.15,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
					} else {
						_posDeMeilleurTruc = [_Building, 20,150,15,0,0.15,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
					};

					// Don't spawn near water
					_vehicle_0 = objNull;
					_this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
					_vehicle_0 = _this;
					_this setPos _posDeMeilleurTruc;
					_nearWater = false;
					_dir = 0;
					while {!_nearWater} do {
						_nearWater = surfaceIsWater (_vehicle_0 getRelPos [50,_dir]);
						_dir = _dir + 45;
						if (_dir > 360) exitWith {};
					};
					deleteVehicle _vehicle_0;					
					if (_nearWater) exitWith {}; 

					// DON'T SPAWN ON ROADS
					_nearRoad = [_posDeMeilleurTruc,20] call BIS_fnc_nearestRoad;
					if (_posDeMeilleurTruc select 0 != 0 && 
						_posDeMeilleurTruc select 1 != 0 &&
						isNull _nearRoad) then {_Posfound=true;_count = 11;};
					_count = _count + 1;	
				};
			}else{
				// LESS URBAN
				_count = 1;
				while {true} do {
					if (_count > 10) exitWith {};
					
					// check if AO direction set
					_inArc = false; 
					while {!_inArc} do {
						_ZnLocation = [_mapcenter, 0, _mapradius,5,0,0.3,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
						if (count(AO_direction) > 0) then {
							_direction = PosOfBLUHQ getDir AO_direction;
							_inArc = [ PosOfBLUHQ, _direction, 135, _ZnLocation ] call BIS_fnc_inAngleSector;
						} else {
							_inArc = true;
						};
					};
					if (DUWS_MODE == "DOMINATION") then {
						_too_close = serv_zones_array_temp + Array_of_FOBS;
						{
							if ((_x distance _ZnAnchor) < 1500) then {
								_count = 11;  // trick the _Posfound loop
							};
						} forEach _too_close;
					};
					if (_count == 11) exitWith {}; 

					_Building = nearestBuilding _ZnLocation;
					_posDeMeilleurTruc = [_Building, 50, 100,15,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;

					// DON'T SPAWN ON ROADS
					_nearRoad = [_posDeMeilleurTruc,20] call BIS_fnc_nearestRoad;
					if (_posDeMeilleurTruc select 0 != 0 && 
						_posDeMeilleurTruc select 1 != 0 &&
						isNull _nearRoad) then {_Posfound=true;_count = 11;};
						
					_count = _count + 1;
				};
			};
			
			// OLD SCHOOL
			//_posDeMeilleurTruc = [center_of_map, 0, half_of_map,5,0,0.1,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
		};

		_playerDistance = _posDeMeilleurTruc distance PosOfBLUHQ;

		///////////////////////////////////////////////////
		// Make sure zone is not too close to other zones
		///////////////////////////////////////////////////
		if (_playerDistance>(zones_max_radius + 1000) && (PosOfBLUHQ distance _posDeMeilleurTruc) <= zones_max_dist_from_hq)  then {  

			_found_distance = true;
			_zonePos = _posDeMeilleurTruc;
			_distance = [];     

			for [{_t=1}, {_t<=count _zones_array}, {_t=_t+1}] do    // I HAVE NO IDEA OF WHAT I'VE DONE
			{                                               
				_zones_array_index = _t-1;
				_distance = _distance +[(_zones_array select _zones_array_index) distance (_zonePos)]; // _distance is an array of all the distances relative to the newly found position and the other zones
				//hint format["%1",_distance];
			};
			for [{_t=1}, {_t<=count _distance}, {_t=_t+1}] do     // OH GAWD
			{                                               
				_distances_array_index = _t-1;
				_check = (_distance select _distances_array_index); // check the distances contained in _distance array 1 by 1 by sending them to _check.
				if (_check < zones_spacing) then {    // zones_spacing = max radius * 1.8 from center to center  
					_found_distance = false;
				};
			};
     
			if (_found_distance) then {
		
				trap = _i;
				publicVariable "trap";  // need for MP chat log ??
			
				_zonePos = [round(_zonePos select 0),round(_zonePos select 1)];
			
				diag_log format ["Create Zone start: %1", _i];
				_prefab=true;
				if (simple_zones_enable) then {_prefab = false};
				[format[localize "STR_DUWS_X_39z6pg7y",_i],_points_zone,_zone_radius,_zonePos,_fortified,_prefab,_i] spawn fnc_createZone;
				_found=true;
				_zones_array = _zones_array + [_zonePos]; 

				[{player globalChat format[localize "STR_DUWS_X_vai9q3po",trap]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
				sleep 1;
				[{player globalChat format[localize "STR_DUWS_X_1lfvd9iw",trap]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
			
			}; // END OF THIRD LOOP     
		
		};  // END SECOND LOOP
	};  // END WHILE LOOP --- LOCATION FOUND
}; // END FOR LOOP -- ALL ZONES CREATED 

sleep 1;
trap = _worldName;
publicVariable "trap";
[{player globalChat format[localize "STR_DUWS_X_d5e848d8",trap,profileName]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
[{player globalChat localize "STR_DUWS_X_518bqchj"}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
[{hint format[localize "STR_DUWS_X_7mog9k78",
	zones_number,zones_max_radius,zones_min_radius,zones_max_dist_from_hq,
	weather_type,time_of_day,enableChopperFastTravel,enable_fast_travel,
	ZeusStatus,staminaEnabled,VCOM_AI_enable,time_Multiplier,simple_zones_enable,CIV_PRESENCE
]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];

// For some reasons I had to add a zone [0,0,0] in _zones_array, now I must remove it:
_zones_array = [_zones_array, 0] call BIS_fnc_removeIndex;

//player globalchat format["%1",_zones_array];
serv_zones_array = [] + _zones_array;
publicVariable "serv_zones_array";

[
	[
		[localize "STR_DUWS_X_518bqchj","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		[localize "STR_DUWS_X_37xxl2nt","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		[format[localize "STR_DUWS_X_dqxeffa2",_worldName,profilename],"<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]
	]
] spawn BIS_fnc_typeText;  

//playMusic ["EventTrack01a_F_EPA", 0];

//forceMap false;


