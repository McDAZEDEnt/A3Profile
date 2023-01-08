
WARCOM_blu_attack_wave_type = "";
WARCOM_blu_attack_wave_avalaible = false;

// Type of attack wave
[] spawn {

	diag_log format ["WARCOM_blufor_ap_assault: %1", WARCOM_blufor_ap];
		  
    waitUntil {sleep 30; WARCOM_blufor_ap>=10};
    [localize "STR_DUWS_X_vzjqx5tp"] spawn fnc_sideChat_filter;
    WARCOM_blu_attack_wave_avalaible = true;
    WARCOM_blu_attack_wave_type = (blufor_RECON_TEAM_X select 0);

    waitUntil {sleep 30; WARCOM_blufor_ap>40};          
    WARCOM_blu_attack_wave_type = (blufor_INF_SQUAD_X select 0); 
          
	// Different Compositions for Modern, WW2 and Vietnam
	switch (VERSION_X) do {
	
		case "MODERN": {
			waitUntil {sleep 30; WARCOM_blufor_ap>65};          
			WARCOM_blu_attack_wave_type = (blufor_MOTOR_SECTION_X select 0); 

			waitUntil {sleep 30; WARCOM_blufor_ap>100};
			while {WARCOM_blufor_ap<136} do {
				WARCOM_blu_attack_wave_type = selectRandom [
					(blufor_MECH_SECTION_X select 0),
					(blufor_MECH_SECTION_X select 0),
					(blufor_MOTOR_SECTION_X select 0)
				];
				sleep 30;
			};
			while {true} do {
				sleep 30;          
				WARCOM_blu_attack_wave_type = selectRandom [
					(blufor_ARMOR_SECTION_X select 0),
					(blufor_ARMOR_SECTION_X select 0),
					(blufor_MECH_SECTION_X select 0),
					(blufor_MOTOR_SECTION_X select 0)
				];
			};
		};
		
		case "WW2": {
			waitUntil {sleep 30; WARCOM_blufor_ap>65};          
			WARCOM_blu_attack_wave_type = [blufor_CAR_PATROL1_X];
          
			waitUntil {sleep 30; WARCOM_blufor_ap>100};          
			while {WARCOM_blufor_ap<136} do {
				WARCOM_blu_attack_wave_type = [selectRandom [blufor_APC_PATROL1_X,blufor_APC_PATROL2_X]];
				sleep 30;
			};
			while {true} do {
				sleep 30;          
				WARCOM_blu_attack_wave_type = [selectRandom [blufor_TANK_PATROL_X,blufor_TANK_PATROL1_X,blufor_TANK_PATROL2_X,blufor_TANK_PATROL3_X,blufor_TANK_PATROL4_X,blufor_TANK_PATROL5_X]];
			};
		};
		case "VIETNAM": {
			waitUntil {sleep 30; WARCOM_blufor_ap>65};          
			while {WARCOM_blufor_ap<136} do {
				WARCOM_blu_attack_wave_type = selectRandom [
						(blufor_SPEC_SQUAD_X select 0),
						(blufor_RECON_TEAM_X select 0),
						(blufor_INF_SQUAD_X select 0)
					];
				sleep 30;
			};
			while {true} do {
				sleep 30;          
				WARCOM_blu_attack_wave_type = selectRandom [
					(blufor_AA_TANK_SECTION_X select 0),
					(blufor_HEAVY_TANK_SECTION_X select 0),
					(blufor_ARMOR_SECTION_X select 0),
					(blufor_ARMOR_SECTION_X select 0),
					(blufor_MECH_SECTION_X select 0),
					(blufor_MOTOR_SECTION_X select 0)
				];
			};
		};
	};
};

// Attack waves main
[] spawn {
		  // WAIT 5 min before launching first assault
          waitUntil {sleep 300; WARCOM_blu_attack_wave_avalaible};  
		  // WAIT for Domination to reset zones
		  if (DUWS_MODE == "DOMINATION") then {
			  waitUntil {sleep 30; count WARCOM_zones_controled_by_OPFOR > 0};
		  };

          while {true} do {

			// WAIT for Hardcore to find a zone
			if (hardcore_mode_enable) then {
				waitUntil {sleep 5;hardcore_visibleZone_found};
				diag_log format ["BLUFOR ASSAULT. WARCOM_blu_attack_wave_type: %1", WARCOM_blu_attack_wave_type];
				sleep 30;
			};
		  
		  
			// Find a safe position
			_pos = [[(WARCOM_blu_hq_pos select 0), (WARCOM_blu_hq_pos select 1)],200,300,15,0,0.3,0,[],[]] call BIS_fnc_findSafePos;
		  
			_group = "";
			_group = [_pos, WEST, WARCOM_blu_attack_wave_type,[],[],blufor_ai_skill] call BIS_fnc_spawnGroup;
			if (WARCOM_blufor_ap>65) then {
				switch (VERSION_X) do {
					case "WW2": {
						sleep 5;
						_addgroup = [_pos, WEST, (blufor_RECON_TEAM_X select 0),[],[],blufor_ai_skill] call BIS_fnc_spawnGroup;
						sleep 5;
						(units _addgroup) joinSilent _group;
					};
					case "VIETNAM": {
						if (WARCOM_blufor_ap<136) then {
							sleep 5;
							_addgroup = [_pos, WEST, (blufor_RECON_TEAM_X select 0),[],[],blufor_ai_skill] call BIS_fnc_spawnGroup;
							sleep 5;
							(units _addgroup) joinSilent _group;
						};
					};
				};
			};
			_groupLeader = leader _group;
			_veh = vehicle _groupLeader;
			_group addVehicle _veh;
			_group deleteGroupWhenEmpty true;
			sleep 30;

			{
				_x allowDamage false;
			} forEach (units _group);
			
			_TFname = [1] call fnc_random_name;
			waitUntil {sleep 0.1;!isNil "_TFname"};
			sleep 2;
			
			[format[localize "STR_DUWS_X_7y9is2hm",_TFname]] spawn fnc_sideChat_filter;
			sleep 10; // give squads a chance to mount up
			[_group] spawn fnc_WARCOM_wp_blu_assault;
			[_group,_TFname] spawn fnc_WARCOM_gps_marker;

			sleep 5;
			{
				_x allowDamage true;
			} forEach (units _group);

			//sleep WARCOM_blu_attack_delay;   // 1800 sec
			sleep 1800;//floor (random [1800,2700,3600]);	// next assault delay Rand 30-60 min
          };
};
