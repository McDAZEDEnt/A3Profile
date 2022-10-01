private["_group","_pos"];
_group=_this select 0;
_pos=_this select 1;
//_pos=getPos(selectRandom dmpLocations);
//if((count dmpLocations)>0)then{_pos=getPos(selectRandom dmpLocations)}else{_pos=[(getMarkerPos(selectRandom dmpRemoteAreas)),700]call dmp_fnc_ScatterCircle};
if((count dmpLocations)>0)then{_pos=selectRandom dmpLocations}else{_pos=[(selectRandom dmpRemoteAreas),700]call dmp_fnc_ScatterCircle};
_group setCombatMode"RED";
_group setBehaviour"SAFE";
_group setFormation"FILE";
(vehicle leader _group)flyInHeight(50+(random 150));
sleep 1;
{deleteWaypoint _x}forEach(waypoints _group);
_group addWaypoint[_pos,0];
{_X setWaypointType"GUARD"}forEach(waypoints _group);
sleep 10;
{_x setDammage 0;(vehicle _x)setDammage 0}forEach units _group;
sleep 20;
{_x setDammage 0;(vehicle _x)setDammage 0}forEach units _group;
while{true}do{
	if({alive _x}count(units _group)==0)exitWith{};
	if(((leader _group)distance2D _pos)<200)then{
		{deleteWaypoint _x}forEach(waypoints _group);
		_group addWaypoint[_pos,0];
		{_x setWaypointType"SAD"}forEach(waypoints _group);
		sleep([60,180]call BIS_fnc_randomInt);
		if({alive _x}count(units _group)==0)exitWith{};	
		//if(((random 10)>5)AND((count dmpLocations)>0))then{_pos=getPos(selectRandom dmpLocations)}
		if(((random 10)>5)AND((count dmpLocations)>0))then{_pos=selectRandom dmpLocations}
		else{_pos=[(selectRandom dmpRemoteAreas),700]call dmp_fnc_ScatterCircle};
		{deleteWaypoint _x}forEach(waypoints _group);
		_group addWaypoint[_pos,0];
		{_x setWaypointType"GUARD"}forEach(waypoints _group);
	};
	sleep 20;
};