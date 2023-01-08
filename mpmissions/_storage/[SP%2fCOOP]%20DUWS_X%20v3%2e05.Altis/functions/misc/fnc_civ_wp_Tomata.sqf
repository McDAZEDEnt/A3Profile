_bldgUnits =_this select 0;
_usableBuildings = _this select 1;
//{
//	_x setBehaviour "CARELESS";
//	_x setCombatMode "BLUE";
//} forEach _bldgUnits;

{
	_building = selectRandom _usableBuildings;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_randPos = [1,(count _positions)-1] call BIS_fnc_randomInt;
	_wp1 = _x addWaypoint [(_building buildingPos _randPos),2];
    _wp1 setWaypointType "MOVE";
	_wp1 setWaypointSpeed "LIMITED";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointCombatMode "GREEN";
	_wp1 setWaypointTimeout [60, 90, 120]; 
	_wp1 setWaypointCompletionRadius 5;

} forEach _bldgUnits;

{
	_building = selectRandom _usableBuildings;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_randPos = [1,(count _positions)-1] call BIS_fnc_randomInt;
	_wp2 = _x addWaypoint [(_building buildingPos _randPos),2];
    _wp2 setWaypointType "MOVE"; 
	_wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointCombatMode "GREEN";
	_wp2 setWaypointTimeout [60, 90, 120]; 
	_wp2 setWaypointCompletionRadius 5;
	
} forEach _bldgUnits;

{
	_wp3 = _x addWaypoint [getpos leader _x, 2];
	_wp3 setWaypointType "CYCLE";
	_wp3 setWaypointSpeed "LIMITED";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointCombatMode "GREEN";
	_wp3 setWaypointCompletionRadius 5;
	
} forEach _bldgUnits;
