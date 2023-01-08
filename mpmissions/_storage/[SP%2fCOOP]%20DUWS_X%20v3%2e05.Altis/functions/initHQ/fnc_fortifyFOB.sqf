
params ["_centerPos", "_fob", "_refortify", "_id"];

_safe = [(_centerPos select 0)+10, (_centerPos select 1)+10];

playSound "loadgun";

_groupGuard = [[0,0], WEST, [blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_X],[],[],blufor_ai_skill] call BIS_fnc_spawnGroup; 
_groupGuard deleteGroupWhenEmpty true;

_fobGuard1 = units _groupGuard select 0;
_fobGuard2 = units _groupGuard select 1;
_fobGuard3 = units _groupGuard select 2;
_fobGuard4 = units _groupGuard select 3;
_fobGuard5 = units _groupGuard select 4;

_forty_spawn = {
	_name = _this select 0;
	_center = _this select 1;
	_offset = _this select 2;

	_newx = (_center select 0) + (_offset select 0);
	_newy = (_center select 1) + (_offset select 1);
	_newz = (_offset select 2);

	_new = createVehicle [_name, [0,0,0], [], 0, "CAN_COLLIDE"];
	_new allowdamage false;
	_new setpos [_newx, _newy, _newz];
	_new setdamage 0;
	_new
};

// REFORTIFY STATICS
_turret1 = "";
_turret2 = "";
_turret3 = "";
_turret4 = "";
_turret5 = "";

_glPod1 = "";
_glPod2 = "";
_turret3 = "";
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
		_tempPos = _fob buildingPos 5;
		_turret5 = createVehicle [blufor_TURRET_AA, [0,0,0], [], 0, "CAN_COLLIDE"];
		_turret5 setPosATL [(_tempPos select 0)-3, (_tempPos select 1)-5, _tempPos select 2];
		//_turret5 = [blufor_TURRET_AA,_centerPos,[0,0,2.9]] call _forty_spawn;
		//_turret5 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
	};
	case "WW2": {
		// GMG
		_turret1 = createVehicle [blufor_TURRET_GMG, [0,0,0], [], 0, "NONE"];
		_turret1 allowdamage false;
		_turret1 setdamage 0;
		_turret1 setpos [(_centerPos select 0)+9, (_centerPos select 1)+9];
		// HMG
		_turret2 = createVehicle [blufor_TURRET_HMG, [0,0,0], [], 0, "NONE"];
		_turret2 allowdamage false;
		_turret2 setdamage 0;
		_turret2 setpos [(_centerPos select 0)+9.5, (_centerPos select 1)-9.5];
		// AT
		_turret3 = createVehicle [blufor_TURRET_AT, [0,0,0], [], 0, "NONE"];
		_turret3 setpos [(_centerPos select 0)-9, (_centerPos select 1)-10];
		_turret3 allowdamage false;
		_turret3 setdamage 0;
		_turret3 setdir 215;
		// HMG
		_turret4 = createVehicle [blufor_TURRET_HMG, [0,0,0], [], 0, "NONE"];
		_turret4 allowdamage false;
		_turret4 setdamage 0;
		_turret4 setpos [(_centerPos select 0)-9, (_centerPos select 1)+9];
		// AA on the roof
		_turret5 = createVehicle [blufor_TURRET_AA, [0,0,0], [], 0, "NONE"];
		_turret5 allowdamage false;
		_turret5 setdamage 0;
		_turret5 setpos [(_centerPos select 0)+0.3, _centerPos select 1,(_centerPos select 2)+2.5];
		//_turret5 addEventHandler ["Fired",{(_this select 0) setvehicleammo 1}]; //Dang Edit
	};
	case "VIETNAM": {
		// HMG
		_turret1 = createVehicle ["uns_M60_bunker_large", [0,0,0], [], 0, "NONE"];
		_turret1 allowdamage false;
		_turret1 setdamage 0;
		_turret1 setpos [(_centerPos select 0)-9, (_centerPos select 1)+9];
		_turret1 setdir 315;
		// HMG
		_turret2 = createVehicle ["uns_M60_bunker_large", [0,0,0], [], 0, "NONE"];
		_turret2 allowdamage false;
		_turret2 setdamage 0;
		_turret2 setpos [(_centerPos select 0)+9.5, (_centerPos select 1)-9.5];
		_turret2 setdir 135;
		// GMG
		_turret3 = createVehicle [blufor_TURRET_GMG, [0,0,0], [], 0, "NONE"];
		_turret3 setpos [(_centerPos select 0)-9, (_centerPos select 1)-10];
		_turret3 allowdamage false;
		_turret3 setdamage 0;
		_turret3 setdir 225;
		// HMG
		_turret4 = createVehicle ["uns_M60_bunker_large", [0,0,0], [], 0, "NONE"];
		_turret4 allowdamage false;
		_turret4 setdamage 0;
		_turret4 setpos [(_centerPos select 0)+9, (_centerPos select 1)+9];
		_turret4 setdir 45;
		// AA on the roof
		_turret5 = createVehicle [blufor_TURRET_AA, [0,0,0], [], 0, "NONE"];
		_turret5 allowdamage false;
		_turret5 setdamage 0;
		_turret5 setpos [(_centerPos select 0)+1, _centerPos select 1,(_centerPos select 2)+3.2];
		_turret5 setdir 270;
		//_turret5 addEventHandler ["Fired",{(_this select 0) setvehicleammo 1}];
	};
};	

//////////////////
// PERM Statics
//////////////////

if !(_refortify) then {
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
			//["Land_Camping_Light_F",_foundPickupPos,[0,0,2]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[5.5,-5.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-5.5,3.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[5.5,3.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-5.5,-5.5,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-2.75,-2.75,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[-2.75,2.75,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[2.75,2.75,0]] call _forty_spawn;
			["Land_Camping_Light_F",_centerPos,[2.75,2.75,1]] call _forty_spawn;
		};
		case "WW2": {
			
			_Sandbags = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags allowdamage false;
			_Sandbags setdamage 0;
			_Sandbags setpos [(_centerpos select 0)-9, (_centerpos select 1)+10.5, (_centerpos select 2)-0.3];
			_Sandbags setdir 315;
	
			_Sandbags1 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags1 allowdamage false;
			_Sandbags1 setdamage 0;
			_Sandbags1 setpos [(_centerpos select 0)-9.6, (_centerpos select 1)-9.6, (_centerpos select 2)-0.25];
			_Sandbags1 setdir 225;
			
			_Sandbags5 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags5 allowdamage false;
			_Sandbags5 setdamage 0;
			_Sandbags5 setpos [(_centerpos select 0)+9, (_centerpos select 1)+10.5, (_centerpos select 2)-0.3];
			_Sandbags5 setdir 45;
			
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
	
			_Sandbags2 = createVehicle ["Land_fort_bagfence_round", [0,0,0], [], 0, "NONE"];
			_Sandbags2 allowdamage false;
			_Sandbags2 setdamage 0;
			_Sandbags2 setpos [(_centerpos select 0)+9.6, (_centerpos select 1)-9.6, (_centerpos select 2)-0.25];
			_Sandbags2 setdir 135;
	
			_Radar = createVehicle ["LIB_Static_zis6_radar", [0,0,0], [], 0, "NONE"];
			_Radar allowdamage false;
			_Radar setdamage 0;
			_Radar setpos [(_centerpos select 0)+0.1, (_centerpos select 1)-12];
			_Radar setdir 90;
	
			_Flag = createVehicle ["LIB_FlagCarrier_USA", [0,0,0], [], 0, "NONE"];
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
			_Sandbags = createVehicle ["wx_sandbag05", [0,0,0], [], 0, "NONE"];
			_Sandbags allowdamage false;
			_Sandbags setdamage 0;
			_Sandbags setpos [(_centerpos select 0)-9, (_centerpos select 1)-10.5];
			_Sandbags setdir 30;

			_Sandbags3 = createVehicle ["LAND_sb_revetment", [0,0,0], [], 0, "NONE"];
			_Sandbags3 allowdamage false;
			_Sandbags3 setdamage 0;
			_Sandbags3 setpos [(_centerpos select 0)+0.6, (_centerpos select 1)-2.2, (_centerpos select 2)+2.8];
			_Sandbags3 setdir 270;

			_Sandbags4 = createVehicle ["LAND_sb_revetment", [0,0,0], [], 0, "NONE"];
			_Sandbags4 allowdamage false;
			_Sandbags4 setdamage 0;
			_Sandbags4 setpos [(_centerpos select 0)-0.4, (_centerpos select 1)-2.0, (_centerpos select 2)+2.8];
			_Sandbags4 setdir 90;

			_Flag = createVehicle [blufor_STATIC_FLAG, [0,0,0], [], 0, "NONE"];
			_Flag allowdamage false;
			_Flag setdamage 0;
			_Flag setpos [(_centerpos select 0)+9, (_centerpos select 1)+0.1];
			_Flag setdir 90;

			_radio = createVehicle ["uns_radio2_radio", [0,0,0], [], 0, "NONE"];
			_radio allowdamage false;
			_radio setdamage 0;
			_radio setpos [(_centerpos select 0)+7, (_centerpos select 1)+0.1];
			_radio setdir 90;

			_campfire = createVehicle ["Land_LampShabby_F", [0,0,0], [], 0, "NONE"];
			_campfire allowdamage false;
			_campfire setdamage 0;
			_campfire setpos [(_centerpos select 0)-0.5, (_centerpos select 1)+9];
		};
	};
};

sleep 10;
_fobGuard1 setpos _centerPos;
_fobGuard2 setpos _centerPos;
_fobGuard3 setpos _centerPos;
_fobGuard4 setpos _centerPos;
_fobGuard5 setpos _centerPos;
_fobGuard1 moveinGunner _turret1;
_fobGuard2 moveinGunner _turret2;
_fobGuard3 moveinGunner _turret3;
_fobGuard4 moveinGunner _turret4;
_fobGuard5 moveinGunner _turret5;

sleep 50;
_turret1 allowdamage true;
_turret2 allowdamage true;
_turret3 allowdamage true;
_turret4 allowdamage true;
_turret5 allowdamage true;

[_groupGuard, _centerPos] call bis_fnc_taskDefend;

[_fob,[localize "STR_DUWS_X_qxrh9fws", fnc_refortifyFOB, [_turret1, _turret2, _turret3, _turret4, _turret5, _centerPos, _fob, _id], 0, true, true, "", "_this == player"]] remoteExec ["addAction",_id,[false,true] select isDedicated];




