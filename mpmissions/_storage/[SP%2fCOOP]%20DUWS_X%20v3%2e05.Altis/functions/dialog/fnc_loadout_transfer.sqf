
_loadout_index = lbCurSel 2101;

_array_of_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";

// Define the index for loadout name
_loadout_index = _loadout_index * 2;
_loadout_name = _array_of_loadouts select _loadout_index;

// CREATE THE ARRAY OF UNITS
_target_index = lbCurSel 2100;

_temp_units = units group player;
_leader = leader group player;

_array_of_units = [];
{
	if (_x distance player < 50 && _x != _leader) then {
		_array_of_units = _array_of_units + [_x];
	};
} forEach _temp_units;

// Get the unit and transfer the loadout
_unit_name = _array_of_units select _target_index;
// load from player
[_unit_name, [profileNamespace, _loadout_name]] call BIS_fnc_loadInventory;
// save to mission variable for AI Rearm
[_unit_name, [missionNamespace, format["%1_loadout",_unit_name]]] call BIS_fnc_saveInventory;

hint format[localize "STR_DUWS_X_y8vqfpmq", _loadout_name, _unit_name];

