_place   =   _this select 0; 
_points =   _this select 1;
_markername = _this select 2;
_markername2 = _this select 3;
_triggerPos = _this select 4;
_flagPos = _triggerPos;
_radius = _this select 5;

if (_triggerPos in WARCOM_zones_controled_by_BLUFOR) exitWith {};

/*
// 3 BLUFOR units must be on the ground to capture
_westUnits = [];
_count_blu = 0;
_blufor_close = false;

{
	if ((side _x) == WEST) then {
		_westUnits pushBack _x;
	};
} forEach allUnits;

{
	if ((_triggerPos distance _x) < _radius) then {  
		//hint format ["Count blufor close: %1", str _count_blu];
		if ((getpos vehicle _x) select 2 < 2) then {  //not in air
			_count_blu = _count_blu + 1;
		};
		// wait until more than 2 BLUFOR to prevent capture from the air
		// and force zone spawns
		// hint format ["Count blufor close: %1", str _count_blu];
		if (_count_blu > 2) then {_blufor_close = true;};  
	};
	if (_blufor_close) exitWith {};
} forEach _westUnits;

// Exit capture if no blufor on the ground
if (!_blufor_close) exitWith {
	//// RESET THE TRIGGER
	private "_trg";
	// RECALL VARNAME FOR ZONE TRIGGER --> use the pos of the trigger
	call compile format["_trg = trigger%1%2",round (_triggerPos select 0),round (_triggerPos select 1)];

	_trg setTriggerActivation["WEST SEIZED","PRESENT",true];
	_trg setTriggerStatements["this", format["[""%1"",%2,""%3"",""%4"",%5,%6] spawn fnc_blufor_cap",_place,_points,_markername,_markername2,_triggerPos,_radius], ""];
};
*/
amount_zones_captured = amount_zones_captured + 1;
publicVariable "amount_zones_captured";

["us_takencontrol",[_place,""]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated,false];

// MODIFY NUMBER OF CONTROLLED ZONES
zoneundercontrolblu = zoneundercontrolblu + 1;
publicVariable "zoneundercontrolblu";

// TELL THE ZONE IS UNDER BLU CONTROL
WARCOM_zones_controled_by_BLUFOR = WARCOM_zones_controled_by_BLUFOR + [_triggerPos];
publicVariable "WARCOM_zones_controled_by_BLUFOR";

// REMOVE A ZONE FROM OPFOR CONTROL
_index = 0;
{
	if ((_x select 0 == _triggerPos select 0) && (_x select 1 == _triggerPos select 1)) exitWith {
		WARCOM_zones_controled_by_OPFOR deleteAt _index;
	}; 
	_index = _index + 1;
} forEach WARCOM_zones_controled_by_OPFOR;
publicVariable "WARCOM_zones_controled_by_OPFOR";

// Pause TFs if no opfor zones are visible
if (hardcore_mode_enable) then {
	hardcore_visibleZone_found = false;
	{
		_curr_zone = _x;
		{
			// check zone_name_pairs for any opfor zones that are still red
			if (str (_x select 1) == str (_curr_zone) && (_x select 2 == true)) then {
				hardcore_visibleZone_found = true;
			};
		} forEach zone_namePOS_pairs;
	} forEach WARCOM_zones_controled_by_OPFOR;
};

// MODIFY ARMY POWER - OPF gains 1/2 the points, BLU gains full points
_opfreward = round(_points/2);
WARCOM_opfor_ap = WARCOM_opfor_ap + _opfreward;
WARCOM_blufor_ap = WARCOM_blufor_ap + _points;
publicVariable "WARCOM_opfor_ap";
publicVariable "WARCOM_blufor_ap";

// ADD Skill to operatives
[] spawn fnc_operative_mission_complete; 

// MODIFY MARKER ICON
str(_markername) setMarkerColor "ColorGreen";
// hint str(_markername);
// MODIFY MARKER ELLIPSE
str(_markername2) setMarkerColor "ColorGreen";

// ADD POINTS
_points = round(_points/3);
commandpointsblu1 = commandpointsblu1 + _points;
publicVariable "commandpointsblu1";

["CPadded",[_points,""]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated,false];

// IF MODERN or SIMPLE ZONES, CHANGE THE ZONE FLAG TO BLUE
if (VERSION_X == "MODERN" || simple_zones_enable) then {
	private "_flg";
	call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
	_flg setFlagTexture "\A3\Data_F\Flags\flag_blue_CO.paa";
};

// RECALL VARNAME FOR ZONE TRIGGER --> use the pos of the trigger
private "_trg";
call compile format["_trg = trigger%1%2",round (_triggerPos select 0),round (_triggerPos select 1)];
//// MAKE THE TRIGGER CAPTURABLE FOR OPFOR
_trg setTriggerActivation["EAST SEIZED","PRESENT",true];
_trg setTriggerStatements["this", format["[""%1"",%2,""%3"",""%4"",%5,%6] spawn fnc_opfor_cap",_place,_points,_markername,_markername2,_triggerPos,_radius], ""];


