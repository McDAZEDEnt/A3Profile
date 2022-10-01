private["_units","_info","_bomberTypes","_c","_sideT","_side","_a","_count","_activationDistance","_power","_triggerDistance","_pos","_roads","_group","_tries","_yell","_yellChance"];
_units=[(_this select 0),["Man","Landvehicle"],200]call dmp_fnc_GetUnits;
_info=_this select 1;

_bomberTypes=[];
{
if(_x isKindOf"MAN")then{_bomberTypes pushBack(typeOf _x)};
}forEach _units;
sleep .3;

if((count _bomberTypes)==0)then{_bomberTypes=["C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_journalist_F","C_Marshal_F","C_man_w_worker_F","C_man_p_beggar_F","C_Man_casual_1_F","C_Man_casual_2_F","C_Man_casual_3_F","C_man_sport_1_F","C_man_sport_2_F","C_man_sport_3_F","C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F","C_man_polo_2_F","C_Man_ConstructionWorker_01_Red_F","C_Man_Fisherman_01_F","C_man_hunter_1_F","C_Journalist_01_War_F","C_Man_Messenger_01_F","C_Man_Paramedic_01_F","C_scientist_F","C_Man_UtilityWorker_01_F","C_Nikos_aged","C_Story_Mechanic_01_F","C_Nikos","C_Orestes"]};

{
if(_x isKindOf"MAN")then{deleteVehicle _x}else{
	{deleteVehicle _x}forEach(crew _x);
	deleteVehicle _x;
};
sleep .1;
}forEach _units;

if!(call dmp_fnc_Proceed)exitWith{};

_c=0;
_sideT=_info select _c;_c=_c+1;
_side=EAST;if(_sideT=="WEST")then{_side=WEST};if(_sideT=="RESISTANCE")then{_side=RESISTANCE};
_a=(_info select _c)call dmp_fnc_ParseArray;_count=_a call BIS_fnc_randomInt;_c=_c+1;
_activationDistance=_info select _c;_c=_c+1;
_triggerDistance=_info select _c;_c=_c+1;
_power=_info select _c;_c=_c+1;
_yell=_info select _c;_c=_c+1;
_yellChance=_info select _c;_c=_c+1;

_pos=[];
_roads=[];
_vehicle=objNull;
_group=grpNull;
_tries=0;
while{_count>0}do{
	_tries=10;
	while{_tries>0}do{
		_pos=selectRandom dmpLocations;
		_roads=(_pos nearRoads 300);
		if((count _roads)>0)exitWith{
			_pos=getPos(selectRandom _roads);
			if(_pos call dmp_fnc_BlacklistCheck)then{
				[_pos,_side,_activationDistance,_triggerDistance,_bomberTypes,_power,_yell,_yellChance]execVM"DMP\Scripts\SuicideBomber\AI.sqf";
				//[_pos,_side,_activationDistance,_triggerDistance,_bomberTypes,_power]execVM"SB\AI.sqf";
				_tries=0;
			};
		};
		_tries=_tries-1;
		sleep .1;
	};
	_count=_count-1;
	sleep .3;
};