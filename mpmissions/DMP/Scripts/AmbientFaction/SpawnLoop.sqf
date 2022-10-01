// Drongo's Ambient Population
private["_c","_factionName","_side","_chance","_distance","_groupSize","_garrisonChance","_allowAir","_stayCleared","_script","_squadLeaders","_infantry","_count","_regMen","_regBuildings","_players","_buildings","_group","_man","_building","_remove","_exit"];
if!(isServer)exitWith{};
_c=0;
//hintc format["%1",_this];

_factionName=_this select _c;_c=_c+1;
_side=_this select _c;_c=_c+1;
_chance=_this select _c;_c=_c+1;
_distance=_this select _c;_c=_c+1;
_groupSize=_this select _c;_c=_c+1;
_garrisonChance=_this select _c;_c=_c+1;
_allowAir=_this select _c;_c=_c+1;
_stayCleared=_this select _c;_c=_c+1;
_script=_this select _c;_c=_c+1;
_squadLeaders=(_this select _c)select 0;_infantry=(_this select _c)select 1;_c=_c+1;

_count=0;
// Registered men
_regMen=[];
// Registered buildings
_regBuildings=[];
_players=[];
_building=objNull;
_buildings=[];
_group=grpNull;
_man=objNull;
_building=objNull;
_remove=TRUE;
_exit=FALSE;
while{TRUE}do{
	_players=call BIS_fnc_listPlayers;
	if!(_allowAir)then{{if((vehicle player)isKindOf"AIR")then{_players=_players-[_x]}}forEach _players};
	{
		_buildings=nearestObjects[getPos _x,["Building"],_distance];
		// Remove closed buildings
		{if(count([_x]call BIS_fnc_buildingPositions)==0)then{_buildings=_buildings-[_x]}}forEach _buildings;
		// Check if buildings already registered
		{if(_x in _regBuildings)then{_buildings=_buildings-[_x]}}forEach _buildings;
		{
			_regBuildings pushBack _x;
			if((getPos _x)call dmp_fnc_BlacklistCheck)then{
				if((random 100)<_chance)then{
					_exit=FALSE;
					_building=_x;
					{if((_x distance2D _building)<50)then{_exit=TRUE}}forEach _players;
					if(_exit)exitWith{};
					_group=createGroup _side;
					(selectRandom _squadLeaders)createunit[getPosASL _x,_group,"",1,"SERGEANT"];
					_count=(_groupSize call BIS_fnc_RandomInt)-1;
					//systemChat format["_count: %1",_count];
					while{_count>0}do{
						(selectRandom _infantry)createunit[getPosASL _x,_group,"",1,"PRIVATE"];
						_count=_count-1;
						sleep .25;
					};
					{_regMen pushBack _x}forEach(units _group);
					if((random 100)<_garrisonChance)then{[_group,5]execVM"DMP\Scripts\AI\Garrison.sqf"}else{[_group,getPos _x,400]call BIS_fnc_taskPatrol};
					if!(_script=="")then{{_x execVM _script}forEach units _group};
					{_x setVariable["dmpAItype","AmbientFaction",TRUE]}forEach units _group;
					{_x setVariable["dmpFaction",_factionName,TRUE]}forEach units _group;
					if(dmpDebug)then{[_group,"Ambient"]execVM"DMP\Scripts\AI\Track.sqf"};
					//sleep 2;
				};
			};
		}forEach _buildings;
	}forEach _players;
	// Despawn check
	if!(_stayCleared)then{
		{
			_building=_x;
			_remove=true;
			{if((_x distance2D _building)<_distance)then{_remove=false}}forEach _players;
			if(_remove)then{_regBuildings=_regBuildings-[_building]};
		}forEach _regBuildings;
	};
	{
		_man=_x;
		_remove=true;
		{if((_x distance2D _man)<_distance)then{_remove=false}}forEach _players;
		if(_remove)then{_regMen=_regMen-[_man];deleteVehicle _man};
	}forEach _regMen;
	sleep 10;
};