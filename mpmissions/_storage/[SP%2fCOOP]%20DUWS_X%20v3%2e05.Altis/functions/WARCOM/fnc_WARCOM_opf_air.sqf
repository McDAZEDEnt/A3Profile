// Random air Infinite loop

if (AttackHeli == 0) exitWith {};

_opfor_randAir = []; // array of randAir assets
WARCOM_opf_air = true;

while {true} do {

	// Wait until opfor AP > 150
	waitUntil {sleep 30;WARCOM_opfor_ap > 150};
	
	// make sure opfor is controlling at least 2 zones 
	// and opfor air is less than 2
	_count_opfor_randAir = 0;
	{
		if (alive _x) then {_count_opfor_randAir = _count_opfor_randAir + 1};
	} forEach _opfor_randAir;
			
	if (_count_opfor_randAir == 0) then {_opfor_randAir = []};
			
	if (count WARCOM_zones_controled_by_OPFOR > 1 && _count_opfor_randAir < 2) then {
		
		// if Hardcore Mode, 1 zone should be visible
		if (hardcore_mode_enable == true && hardcore_visibleZone_found == false) then {
			waitUntil {sleep 10;hardcore_visibleZone_found};
		};
		
		sleep 2;
			  
		// find a zone where to spawn OPF air *** BEGIN
		_found = false;
		_randomZone = [];
		_failSafe = 0;
		while {!_found} do {
			_randomZone = WARCOM_zones_controled_by_OPFOR call BIS_fnc_selectRandom;
			{
				if (_randomZone distance _x > 1500) then {
					_found=true;
				} else {
					_found=false;
				};
			} forEach allPlayers;
			sleep 0.2;
			_failSafe = _failSafe + 1;
			if (_failsafe > 10) then {sleep 300; _failsafe = 0;}
		};
		// find a zone *** end 
			  	
		// spawn air
		_airveh = "";
		switch (VERSION_X) do {
			case "MODERN": {
				_airveh = selectRandomWeighted [
					opfor_TRANS_HELI_X,1.0,
					opfor_ATTACK_HELI_X,1.0,
					opfor_MISC_AIR_X,0.7
				];
			};
			
			//Dang Edit extra planes for secret weapons	
			case "WW2": {
				_airveh = selectRandomWeighted [
					opfor_PLANE_PATROL_X,1.0,
					opfor_PLANE_PATROL1_X,1.0,
					opfor_PLANE_PATROL2_X,1.0,
					opfor_PLANE_PATROL3_X,1.0,
					opfor_PLANE_PATROL4_X,1.0,
					opfor_PLANE_PATROL5_X,0.7,
					opfor_PLANE_PATROL6_X,0.5
				];
			};
			case "VIETNAM": {
				_airveh = selectRandomWeighted [
					opfor_ATTACK_HELI_X,0.5,
					opfor_ATTACK_HELI1_X,0.6,
					opfor_MISC_AIR_X,0.8,
					opfor_PATROL_AIR_X,0.8,
					opfor_PATROL_AIR1_X,0.6,
					opfor_PATROL_AIR2_X,0.6,
					opfor_PATROL_AIR3_X,0.6,
					opfor_PATROL_AIR4_X,0.6
				];
			};
		};
		
		// Spawn the vehicle
		_createdVehFnc = [];
		_vec =[random [-1,0,1], random [-1,0,1], 0];
		_dist = 500;
		_vehpos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _randomZone;
		_vehpos = [_vehpos select 0, _vehpos select 1, (_vehpos select 2)+800];
		_createdVehFnc = [_vehpos,0,_airveh,EAST] call bis_fnc_spawnvehicle;

		_veh = _createdVehFnc select 0 ;// vehicle object
		_opfor_randAir pushback _veh;// add vehicle to active air array

		_veh engineOn true;
		switch (VERSION_X) do {
			case "MODERN": {
				_veh flyInHeight 150;
			};
			case "WW2": {
				_veh setvelocity [250,0,250];
				_veh flyInHeight 800;
			};
			case "VIETNAM": {
				_veh setPos [_randomZone select 0, _randomZone select 1, 300];// set height
				_veh engineOn true;
				_veh setVelocity [0,0,150];
				_veh flyInHeight 150;
			};
		};
		_veh setVehicleAmmo 0;
		_veh addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 0}];

		_vehGroup = _createdVehFnc select 2;
		_vehGroup deleteGroupWhenEmpty true;

		{
			if (VERSION_X == "MODERN") then {
				if !(("OPTRE" in BLUFOR_FactionFile_X) 
					or ("HL2ECR" in BLUFOR_FactionFile_X)
					or ("TIOW" in BLUFOR_FactionFile_X)) then {
					_x forceAddUniform "U_I_pilotCoveralls";
				};
			};
			_x setSkill opfor_ai_skill_random;
		} foreach units _vehGroup;

		// Set the waypoints
		//hint format["%1",_patrolRadius];
		[_vehGroup] spawn fnc_WARCOM_wp_opf_patrol;
	};

	sleep floor (random [1200,1800,2400]);	// next air delay Rand 20-40 min

};




