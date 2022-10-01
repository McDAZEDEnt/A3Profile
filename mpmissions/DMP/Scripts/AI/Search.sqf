private["_group","_pos","_building","_positions","_buildings","_buildings2"];
_group=_this select 0;
_pos=_this select 1;
_building=objNull;
_positions=[];
_buildings=nearestObjects[_pos,["Building"],100];
if((count _buildings)<1)exitWith{
	while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
	sleep 1;
	_group addWaypoint[_pos,0];
	_group addWaypoint[_pos,1];
	{_x setWaypointType"SAD"}forEach(waypoints _group);
};
_buildings2=_buildings;
{_x setVariable["dmpSearching",TRUE,TRUE]}forEach units _group;
sleep 1;
while{TRUE}do{
	if(isNil{(leader _group)getVariable"dmpSearching"})exitWith{};
	if!((leader _group)getVariable"dmpSearching")exitWith{};
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	if((count _buildings2)==0)then{_buildings2=_buildings};
	if((count _buildings)==0)then{
		while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
		sleep 1;
		_group addWaypoint[_pos,0];
		_group addWaypoint[_pos,1];
		{_x setWaypointType"SAD"}forEach(waypoints _group);
	}else{
		_building=selectRandom _buildings2;
		_buildings2=_buildings2-[_building];
		_positions=[_building]call BIS_fnc_buildingPositions;
		if((count _positions)>1)then{
			{_x doMove(selectRandom _positions)}forEach units _group;sleep 30;
			{_x doMove(selectRandom _positions)}forEach units _group;sleep 30;
			{_x doMove(selectRandom _positions)}forEach units _group;sleep 30;
		};
	};
	sleep 10;
};