private["_groupInfo","_groupInfoAll","_groups","_leader"];
_groupInfo=[];
_manInfo=[];
_groupInfoAll=[];
_groups=[];
_groups=allGroups;
_vehicles=[];
//{if(_x isKindOf"Man")then{if!((group _x)in _groups)then{_groups pushBack(group _x)}}}forEach allUnits;

// Remove player groups
{
{if(isPlayer _x)then{_groups=_groups-[group _x]}}forEach units _x;
}forEach _groups;

// Add arrays of each group
{
_groupInfo=[];
_vehicles=_group call dmp_fnc_GroupVehiclesSaveInfo;
_groupInfo pushBack _vehicles;
{if(alive  _x)then{_manInfo pushBack([_x,_vehicles]call dmp_fnc_SaveManInfo)}}forEach units _x;
_groupInfo pushBack _manInfo;
_groupInfoAll pushBack _groupInfo;
}forEach _groups;
dmpGroupInfo=[];
dmpGroupInfo=_groupInfoAll;
_groupInfoAll

/* _groupInfo format is
[
[array of vehicles],
[array of manInfo]
];