// Drongo's Civilian Population
private["_c","_chance","_garrisonChance","_distance","_script","_manTypes","_regCivs","_regBuildings","_players","_buildings","_group","_man","_building","_remove","_groupSize","_count"];
if!(isServer)exitWith{};
_c=0;
_chance=_this select _c;_c=_c+1;
_garrisonChance=_this select _c;_c=_c+1;
_distance=_this select _c;_c=_c+1;
_script=_this select _c;_c=_c+1;
_groupSize=_this select _c;_c=_c+1;
_manTypes=[];
while{((count dmpTypesCivilian)==0)}do{sleep .3};
_manTypes=dmpTypesCivilian;
// Registered men
_regCivs=[];
// Registered buildings
_regBuildings=[];
_players=[];
_buildings=[];
_group=grpNull;
_man=objNull;
_building=objNull;
_remove=true;
_count=0;
_pos=[];
while{TRUE}do{
	_players=call BIS_fnc_listPlayers;
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
					_group=createGroup CIVILIAN;
					_count=_groupSize call BIS_fnc_RandomInt;
					while{TRUE}do{
						if(_count<1)exitWith{};
						(selectRandom _manTypes)createunit[getPosASL _x,_group,"",1,"PRIVATE"];
						_count=_count-1;
					};
					if((random 100)<_garrisonChance)then{[_group,3]execVM"DMP\Scripts\Civilians\Garrison.sqf"}else{
						[_group,getPos _x,400]call BIS_fnc_taskPatrol;
						if((random 100)<50)then{{_x setWaypointType"DISMISS"}forEach(waypoints _group)};
						_pos=getPos(leader _group);
						_pos=[_pos select 0,_pos select 1,5];
						{_x setVehiclePosition[_pos,[],0,"none"]}forEach(units _group);
					};
					{
						_regCivs pushBack _x;
						_x disableAI"TARGET";
						_x disableAI"AUTOTARGET";
						_x disableAI"WEAPONAIM";
						//_x disableAI"CHECKVISIBLE";
						_x disableAI"MINEDETECTION";
						_x disableAI"NVG";
						_x disableAI"LIGHTS";
					}forEach(units _group);
					_group setFormation(selectRandom["FILE","LINE","VEE","WEDGE"]);
					_group setSpeedMode"FULL";
					_group setBehaviour"SAFE";
					if!(_script=="")then{{_x execVM _script}forEach units _group};
					{_x execVM"DMP\Scripts\Civilians\PrepCiv.sqf"}forEach units _group;
					{_x setVariable["dmpAItype","Civilian",TRUE]}forEach units _group;
					if(dmpDebug)then{[_group,"CIV"]execVM"DMP\Scripts\AI\Track.sqf"};
				};
			};
		}forEach _buildings;
	}forEach _players;
	// Despawn check
	{
		_building=_x;
		_remove=true;
		{if((_x distance2D _building)<_distance)then{_remove=false}}forEach _players;
		if(_remove)then{_regBuildings=_regBuildings-[_building]};
	}forEach _regBuildings;
	{
		_man=_x;
		_remove=true;
		{if((_x distance2D _man)<_distance)then{_remove=false}}forEach _players;
		if(_remove)then{_regCivs=_regCivs-[_man];_x removeAllMPEventHandlers"mpkilled";deleteVehicle _man};
	}forEach _regCivs;
	sleep 10;
};