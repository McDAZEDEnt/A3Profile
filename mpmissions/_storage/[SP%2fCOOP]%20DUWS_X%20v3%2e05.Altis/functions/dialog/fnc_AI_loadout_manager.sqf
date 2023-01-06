

_handle = createDialog "AI_loadout_manager";
waitUntil {dialog};

// CREATE THE ARRAY OF LOADOUTS
_array_of_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
_numberLoadouts = ((count _array_of_loadouts) / 2) - 1;

// Populate the list
for "_i" from 0 to _numberLoadouts do
{
	_index = _i * 2;
	_loadout_name = _array_of_loadouts select _index;
	lbAdd [2101, _loadout_name];
};
lbSetCurSel [2101, 0];

// CREATE THE ARRAY OF UNITS
_temp = units group player;
_array_of_units = [];
{
	if (_x distance player < 50) then {
		_array_of_units = _array_of_units + [_x];
	};
} forEach _temp;

_numberUnits = (count _array_of_units) - 1;
// Populate the list
for "_i" from 1 to _numberUnits do
{
	_unit_name = str (_array_of_units select _i);
	lbAdd [2100, _unit_name];
};
lbSetCurSel [2100, 0];



