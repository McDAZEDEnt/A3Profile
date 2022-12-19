
// Spawn guards around prefab and randmon units in buildings
_position = _this select 0;
_group = [];
// minimum positions to allow for building spawns
_positions_needed = 5;
// Radius to spawn troops in buildings
_radius = 150;

_spawn = [(_position select 0)+20,(_position select 1)];

//original group without leaders
_initGroup = [opfor_AR_SOLDIER_X,opfor_AT_SOLDIER_X,opfor_GL_SOLDIER_X, opfor_SPECOPS_MEDIC_X];
_multipliedGroup = [];
if (enemyunitMultiplier < 0) then {enemyunitMultiplier = 1};

for "_i" from 0 to (enemyunitMultiplier - 1) step 1 do
    {
        _multipliedGroup = _multipliedGroup + _initGroup;
    };
// let's add squad leader now
_multipliedGroup = [_multipliedGroup, [opfor_SL_SOLDIER_X], 0] call BIS_fnc_arrayInsert;
_group = [_spawn, EAST, _multipliedGroup,[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;

[_group, _position] call bis_fnc_taskDefend;

// Put an intel action on leader
if (hardcore_mode_enable && (random 10) < (master_Intel_chance + master_Intel_boost)) then {
	_leader = units _group select 0;
	_code = {[] spawn fnc_found_intel};
	[_leader, "Search for Intel", "search", _code] spawn fnc_actionRotary;
};

// Add a mortar team if VCOM activated
if (!isNil "VCM_ARTYENABLE") then {
	if (VCM_ARTYENABLE == true) then {
		_group = [_spawn, EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
		(units _group select 0) addbackpack "O_Mortar_01_support_F";
		(units _group select 1) addbackpack "O_Mortar_01_weapon_F";
		[_group, _position] call BIS_fnc_taskDefend;
	};
};

// Populate some buildings
// only use buildings with > 2 positions 
// (Cherno, etc... have lots of buildings with positions and no entry)
_usableBuildings = [];
_usableBuildings = [_position,_positions_needed,_radius] call fnc_usableBuildings;

_max = count _usableBuildings;

// 2 buildings minimum
if (_max < 2) exitWith {};
// 2-5 units
_rando = [2,5] call BIS_fnc_randomInt;
if (_max < _rando) then {_rando = _max};

_bldgUnits = [];
for "_i" from 1 to _rando do { _bldgUnits pushBack opfor_SOLDIER_X; };
_group = [[0,0], EAST, _bldgUnits,[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;

// pick a Random building for each unit
_counter = 0;
{
	_building = _x;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_randPos = [3,(count _positions)-1] call BIS_fnc_randomInt;
	if (_counter >= _max || _counter >= _rando) exitWith{};
	_unit = units _group select _forEachIndex;
	_unit setPosATL (_building buildingPos _randPos);
	_unit setUnitPos "UP";
	_unit disableAI "PATH";
	_unit setBehaviour "SAFE";
	_counter = _counter + 1;
} forEach _usableBuildings;

