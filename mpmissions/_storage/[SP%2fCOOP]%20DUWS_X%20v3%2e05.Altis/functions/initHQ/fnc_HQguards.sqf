
_centerPos = _this select 0;
_safe = [(_centerPos select 0)+50, (_centerPos select 1)+50];
_hq = _this select 1;
sleep 20;

diag_log format["fnc_HQguards"];

// Create the guards

_groupGuard = [[0,0], WEST, [blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X],[],[],blufor_ai_skill] call BIS_fnc_spawnGroup; 
_groupGuard deleteGroupWhenEmpty true;

_HQguard1 = units _groupGuard select 0;
//_HQguard1 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
_HQguard2 = units _groupGuard select 1;
//_HQguard2 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
_HQguard3 = units _groupGuard select 2;
//_HQguard3 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
_HQguard4 = units _groupGuard select 3;
//_HQguard4 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 10;

switch (VERSION_X) do {
	case "MODERN": {
		_HQguard1 setPosATL [(_centerPos select 0)-6.5, (_centerPos select 1)-1.6,0.3];
		_HQguard1 setdir 270;
		[_HQguard1,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;
		_HQguard2 setPosATL [(_centerPos select 0)-6.5, (_centerPos select 1)-4.7,0.3];
		_HQguard2 setdir 270;
		[_HQguard2,"STAND_IA","FULL"] call BIS_fnc_ambientAnimCombat;
		_HQguard3 setPosATL [(_centerPos select 0), (_centerPos select 1)-7.7,0.3];
		_HQguard3 setdir 180;
		[_HQguard3,"LEAN","FULL"] call BIS_fnc_ambientAnimCombat;
		_HQguard4 setPosATL [(_centerPos select 0), (_centerPos select 1)-9,0.3];
		_HQguard4 setdir 0;
		[_HQguard4,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;
	};
	case "WW2": {
		_HQguard1 setPosATL [(_centerPos select 0)+1.8, (_centerPos select 1)+5.8,0];
		_HQguard1 setdir 10;
		_HQguard2 setPosATL [(_centerPos select 0)+4.4, (_centerPos select 1)+5.8,0];
		_HQguard2 setdir 10;
		_HQguard3 setPosATL [(_centerPos select 0)+1.2, (_centerPos select 1)-5.8,0];
		_HQguard3 setdir 140;
		_HQguard4 setPosATL [(_centerPos select 0)+1.2, (_centerPos select 1)-9,0];
		_HQguard4 setdir 0;
	};
	case "VIETNAM": {
		_HQguard1 setPosATL [(_centerPos select 0)-8.8, (_centerPos select 1)-1.3,0];
		_HQguard1 setdir 270;
		_HQguard2 setPosATL [(_centerPos select 0)-9, (_centerPos select 1)-4.3,0];
		_HQguard2 setdir 270;
		_HQguard3 setPosATL [(_centerPos select 0)+1.9, (_centerPos select 1)+12.6,0];
		_HQguard3 setdir 170;
		_HQguard4 setPosATL [(_centerPos select 0)+1.5, (_centerPos select 1)+10.7,0];
		_HQguard4 setdir 0;
	};
};

[_groupGuard, _centerPos] call bis_fnc_taskDefend;

// Patrolling Guard

_groupPatrol = [_safe, WEST, [blufor_SOLDIER_X],[],[],blufor_ai_skill] call BIS_fnc_spawnGroup; 
_groupPatrol deleteGroupWhenEmpty true;
_HQguard5 = units _groupGuard select 0;
_HQguard5 setVariable ["Vcm_Disable",true];
//_HQguard5 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_groupPatrol setCombatMode "WHITE";
_wp1 = _groupPatrol addWaypoint [[(_centerPos select 0)+11, (_centerPos select 1)+11], 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "SAFE";
_wp1 setWaypointSpeed "LIMITED";

_wp2 = _groupPatrol addWaypoint [[(_centerPos select 0)-11, (_centerPos select 1)+11], 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "SAFE";
_wp2 setWaypointSpeed "LIMITED";

_wp3 = _groupPatrol addWaypoint [[(_centerPos select 0)-11, (_centerPos select 1)-11], 0];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointBehaviour "SAFE";
_wp3 setWaypointSpeed "LIMITED";

_wp4 = _groupPatrol addWaypoint [[(_centerPos select 0)+11, (_centerPos select 1)-11], 0];
_wp4 setWaypointType "MOVE";

_wp5 = _groupPatrol addWaypoint [[(_centerPos select 0)+11, (_centerPos select 1)+11], 0];
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointBehaviour "SAFE";
_wp5 setWaypointSpeed "LIMITED";

[_hq,[localize "STR_DUWS_X_qxhure3n", fnc_reguardHQ, [_groupGuard, _groupPatrol, _centerPos, _hq], 0, true, true, "", "_this == player"]] remoteExec ["addAction",[0,-2] select isDedicated,[false,true] select isDedicated];
