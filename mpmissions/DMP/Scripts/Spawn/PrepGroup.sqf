if(dmpCVPman==0)exitWith{};
if!(isServer)exitWith{};
private["_group","_vehicles","_vehicle"];
_group=_this;
sleep 3;
{_x execVM"DMP\Scripts\Spawn\PrepMan.sqf"}forEach(units _group);
_vehicles=[];
_vehicle=objNull;
{
_vehicle=vehicle _x;
if!(_vehicle==_x)then{if!(_vehicle in _vehicles)then{_vehicles pushBack _vehicle}};
}forEach units _group;
{_x execVM"DMP\Scripts\Spawn\PrepVehicle.sqf"}forEach _vehicles;