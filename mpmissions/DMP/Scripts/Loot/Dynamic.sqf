private["_players","_buildings","_allBuildings","_add"];
if!(isServer)exitWith{};
_players=call dmp_fnc_ListPlayers;
_players=_players-(entities"HeadlessClient_F");
_buildings=[];
_allBuildings=[];
_add=TRUE;
{
_buildings=_x nearObjects["House",200];
	{
	_add=TRUE;
	if(TRUE)then{
		if(_x in dmpAllBuildings)exitWith{_add=FALSE};
		if((getDammage _x)>.7)exitWith{_add=FALSE};
		if((count([_x]call BIS_fnc_buildingPositions))==0)exitWith{_add=FALSE};
	};
	if(_add)then{_allBuildings pushBackUnique _x};
	}forEach _buildings;
}forEach _players;
{_x call dmp_fnc_AddBuilding}forEach _allBuildings;
sleep 20;
execVM"DMP\Scripts\Loot\Dynamic.sqf";