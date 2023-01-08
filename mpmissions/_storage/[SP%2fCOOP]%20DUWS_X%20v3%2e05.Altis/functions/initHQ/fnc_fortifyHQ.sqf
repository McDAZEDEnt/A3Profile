

_centerPos = _this select 0;
_safe = [(_centerPos select 0)+50, (_centerPos select 1)+50];
_hq = _this select 1;
_refortify = _this select 2;
sleep 2;

diag_log format["fnc_fortifyHQ"];

_forty_spawn = {
	_name = _this select 0;
	_center = _this select 1;
	_offset = _this select 2;

	_newx = (_center select 0) + (_offset select 0);
	_newy = (_center select 1) + (_offset select 1);
	_newz = (_offset select 2);

	_new = createVehicle [_name, [0,0,0], [], 0, "CAN_COLLIDE"];
	_new allowdamage false;
	_new setPosATL [_newx, _newy, _newz];
	_new setdamage 0;
	_new
};

_groupGuard = [[0,0], WEST, [blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X],[],[],blufor_ai_skill] call BIS_fnc_spawnGroup; 
	
_groupGuard deleteGroupWhenEmpty true;

_HQguard1 = units _groupGuard select 0;
_HQguard2 = units _groupGuard select 1;
_HQguard3 = units _groupGuard select 2;
_HQguard4 = units _groupGuard select 3;
_HQguard5 = units _groupGuard select 4;

// REFORTIFY STATICS
_turret1 = "";
_turret2 = "";
_turret3 = "";
_turret4 = "";
_turret5 = "";

_glPod1 = "";
_glPod2 = "";
_atPod1 = "";
_hmgPod1 = "";
_aaPod = "";

switch (VERSION_X) do {
	case "MODERN": {
		// GMG
		//_sandbags = ["land_bagfence_round_f",_centerPos,[9.5,9,0]] call _forty_spawn;
		_turret1 = [blufor_TURRET_GMG,_centerPos,[9,9.5,0]] call _forty_spawn;
		//_sandbags setDir(getPosWorld _turret1 getDir _centerPos); //try to situate this guy radially
		_turret1 setDir( _centerPos getDir getPosWorld _turret1); //try to situate this guy radially
		//_turret1 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
		// GMG
		//_sandbags = ["land_bagfence_round_f",_centerPos,[-9,7,0]] call _forty_spawn;
		_turret2 = [blufor_TURRET_GMG,_centerPos,[-8.5,7.5,0]] call _forty_spawn;
		//_sandbags setDir(getPosWorld _turret2 getDir _centerPos); //try to situate this guy radially
		_turret2 setDir( _centerPos getDir getPosWorld _turret2); //try to situate this guy radially
		//_turret2 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
		// AT
		//_sandbags = ["land_bagfence_round_f",_centerPos,[-9,-10.8,-0.3]] call _forty_spawn;
		_turret3 = [blufor_TURRET_AT,_centerPos,[-8,-9,0]] call _forty_spawn;
		//_sandbags setDir(getPosWorld _turret3 getDir _centerPos); //try to situate this guy radially
		_turret3 setDir( _centerPos getDir getPosWorld _turret3); //try to situate this guy radially
		//_turret3 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
		// HMG
		//_sandbags = ["land_bagfence_round_f",_centerPos,[10.2,-10.7,0]] call _forty_spawn;
		_turret4 = [blufor_TURRET_HMG,_centerPos,[9.5,-9.5,0]] call _forty_spawn;
		//_sandbags setDir(getPosWorld _turret4 getDir _centerPos); //try to situate this guy radially
		_turret4 setDir( _centerPos getDir getPosWorld _turret4); //try to situate this guy radially
		//_turret4 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
		// AA on the roof
		_tempPos = bluHQ_object buildingPos 5;
		_turret5 = createVehicle [blufor_TURRET_AA, [0,0,0], [], 0, "CAN_COLLIDE"];
		_turret5 setPosATL [(_tempPos select 0)-3, (_tempPos select 1)-5, _tempPos select 2];
		//_turret5 = [blufor_TURRET_AA,_centerPos,[0,0,2.9]] call _forty_spawn;
		//_turret5 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
	};
	case "WW2": {
		// HMG
		_turret1 = [blufor_TURRET_HMG,_centerPos,[-9,9,0]] call _forty_spawn;
		_turret1 setDir( _centerPos getDir getPosWorld _turret1); //try to situate this guy radially
		// GMG
		_turret2 = [blufor_TURRET_GMG,_centerPos,[9,9,0]] call _forty_spawn;
		_turret2 setDir( _centerPos getDir getPosWorld _turret2); //try to situate this guy radially
		// AT
		_turret3 = [blufor_TURRET_AT,_centerPos,[-9,-10,0]] call _forty_spawn;
		_turret3 setDir( _centerPos getDir getPosWorld _turret3); //try to situate this guy radially
		// HMG
		_turret4 = [blufor_TURRET_HMG,_centerPos,[9.5,-9.5,0]] call _forty_spawn;
		_turret4 setDir( _centerPos getDir getPosWorld _turret4); //try to situate this guy radially
		// AA on the roof
		_turret5 = [blufor_TURRET_AA,_centerPos,[0,0.4,2.9]] call _forty_spawn;
		//_turret5 addEventHandler ["Fired",{(_this select 0) setvehicleammo 1}];  //Dang Edit 
	};
	case "VIETNAM": {
		// HMG
		_turret1 = ["uns_m60_high",_centerPos,[4.48364,-1.54663,2.1417]] call _forty_spawn;
		_turret1 setDir 136.096;
		//_turret1 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

		// HMG
		_turret2 = ["uns_m60_high",_centerPos,[4.44653,2.70337,2.1417]] call _forty_spawn;
		_turret2 setDir 3.15119;
		//_turret2 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

		// HMG
		_turret3 = ["B_G_HMG_02_high_F",_centerPos,[-13.6789,-6.99233,0]] call _forty_spawn;
		_turret3 setDir 225.691;
		//_turret3 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

		// HMG
		_turret5 = ["B_G_HMG_02_high_F",_centerPos,[10.8579,10.2604,0]] call _forty_spawn;
		_turret5 setDir 48.3074;
		//_turret5 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

		// AT
		_turret4 = ["uns_M40_106mm_US",_centerPos,[9.21802,-9.68413,0.244159]] call _forty_spawn;
		_turret4 setDir 129.237; 
		//_turret4 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
	};
};

// PERM STATICS
if (!_refortify) then {
	switch (VERSION_X) do {
		case "MODERN": {
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,4.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,3,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,1.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,0,0]] call _forty_spawn;
			//_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,-1.5,0]] call _forty_spawn;
			//_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,-4.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,-6,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-10,-7.5,0]] call _forty_spawn;

			_hesco = ["Land_HBarrier_1_F",_centerPos,[-6,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-4.5,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-3,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-1.5,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[0,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[1.5,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[3,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[4.5,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[6,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[7.5,-11.5,0]] call _forty_spawn;
			_hesco setDir 90;

			//_sandbags = ["land_bagfence_end_f",_centerPos,[10.5,-8,0]] call _forty_spawn;
			//_sandbags setDir 270;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,-7,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,-5.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,-4,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,-2.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,-1,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,0.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,2,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,3.5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,5,0]] call _forty_spawn;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[11,6.5,0]] call _forty_spawn;

			_hesco = ["Land_HBarrier_1_F",_centerPos,[6.5,10,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[5,10,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[3.5,10,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[2,10,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[0.5,10,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-1,10,0]] call _forty_spawn;
			_hesco setDir 90;
			//_hesco = ["Land_HBarrier_1_F",_centerPos,[-2.5,10,0]] call _forty_spawn;
			//_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-5.5,10,0]] call _forty_spawn;
			_hesco setDir 90;
			_hesco = ["Land_HBarrier_1_F",_centerPos,[-7,10,0]] call _forty_spawn;
			_hesco setDir 90;

			// LIGHTS
			//["Land_Camping_Light_F",_centerPos,[0,0,2]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[5.5,-5.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-5.5,3.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[5.5,3.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-5.5,-5.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-2.75,-2.75,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-2.75,2.75,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[2.75,2.75,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[2.75,2.75,1]] call _forty_spawn;

			// Table with Comm Equipment
			_terminal = ["Land_DataTerminal_01_F",_centerPos,[-1.1,2.7,0.6]] call _forty_spawn;
			_terminal setdir 180;
			_table = ["Land_WoodenTable_large_F",_centerPos,[-1.1,3.1,1.0]] call _forty_spawn;
			_table setdir 90;
			sleep 1;
			_laptop = ["Land_Laptop_unfolded_F",_centerPos,[-1.6,2.8,1.8]] call _forty_spawn;
			_laptop setdir 180;
			_battery = ["Land_SatellitePhone_F",_centerPos,[-0.9,2.8,1.8]] call _forty_spawn;
			_battery setdir 360;
		};
		case "WW2": {
			_centerpos = getPos bluHQ_object;
			
			_Sandbags = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags allowdamage false;
			_Sandbags setdamage 0;
			_Sandbags setpos [(_centerpos select 0)-9, (_centerpos select 1)+10.5, (_centerpos select 2)-0.62];
			_Sandbags setdir 315;

			_Sandbags1 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags1 allowdamage false;
			_Sandbags1 setdamage 0;
			_Sandbags1 setpos [(_centerpos select 0)-9.6, (_centerpos select 1)-9.6, (_centerpos select 2)-0.6];
			_Sandbags1 setdir 225;

			_Sandbags2 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags2 allowdamage false;
			_Sandbags2 setdamage 0;
			_Sandbags2 setpos [(_centerpos select 0)+9.6, (_centerpos select 1)-9.6, (_centerpos select 2)-0.62];
			_Sandbags2 setdir 135;

			_Sandbags3 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags3 allowdamage false;
			_Sandbags3 setdamage 0;
			_Sandbags3 setpos [(_centerpos select 0)-2.5, (_centerpos select 1)+0.9, (_centerpos select 2)+2.7];
			_Sandbags3 setdir 270;

			_Sandbags4 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags4 allowdamage false;
			_Sandbags4 setdamage 0;
			_Sandbags4 setpos [(_centerpos select 0)+2.1, (_centerpos select 1)+0.9, (_centerpos select 2)+2.7];
			_Sandbags4 setdir 90;

			_Sandbags5 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags5 allowdamage false;
			_Sandbags5 setdamage 0;
			_Sandbags5 setpos [(_centerpos select 0)+9, (_centerpos select 1)+10.5, (_centerpos select 2)-0.6];
			_Sandbags5 setdir 45;

			_Radar = createVehicle [blufor_TURRET_RAD, [0,0,0], [], 0, "NONE"];
			_Radar allowdamage false;
			_Radar setdamage 0;
			_Radar setpos [(_centerpos select 0)+0.1, (_centerpos select 1)-12];
			_Radar setdir 90;

			_Flag = createVehicle [blufor_TURRET_FLAG, [0,0,0], [], 0, "NONE"];
			_Flag allowdamage false;
			_Flag setdamage 0;
			_Flag setpos [(_centerpos select 0)+9, (_centerpos select 1)+0.1];
			_Flag setdir 90;

			_lamp = createVehicle ["Land_Lamp_Small_EP1", [0,0,0], [], 0, "NONE"];
			_lamp allowdamage false;
			_lamp setdamage 0;
			_lamp setpos [(_centerpos select 0)-0.5, (_centerpos select 1)+9];
		};
		
		case "VIETNAM": {
			_staticsArray = [
				["LAND_sb_bunker_main02",[3.5107422,0.31035,-2.20988],0,1,0,[],"","",true,false],
				[blufor_STATIC_RADIO,[6.39233,2.92773,0],107.542,1,0,[],"","",true,false],	
				["Sign_4",[-8.31006,-2.69751,0],90.7747,1,0,[],"","",true,false], 
				["LAND_t_sb_45_half",[-5.44067,-12.5225,0],41.8997,1,0,[],"","",true,false], 
				["LAND_t_sb_pit1",[2.87964,-10.51401,0],177.609,1,0,[],"","",true,false], 
				["LAND_t_sb_pit1",[9.67627,-1.62109,0],88.236,1,0,[],"","",true,false], 
				["LAND_t_sb_45_half",[1.600586,13.6563,0],199.078,1,0,[],"","",true,false], 
				["LAND_sb_revetment",[9.0227,-7.86816,0],267.887,1,0,[],"","",true,false], 
				["LAND_t_sb_45_half",[-9.87671,8.04229,0],156.11,1,0,[],"","",true,false], 
				["LAND_CSJ_walkway",[9.85059,-9.66162,0],0,1,0,[],"","",true,false], 
				["uns_sbagwall_4",[11.9558,5.42993,0],355.775,1,0,[],"","",true,false], 
				["uns_sbagwall_4",[11.1572,7.15698,0],315.197,1,0,[],"","",true,false], 
				[blufor_STATIC_FLAG,[-12.3381,-3.94507,0],0,1,0,[],"","",true,false], 
				["Land_fortified_nest_small_ep1",[10.4265,9.70801,0],226.759,1,0,[],"","",true,false], 
				["uns_sbagwall_4",[-13.0173,-4.17676,0],352.738,1,0,[],"","",true,false], 
				["Land_fortified_nest_small_ep1",[-12.8828,-7.06348,0],44.1422,1,0,[],"","",true,false], 
				["uns_sbagwall_4",[-13.8564,-2.35278,0],315.197,1,0,[],"","",true,false], 
				["Sign_1",[-14.1289,-4.1626,0],86.8558,1,0,[],"","",true,false]
			];
			
			// PLACE STATICS WITHOUT INTERACTION
			_centerSpawnX = _centerpos select 0;
			_centerSpawnY = _centerpos select 1;

			_vehicle = objNull;
			{
				_xyz = (_x select 1);
				_posX = (_xyz select 0);
				_posY = (_xyz select 1);
				_posZ = (_xyz select 2);
				_vehicle = createVehicle [(_x select 0), [0,0,0], [], 0, "CAN_COLLIDE"];
				_vehicle setDir (_x select 2);
				_vehicle setPosATL [(_centerSpawnX)+_posX,(_centerSpawnY)+_posY,0];
			} forEach _staticsArray;

			// AA vehicle (does not refortify)
			_createdVehFnc = [[(_centerSpawnX)-5.88354,(_centerSpawnY)+3.23853],0,blufor_APC_PATROL1_X,WEST] call bis_fnc_spawnvehicle;
			_aaVeh = _createdVehFnc select 0 ;// vehicle object
			_aaVeh setDir 268.645;
			//_aaVeh addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

		};
	};
};

sleep 10;
_hqGuard1 setpos _centerPos;
_hqGuard2 setpos _centerPos;
_hqGuard3 setpos _centerPos;
_hqGuard4 setpos _centerPos;
_hqGuard5 setpos _centerPos;
_hqGuard1 moveinGunner _turret1;
_hqGuard2 moveinGunner _turret2;
_hqGuard3 moveinGunner _turret3;
_hqGuard4 moveinGunner _turret4;
_hqGuard5 moveinGunner _turret5;

sleep 50;
_turret1 allowdamage true;
_turret2 allowdamage true;
_turret3 allowdamage true;
_turret4 allowdamage true;
_turret5 allowdamage true;

[_groupGuard, _centerPos] call bis_fnc_taskDefend;

[_hq,[localize "STR_DUWS_X_xvtn4llz", fnc_refortifyHQ, [_turret1, _turret2, _turret3, _turret4, _turret5, _centerPos, _hq], 0, true, true, "", "_this == player"]] remoteExec ["addAction",[0,-2] select isDedicated,[false,true] select isDedicated];



