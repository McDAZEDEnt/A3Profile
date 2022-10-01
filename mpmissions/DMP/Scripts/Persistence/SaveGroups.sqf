private["_groupInfo","_manInfo","_groupInfoAll","_groups","_group","_vehicleInfo","_vehicles","_waypointInfo","_units"];
_groupInfo=[];
_manInfo=[];
_groupInfoAll=[];
_groups=[];
_groups=allGroups;
_group=grpNull;
_vehicleInfo=[];
_vehicles=[];
_waypointInfo=[];
_units=[];
// Remove player groups
{
_group=_x;
{if(isPlayer _x)then{_groups=_groups-[group _x]}}forEach(units _group);
if(_x getVariable"dmpDontSave")then{_groups=_groups-[_x]};
if!((side _x)in dmpSaveSides)then{_groups=_groups-[_x]};
}forEach _groups;
// Add arrays of each group
{
_group=_x;
_vehicles=[];
{if!((vehicle _x)==_x)then{_vehicles pushBackUnique(vehicle _x)}}forEach(units _group);
_groupInfo=[];
_vehicleInfo=_group call dmp_fnc_GroupVehiclesSaveInfo;
_groupInfo pushBack _vehicleInfo;
_manInfo=[];
_units=(units _group);
{if(_x getVariable"dmpDontSave")then{_units=_units-[_x]}}forEach _units;
{if(alive  _x)then{_manInfo pushBack([_x,_vehicles]call dmp_fnc_SaveManInfo)}}forEach _units;
_groupInfo pushBack _manInfo;
_waypointInfo=[];
{_waypointInfo pushBack[getWPpos _x,waypointType _x]}forEach(waypoints _group);
_groupInfo pushBack _waypointInfo;
_groupInfoAll pushBack _groupInfo;
}forEach _groups;
dmpGroupInfo=[];
dmpGroupInfo=_groupInfoAll;
_groupInfoAll

/*
_groupInfo format is
[
[array of vehicles],
[array of manInfo],
[array of WP info]
];