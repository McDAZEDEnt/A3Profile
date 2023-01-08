_centerPos = _this select 0;

// patrolling guard
_groupPatrol = [ [(_centerPos select 0)+200, (_centerPos select 1)+200], WEST, [blufor_SOLDIER_X,blufor_SOLDIER_GL_X,blufor_SPECOPS_HAT_X,blufor_MARKSMAN_X,blufor_SOLDIER_AR_X,blufor_SPECOPS_X,blufor_SPECOPS_HAT_X,blufor_SPECOPS_AA_X],[],[],blufor_ai_skill] call BIS_fnc_spawnGroup;
_groupPatrol deleteGroupWhenEmpty true;

_groupPatrol setCombatMode "WHITE";
    _wp1 = _groupPatrol addWaypoint [[(_centerPos select 0)+75, (_centerPos select 1)+75], 0];
    _wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "LIMITED";

    _wp2 = _groupPatrol addWaypoint [[(_centerPos select 0)-75, (_centerPos select 1)+75], 0];
    _wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";	
	
    _wp3 = _groupPatrol addWaypoint [[(_centerPos select 0)-75, (_centerPos select 1)-75], 0];
    _wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "LIMITED";	

    _wp4 = _groupPatrol addWaypoint [[(_centerPos select 0)+75, (_centerPos select 1)-75], 0];
    _wp4 setWaypointType "MOVE";
	
    _wp5 = _groupPatrol addWaypoint [[(_centerPos select 0)+75, (_centerPos select 1)+75], 0];
    _wp5 setWaypointType "CYCLE";
	_wp5 setWaypointBehaviour "SAFE";
	_wp5 setWaypointSpeed "LIMITED";

// ADD InfiniteAmmo and NoDamage Eventhandlers
{
	_x setVariable ["Vcm_Disable",true];
	_x addEventHandler ["Fired",{(_this select 0) setvehicleammo 1}];
	_x addEventHandler ["HandleDamage", {0}];
} forEach (units _groupPatrol);
