
//faction = "OPF_F"; faction = "BLU_F"; faction = "IND_F"; faction = "CIV_F";
//vehicleClass = "Armored" "Car" "Ship" "Static" "Air"
//hasDriver = 1;
//canFloat = 0;

_faction = _this select 0;
_vehClass = _this select 1;
_patrolCenter = _this select 2;
_radius = _this select 3;


// DETERMINE LA FACTION
_side = EAST; 

_vehpos = [_patrolCenter,100,200,15,0,0.5,0,[],[]] call BIS_fnc_findSafePos;

_car = selectRandomWeighted [
	opfor_ARMED_CAR1_X,1.0,
	opfor_ARMED_CAR1_X,1.0
];

_anyveh = "";
_airveh = "";
switch (VERSION_X) do {
	
	case "MODERN": {
		if (HeavyArmor == 1) then {
			_anyveh = selectRandomWeighted [
				opfor_COVERED_TRUCK_X,0.1,
				opfor_TRANS_TRUCK_X,0.1,
				opfor_AMMO_TRUCK_X,0.1,
				opfor_REPAIR_TRUCK_X,0.1,
				opfor_ARMED_CAR1_X,0.3,
				opfor_APC1_X,0.5,
				opfor_APC2_X,0.5,
				opfor_AA_APC_X,0.3,
				opfor_MBT_TANK1_X,0.5
			];
		} else {
			_anyveh = selectRandomWeighted [
				opfor_COVERED_TRUCK_X,0.1,
				opfor_TRANS_TRUCK_X,0.1,
				opfor_AMMO_TRUCK_X,0.1,
				opfor_REPAIR_TRUCK_X,0.1,
				opfor_ARMED_CAR1_X,1.0,
				opfor_APC1_X,1.0,
				opfor_APC2_X,1.0,
				opfor_AA_APC_X,0.5
			];
		};	
		
		_airveh = selectRandomWeighted [
			opfor_TRANS_HELI_X,1.0,
			opfor_ATTACK_HELI_X,1.0,
			opfor_MISC_AIR_X,1.0
		];
	};

	case "WW2": {
		if (HeavyArmor == 1) then {
			_anyveh = selectRandomWeighted [
				opfor_ARMED_CAR1_X,0.5,
				opfor_COVERED_TRUCK_X,0.1,
				opfor_TRANS_TRUCK_X,0.1,
				opfor_AMMO_TRUCK_X,0.1,
				opfor_REPAIR_TRUCK_X,0.1,
				opfor_APC1_X,0.5,
				opfor_APC2_X,0.5,
				opfor_AA_APC_X,0.9,
				opfor_MBT_TANK_X,1.0,
				opfor_MBT_TANK1_X,1.0,
				opfor_MBT_TANK2_X,1.0,
				opfor_MBT_TANK3_X,1.0,
				opfor_MBT_TANK4_X,1.0,
				opfor_MBT_TANK5_X,1.0
			];
		} else {
			_anyveh = selectRandomWeighted [
				opfor_ARMED_CAR1_X,0.5,
				opfor_COVERED_TRUCK_X,0.1,
				opfor_TRANS_TRUCK_X,0.1,
				opfor_AMMO_TRUCK_X,0.1,
				opfor_REPAIR_TRUCK_X,0.1,
				opfor_APC1_X,0.5,
				opfor_APC2_X,0.5,
				opfor_AA_APC_X,0.9
			];
		};
		
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
		if (HeavyArmor == 1) then {
			_anyveh = selectRandomWeighted [
				opfor_ARMED_CAR1_X,0.5,
				opfor_COVERED_TRUCK_X,0.1,
				opfor_TRANS_TRUCK_X,0.1,
				opfor_AMMO_TRUCK_X,0.1,
				opfor_REPAIR_TRUCK_X,0.1,
				opfor_APC1_X,0.5,
				opfor_APC2_X,0.5,
				opfor_APC3_X,0.5,
				opfor_APC4_X,0.5,
				opfor_APC5_X,0.5,
				opfor_APC6_X,0.5,
				opfor_AA_APC_X,0.9,
				opfor_MBT_TANK1_X,1.0,
				opfor_MBT_TANK2_X,1.0,
				opfor_MBT_TANK3_X,1.0,
				opfor_MBT_TANK4_X,1.0
			];
		} else {
			_anyveh = selectRandomWeighted [
				opfor_ARMED_CAR1_X,1.0,
				opfor_COVERED_TRUCK_X,0.1,
				opfor_TRANS_TRUCK_X,0.1,
				opfor_AMMO_TRUCK_X,0.1,
				opfor_REPAIR_TRUCK_X,0.1,
				opfor_APC1_X,1.0,
				opfor_APC2_X,1.0,
				opfor_APC3_X,0.5,
				opfor_APC4_X,0.5,
				opfor_APC5_X,0.5,
				opfor_APC6_X,0.5,
				opfor_AA_APC_X,1.0
			];
		};
		
		_airveh = selectRandomWeighted [
			opfor_TRANS_HELI_X,1.0,
			opfor_ATTACK_HELI_X,1.0,
			opfor_ATTACK_HELI1_X,1.0,
			opfor_ATTACK_HELI2_X,1.0,
			opfor_ATTACK_HELI3_X,1.0,
			opfor_MISC_AIR_X,1.0,
			opfor_PATROL_AIR_X,1.0,
			opfor_PATROL_AIR1_X,1.0,
			opfor_PATROL_AIR2_X,1.0,
			opfor_PATROL_AIR3_X,1.0,
			opfor_PATROL_AIR4_X,1.0
		];
	};
};

// Spawn the vehicle
_createdVehFnc = [];
if (_vehClass == "car") then {
	_createdVehFnc = [_vehpos,0,_car,_side] call bis_fnc_spawnvehicle;
} else {
	if (_vehClass == "air" && AttackHeli == 1) then {
		
		switch (VERSION_X) do {
	
			case "MODERN": {
				_vec =[random [-1,0,1], random [-1,0,1], 0];
				_dist = 500;
				_vehpos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _patrolCenter;
				_vehpos = [_vehpos select 0, _vehpos select 1, (_vehpos select 2)+800];
				_createdVehFnc = [_vehpos,0,_airveh,_side] call bis_fnc_spawnvehicle;
			};
		
			case "WW2": {
				_createdVehFnc = [[(_vehpos select 0)+1000, _vehpos select 1, 600],0,_airveh,_side] call bis_fnc_spawnvehicle;
			};
			case "VIETNAM": {
				_createdVehFnc = [_vehpos,0,_airveh,_side] call bis_fnc_spawnvehicle;
			};
		};
		
	} else {
		_createdVehFnc = [_vehpos,0,_anyveh,_side] call bis_fnc_spawnvehicle;
	};	
};

_veh = _createdVehFnc select 0 ;// vehicle object
//createVehicleCrew _veh;

if (_vehClass == "air" && AttackHeli == 1) then {
	
	switch (VERSION_X) do {
		case "MODERN": {
			_veh engineOn true;
			_veh flyInHeight 150;
		};
		case "WW2": {
			_veh engineOn true;
			_veh setVelocity [250,0,250];
			_veh flyInHeight 600;
		};
		case "VIETNAM": {
			_veh setPos [_vehpos select 0, _vehpos select 1, 300];// set height
			_veh engineOn true;
			_veh setVelocity [0,0,150];
			_veh flyInHeight 150;
		};
	};

};
	
_vehGroup = _createdVehFnc select 2;
_vehGroup deleteGroupWhenEmpty true;

//_patrolRadius = round(_radius/2);
_patrolRadius = _radius;

_vehGroup setCombatMode "YELLOW";

{
    _wp = _vehGroup addWaypoint [_patrolCenter, _patrolRadius];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointCompletionRadius 100;

	switch (VERSION_X) do {
		case "MODERN": {
			if (_vehClass != "air") then { _wp setWaypointTimeout [60, 61, 62] }; 
		};
		case "WW2": {
			if (_vehClass != "air") then { _wp setWaypointTimeout [300, 450, 600] }; 
		};
	};
} forEach [1, 2, 3];

_wp1 = _vehGroup addWaypoint [_patrolCenter, 100];
_wp1 setWaypointType "CYCLE";
_wp1 setWaypointBehaviour "SAFE";
_wp1 setWaypointSpeed "LIMITED";

sleep 5;

{
	if (_vehClass == "air" && VERSION_X == "MODERN") then {
		if !(("OPTRE" in BLUFOR_FactionFile_X) 
			or ("HL2ECR" in BLUFOR_FactionFile_X)
			or ("TIOW" in BLUFOR_FactionFile_X)) then {
			_x forceAddUniform "U_I_pilotCoveralls";
		};
	};
	_x setSkill opfor_ai_skill_random;
} foreach units _vehGroup;





