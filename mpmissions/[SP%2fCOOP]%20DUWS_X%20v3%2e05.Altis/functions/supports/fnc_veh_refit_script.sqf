
_trg = _this select 0;
_vehicles = vehicles inAreaArray _trg;
//hint str _vehicles;

if (count (vehicles inAreaArray _trg) > 0) then {
	{
		if (side group _x == west) then {
			_vehName = getDescription _x;
			['veh_refit_hint',[localize 'STR_DUWS_X_4sws5wzj',format[localize 'STR_DUWS_X_noxzr04q',(_vehName select 0)]]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
			sleep 5;
			_x setDamage 0;
			//_x setFuel 1;
			//_x setVehicleAmmo 1;
			[_x,1] remoteexec ['setFuel',_x];
			[_x,1] remoteexec ['setVehicleAmmo',_x];
			['veh_refit_hint',[localize 'STR_DUWS_X_079qf5rg',format[localize 'STR_DUWS_X_jwfnu6ku',(_vehName select 0)]]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
		};	
	} forEach _vehicles;
};	
	