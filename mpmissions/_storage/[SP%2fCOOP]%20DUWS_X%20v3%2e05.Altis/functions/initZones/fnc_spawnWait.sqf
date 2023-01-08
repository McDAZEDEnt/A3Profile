
// LOOP TO WAIT UNTIL BLUFOR CLOSE - SPAWN /DESPAWN 
// AFTER 10 min of BLUFOR CLOSE, NO DESPAWN

_spawnPos = _this select 0;
_size = _this select 1;
_index = _this select 2;

_blufor_close = false;
_noDespawn = false;

_AI_buffer = 500;
_player_buffer = 1000;
_despawn_timer = 600;
_startTime = time;

while {true} do {
	
	if (!_blufor_close) then {

		while {true} do {
			_count_blu = 0;
			_westUnits = [];
			{
				if ((side _x) == WEST) then {
					_westUnits pushBack _x;
				};
			} forEach allUnits;

			// CHECK FOR 2x ANY UNIT
			{
				if ((_spawnPos distance _x) < (_size + _AI_buffer)) then {  // wait until BLUFOR are within 500m of perimeter
					//hint format ["Count blufor close: %1", str _count_blu];
					//if ((getpos vehicle _x) select 2 < 2) then {  //not in air
						_count_blu = _count_blu + 1;
					//};
					// wait until more than 1x BLUFOR to prevent trigger from
					// glitchy spawns and wandering AI or bailout pilots
					// hint format ["Count blufor close: %1", str _count_blu];
					if (_count_blu > 1) then {
						_blufor_close = true;
					};  
				};
			} forEach _westUnits;
			
			// CHECK FOR 1x PLAYERS
			{
				if ((_spawnPos distance _x) < (_size + _player_buffer)) then {
					//if ((getpos vehicle _x) select 2 < 2) then { //not in air
						_blufor_close = true;
					//};  
				};
			} foreach call BIS_fnc_ListPlayers;

			// Start the Spawns and start the timer
			if (_blufor_close) exitWith {
				(zone_spawn_array select _index) set [1,true];
				_startTime = time;
			};
			
			sleep 10;
		};
		
	} else {

		while {true} do {
			
			_blufor_close = false;  // until timer hits 10 min
			
			// Wait 10 min before DESPAWN
			if (time - _startTime < _despawn_timer || !(_spawnPos in WARCOM_zones_controled_by_OPFOR)) exitWith {
				_blufor_close = true;
			};

			// after 10 min check if BLUFOR still close
			_westUnits = [];
			{
				if ((side _x) == WEST) then {
					_westUnits pushBack _x;
				};
			} forEach allUnits;
			
			//CHECK FOR AI (500m)
			{
				if ((_spawnPos distance _x) < (_size + _AI_buffer)) then {  
					// hint format ["Count blufor close: %1", str _count_blu];
					_blufor_close = true;
				};  
				if (_blufor_close == true) exitWith {};
			} forEach _westUnits;

			// CHECK FOR PLAYERS (1000m)
			{
				if ((_spawnPos distance _x) < (_size + _player_buffer)) then {
					//if ((getpos vehicle _x) select 2 < 2) then { //not in air
						_blufor_close = true;
					//};  
				};
			} foreach call BIS_fnc_ListPlayers;

			sleep 10;
			
			// If blufor still close after 10 min, leave the zone as is, no despawn 
			if (_blufor_close == true) exitWith {
				_noDespawn = true;
				(zone_spawn_array select _index) set [2,true];
			};

			if (_blufor_close == false) exitWith {};

		};
		
		// CLEANUP ZONE
		if (_blufor_close == false) then {
			(zone_spawn_array select _index) set [1,false];
			_zoneObj = _spawnPos nearObjects (_size + _AI_buffer);
			{
				// Delete vehicles and crew
				if (side _x == EAST && !(_x isKindOf "StaticWeapon") && !(_x isKindOf "Man")) then {
					deleteVehicleCrew _x;
					deleteVehicle _x;
				};
				// Delete units not in vehicles
				if (side _x == EAST && _x isKindOf "Man" && vehicle _x == _x) then {
					deleteVehicle _x;
				};
				
			} foreach _zoneObj;
		};
	};

	//if (_noDespawn == true) exitWith {};
	
	if (_noDespawn == true) then {
		waitUntil {sleep 60;(!(_spawnPos in WARCOM_zones_controled_by_OPFOR) || count WARCOM_zones_controled_by_OPFOR < 1)};
		//hint "zone NOT in OPFOR zones";
		if (count WARCOM_zones_controled_by_OPFOR < 1) exitWith {};
		waitUntil {sleep 60;(_spawnPos in WARCOM_zones_controled_by_OPFOR || count WARCOM_zones_controled_by_OPFOR < 1)};
		//hint "zone IN OPFOR zones";
		if (count WARCOM_zones_controled_by_OPFOR < 1) exitWith {};
		_opfor_spawn = false;
		_noDespawn = false;
		_blufor_close = false;
		(zone_spawn_array select _index) set [1,false];
		(zone_spawn_array select _index) set [2,false];
	};
	if (count WARCOM_zones_controled_by_OPFOR < 1) exitWith {};

};







