
// Find map locations for CIVILIANS
_ZnObjects = [] call fnc_civ_locator_Tomata;

// Read the CIV faction file
_civ_factionFile = "FACTIONS\CIV_FACTIONS.sqf";
fnc_civ_factionFile = compile preprocessFileLineNumbers _civ_factionFile;
[] call fnc_civ_factionFile;

// Radius to spawn civs from town center
_radius = 350;
// minimum positions to allow for building spawns
_positions_needed = 5;
 
_player_close = false;
_civ_close = false;

// INFINITE LOOP TO TRACK REPUTATION
[] spawn {
	while {true} do {
		waitUntil {sleep 10;CIV_deaths > 0};
		_rep = Player_Reputation;
		_civdeaths = CIV_deaths;
		_resetTimer = false;
		for "_i" from 1 to 6 do {
			sleep 300;
			if (CIV_deaths > _civdeaths) exitWith {_resetTimer = true};
		};
		if (_resetTimer == false) then {
			if (_rep == Player_Reputation) then {
				if (Player_Reputation == 1) exitWith {};
				Player_Reputation = Player_Reputation + 1;
				publicVariable "Player_Reputation";
				["info",[localize "STR_DUWS_X_rqwho9bq",format[localize "STR_DUWS_X_0pluxey2",Player_Reputation]]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
			};
		};
	};
};

// INFINITE LOOP TO CHECK PROXIMITY OF PLAYERS
while {true} do {

	_playableUnits = [];
	_civUnits = [];

	// make a list of players
	{_playableUnits pushBack _x}forEach call BIS_fnc_ListPlayers;   
	
	// make a list of civs
	{
		if ((side _x) == CIVILIAN && (captive _x) == false) then {
			_civUnits pushBack _x;
		};
	} forEach allUnits;
	
	// check every location (_ZnObjects)
	{
		_location = _x;
		// CHECK FOR PLAYERS IN RANGE
		{
			// check players are within 500m of location
			if (((getPos _x) distance (getPos _location)) < 500) then {  
				// hint format ["Count blufor close: %1", str _count_blu];
				// (in vehicle, not air) OR (on foot)
				if ((getpos vehicle player) select 2 < 2) then {
					_player_close = true;
				};
			};
			if (_player_close == true) exitWith {};
		} forEach _playableUnits;
		
		// CHECK FOR CIVS IN RANGE (for Despawn and Prevent Dupes)
		{
			// check civs are within 500m of location
			if (((getPos _x) distance (getPos _location)) < 500) then {  
				_civ_close = true;
			};
			if (_civ_close == true) exitWith {};
		} forEach _civUnits;
	
		// DELETE CIVILIANS (no players close)
		if (_player_close == false && _civ_close == true) then {
			// hint format ["%1 P:false C:true", text _location];sleep 5;
			{
				if ((side _x == CIVILIAN) 
					&& (((getPos _x) distance (getPos _location)) < 500) 
					&& vehicle _x == _x 
					&& (captive _x) == false) then {
					deleteVehicle _x;
				};
			} forEach allUnits;
			_player_close = false;
			_civ_close = false;
		};

		// SPAWN CIVILIAN LOGIC
		
		if (_player_close == true && _civ_close == false) then {
			// hint format ["%1  P:true C:false", text _location];sleep 5;
			
			// Populate some buildings
			// only use buildings with > 2 positions 
			// (Cherno, etc... have lots of buildings with positions and no entry)
			_usableBuildings = [];
			_usableBuildings = [getPos _location,_positions_needed,_radius] call fnc_usableBuildings;

			// CIV POPULATION IS BASED ON BUILDING DENSITY WITHIN RADIUS
			_max = count _usableBuildings;
			_rando = 3;
			// hint format ["%2  %1  P:true C:false", text _location, _max];sleep 5;
			_usableBuildings = _usableBuildings call BIS_fnc_arrayShuffle;
			
			// 5 buildings minimum
			if (_max < 5) exitWith {};
			// small town
			if (_max < 50) then {
				_rando = [3,5] call BIS_fnc_randomInt;
			} else {	
				// medium town
				if (_max < 250) then {
					_rando = [5,8] call BIS_fnc_randomInt;
				} else {
					// large town
					_rando = [8,10] call BIS_fnc_randomInt;
				};
			};
			if (_max < _rando) then {_rando = _max};
			
			// Spawn CIVs with "killed" eventHandler
			_bldgUnits = [];
			_civ_unit = [];
			for "_i" from 1 to _rando do {
				_civ_unit = civ_array call BIS_fnc_selectRandom;
				_group = [[0,0], CIVILIAN, [_civ_unit]] call BIS_fnc_spawnGroup;
				_civ_unit = units _group select 0;
				_null = _civ_unit addEventHandler ["Killed", {[_this select 0, _this select 1, _this select 2] spawn fnc_civ_rep_Tomata}];
				_civ_unit allowDamage false;
				_group deleteGroupWhenEmpty true;
				_bldgUnits pushBack _group;
				sleep 3;
			};
			
			// pick a Random building for each CIV
			_counter = 0;
			{
				_building = _x;
				_positions = [_building] call BIS_fnc_buildingPositions;
				_randPos = [3,(count _positions)-1] call BIS_fnc_randomInt;
				if (_counter >= _max || _counter >= _rando) exitWith{};
				_group = _bldgUnits select _forEachIndex;
				{
					_x setPosATL (_building buildingPos _randPos);
					_x allowDamage true;
					_x setVariable ["Vcm_Disable",true];
				} forEach units _group;
				_counter = _counter + 1;
			} forEach _usableBuildings;
			
			// CHANCE OF HOSTILE CIV
			if (Player_Reputation < 0 && _rando > 5) then {
				// Convert neg to pos
				_rep = abs Player_Reputation;
				// Determine % chance
				_chance = round(10 / _rep);
				_hostile = [1,_chance] call BIS_fnc_selectRandom;
				if (_hostile == 1) then {
					//hint format ["hostile=%1 rep=%2", _hostile,_rep];
					// prevent 100% hostile
					if ((_rep-1) >= count _bldgUnits) then {_rep = (count _bldgUnits) - 1}; 
					// 1x hostile per negative rep point
					for "_i" from 0 to (_rep-1) do {
						(leader (_bldgUnits select _i)) addMagazine "30Rnd_545x39_Mag_F";
						(leader (_bldgUnits select _i)) addMagazine "30Rnd_545x39_Mag_F";
						(leader (_bldgUnits select _i)) addWeapon "arifle_AKS_F";
						(leader (_bldgUnits select _i)) removeAllEventHandlers "Killed";
						_group = createGroup EAST;
						[_bldgUnits select _i] joinSilent _group; 
						_bldgUnits pushback _group;
					};
				};
			};

			// CHANCE OF INFORMANT CIV
			if (hardcore_mode_enable && (random 10) < master_Intel_chance
				&& Player_Reputation > -2 && _rando > 5) then {
				_informant = "";
				{
					if (side _x != EAST) exitWith {
						_informant = createGroup CIVILIAN;
						_unit = leader _x;
						[_unit] joinSilent _informant;
						_bldgUnits deleteAt _forEachIndex;
						_code = {[] spawn fnc_found_intel};
						[_unit, "Talk to Informant", "talk", _code] spawn fnc_actionRotary;
					};
				} forEach _bldgUnits;
				// Give Informant unique waypoints
				[_informant,_usableBuildings] spawn fnc_civ_informant_wp_Tomata;
			};
			
			// Give CIVs some waypoints
			[_bldgUnits,_usableBuildings] spawn fnc_civ_wp_Tomata;

		};
		_player_close = false;
		_civ_close = false;
	} forEach _ZnObjects;

	sleep 30;
};








