
_cost = _this select 0;
_index = lbCurSel 2103;
CASInUse = true;

_spawnPos = getmarkerpos str blu_hq_markername;
_grouptype = [blufor_PLANE_CAS_X];

switch (VERSION_X) do {
	case "MODERN": {
		_vec =[random [-1,0,1], random [-1,0,1], 0];
		_dist = 500;
		_spawnPos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _spawnPos;
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2)+800];
	};
	case "WW2": {
		_spawnPos = [(_spawnPos select 0)+500, _spawnPos select 1, (_spawnPos select 2)+600];
	};
	case "VIETNAM": {
		_spawnPos = [(_spawnPos select 0)+500, _spawnPos select 1, (_spawnPos select 2)+500];
	};
};

if (commandpointsblu1 < _cost) exitWith
{
	["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
	sleep 15;
	_hcCAS = [player,"hc_CAS"] call BIS_fnc_addCommMenuItem;
	hcCAS = _hcCAS;
	CASInUse = false;
};

_group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
sleep 1;
_pilot = units _group select 0;
_vehicle = vehicle _pilot;
_vehicle engineOn true;

switch (VERSION_X) do {
	case "MODERN": {
		_vehicle flyInHeight 150;
	};
	case "WW2": {
		_vehicle setVelocity [250,0,250];
		_vehicle flyInHeight 500;
	};
	case "VIETNAM": {
		_vehicle flyInHeight 150;
	};
};

player hcsetgroup [_group,""];
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";
ctrlSetText [1000, format["%1",commandpointsblu1]];
DUWS_number_CAS = DUWS_number_CAS + 1;
_group setGroupId [format[localize "STR_DUWS_X_8mtxjfj3",DUWS_number_CAS]];
hint localize "STR_DUWS_X_gu6cbc5f";
			 
sleep 600;
_hcCAS = [player,"hc_CAS"] call BIS_fnc_addCommMenuItem;
hcCAS = _hcCAS;
CASInUse = false;
    



