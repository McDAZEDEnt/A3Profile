
_cost = _this select 0;
_index = lbCurSel 2103;
AttChopInUse = true;

_grouptype = [];
_spawnPos = getmarkerpos str blu_hq_markername;

switch (VERSION_X) do {
	case "MODERN": {
		_spawnPos = [(_spawnPos select 0)+250, _spawnPos select 1, (_spawnPos select 2)+200];
		_grouptype = [blufor_HELI_ATTACK_X];
	};
	case "WW2": {
		_spawnPos = [(_spawnPos select 0)+500, _spawnPos select 1, (_spawnPos select 2)+600];
		_grouptype = [blufor_PLANE_FIGHTER_X];
	};
	case "VIETNAM": {
		_spawnPos = [(_spawnPos select 0)+250, _spawnPos select 1, (_spawnPos select 2)+200];
		_grouptype = [blufor_HELI_ATTACK_X];
	};
};

if (commandpointsblu1 < _cost) exitWith
{
	["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
	sleep 15;
	_hcAttChop = [player,"hc_ATTchop"] call BIS_fnc_addCommMenuItem;
	hcAttChop = _hcAttChop;
	AttChopInUse = false;
};

_group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
player hcsetgroup [_group,""];
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";
ctrlSetText [1000, format["%1",commandpointsblu1]];
DUWS_number_attackchopa = DUWS_number_attackchopa + 1;

switch (VERSION_X) do {
	case "MODERN": {
		_group setGroupId [format[localize "STR_DUWS_X_8mtxjfj3",DUWS_number_attackchopa]];
	};
	case "WW2": {
		_group setGroupId [format[localize "STR_DUWS_X_u01o9vpk",DUWS_number_attackchopa]];
		_waypoint0 = _group addwaypoint[getmarkerpos"respawn_west",0];
		_waypoint0 setwaypointtype "SAD";
	};
	case "VIETNAM": {
		_group setGroupId [format[localize "STR_DUWS_X_8mtxjfj3",DUWS_number_attackchopa]];
	};
};

hint localize "STR_DUWS_X_rjuehu36";
 
sleep 600;
_hcAttChop = [player,"hc_ATTchop"] call BIS_fnc_addCommMenuItem;
hcAttChop = _hcAttChop;
AttChopInUse = false;
    
