
params ["_spawnPos","_grouptype","_TFname"];

_group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;

// Keep units from dying on spawn
{
	_x allowDamage false;
} forEach (units _group);
sleep 15;
{
	_x allowDamage true;
} forEach (units _group);

//[format[localize "STR_DUWS_X_32ci6fa1",_TFname]] spawn fnc_sideChat_filter;
[format[localize "STR_DUWS_X_32ci6fa1",_TFname]] remoteExec ["fnc_sideChat_filter", 2];
sleep 10; // give squads a chance to mount up
[_group] spawn fnc_WARCOM_wp_blu_assault;
[_group,_TFname] spawn fnc_WARCOM_gps_marker;

