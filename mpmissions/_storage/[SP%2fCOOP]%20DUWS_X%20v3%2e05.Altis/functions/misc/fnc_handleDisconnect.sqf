// EventHandler for Disconnected Players
// Makes TaskForce squads out of each
addMissionEventHandler ["HandleDisconnect",
   {
	_playerObj = _this select 0;
	_playerName = vehicleVarname _playerObj;

	_var = format["%1HC", _playerName];
	_HCgroups = call (compile _var);
	diag_log format ["HC groups: %1", str _HCgroups];
	{
		[_x] spawn fnc_WARCOM_wp_blu_assault;
		[_x,_var] spawn fnc_WARCOM_gps_marker;
	} forEach _HCgroups;
	missionNamespace setVariable [_var, nil, true];

	_var = format["%1_HC_module", _playerName];
	_HC_module = call (compile _var);
	deleteVehicle _HC_module;
	missionNamespace setVariable [_var, nil, true];

	_var = format["%1_HC_sub_module", _playerName];
	_HC_sub_module = call (compile _var);
	deleteVehicle _HC_sub_module;
	missionNamespace setVariable [_var, nil, true];
	
	deleteVehicle _playerObj;
	}
];
