
//////////////////////
// -- ADD THIS -- 1 //
//////////////////////
_centerSpawn = _this select 0;
_centerSpawnX = _centerSpawn select 0;
_centerSpawnY = _centerSpawn select 1;
_flagPos = _this select 0;
/////////////////
// -- END -- 1 //
/////////////////

_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setPos _centerSpawn;
};
_centerSpawnZ = (getpos _vehicle_0 select 2);
///////////////////////
// -- ADD THIS --  2 //
///////////////////////
_centerObj = getpos _vehicle_0; 
_centerX = _centerObj select 0;
_centerY = _centerObj select 1;
_centerz = _centerObj select 2;
deleteVehicle _vehicle_0;
/////////////////
// -- END -- 2 //
/////////////////

_vehicle_2 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_kitchen_chair_a", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 358.056;
  _this setPos [(_centerSpawnX)-2.20508, (_centerSpawnY)+2.25, (_centerSpawnZ)+0];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["Land_MetalBarrel_empty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 223.402;
  _this setPos [(_centerSpawnX)+3.2207, (_centerSpawnY)+1.40039, (_centerSpawnZ)+0];
};

_vehicle_4 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_4 = _this;
  _this setDir 228.069;
  _this setPos [(_centerSpawnX)+3.85352, (_centerSpawnY)+2.50781, (_centerSpawnZ)+0];
};

_vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_kitchen_chair_a", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_5 = _this;
  _this setDir 33.6591;
  _this setPos [(_centerSpawnX)-3.13281, (_centerSpawnY)+2.53516, (_centerSpawnZ)-0];
};

_vehicle_6 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WoodenTable_large_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_6 = _this;
  _this setDir 317.804;
  _this setPos [(_centerSpawnX)-3.71289, (_centerSpawnY)+1.5293, (_centerSpawnZ)+0];
};

_vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_AMMO, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_7 = _this;
  _this setDir 45.3614;
  _this setPos [(_centerSpawnX)-1.2793, (_centerSpawnY)+3.98047, (_centerSpawnZ)+0];
};

_vehicle_8 = objNull;
if (true) then
{
  _this = createVehicle ["Land_MetalBarrel_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_8 = _this;
  _this setDir 258.05;
  _this setPos [(_centerSpawnX)+3.30469, (_centerSpawnY)+2.66406, (_centerSpawnZ)+0];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle ["Land_MetalBarrel_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setDir 228.06;
  _this setPos [(_centerSpawnX)+3.80859, (_centerSpawnY)+2.08789, (_centerSpawnZ)+0];
};

_vehicle_10 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_kitchen_chair_a", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_10 = _this;
  _this setDir 246.115;
  _this setPos [(_centerSpawnX)-4.56055, (_centerSpawnY)+1.16992, (_centerSpawnZ)+0];
};

_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_FLAG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  _this setDir 220.683;
  _this setPos [(_centerSpawnX)+2.87305, (_centerSpawnY)-1.60547, (_centerSpawnZ)+0];
};

_vehicle_12 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_12 = _this;
  _this setDir 228.069;
  _this setPos [(_centerSpawnX)+0.833984, (_centerSpawnY)+5.63477, (_centerSpawnZ)+1.90735e-006];
};

_vehicle_13 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_small_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_14 = _this;
  _this setDir 315.545;
  _this setPos [(_centerSpawnX)+2.54297, (_centerSpawnY)-5.3418, (_centerSpawnZ)+0];
};

_vehicle_15 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_blocks_1_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_15 = _this;
  _this setDir 48.189;
  _this setPos [(_centerSpawnX)+1.5625, (_centerSpawnY)+6.60938, (_centerSpawnZ)+0.74202];
};

_vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_blocks_3_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_16 = _this;
  _this setDir 316.694;
  _this setPos [(_centerSpawnX)-2.61328, (_centerSpawnY)+6.30273, (_centerSpawnZ)+0.866016];
};

_vehicle_17 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_blocks_3_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_17 = _this;
  _this setDir 316.694;
  _this setPos [(_centerSpawnX)-6.39844, (_centerSpawnY)+2.72852, (_centerSpawnZ)+0.866016];
};

_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 318.069;
  _this setPos [(_centerSpawnX)+7.16016, (_centerSpawnY)-2.375, (_centerSpawnZ)+0];
};

_vehicle_19 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_blocks_1_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_19 = _this;
  _this setDir 48.2987;
  _this setPos [(_centerSpawnX)+0.416016, (_centerSpawnY)+7.88867, (_centerSpawnZ)+0.816025];
};

_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_blocks_3_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setDir 227.351;
  _this setPos [(_centerSpawnX)-6.96875, (_centerSpawnY)-5.34375, (_centerSpawnZ)+0.866016];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 48.0691;
  _this setPos [(_centerSpawnX)+7.54688, (_centerSpawnY)+5.24023, (_centerSpawnZ)-0.2];
};

_vehicle_24 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_24 = _this;
  _this setDir 198.069;
  _this setPos [(_centerSpawnX)-2.99805, (_centerSpawnY)-10.1094, (_centerSpawnZ)+0];
};

_vehicle_25 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_25 = _this;
  _this setDir 93.069;
  _this setPos [(_centerSpawnX)+10.6563, (_centerSpawnY)+1.26367, (_centerSpawnZ)-0.2];
};

_vehicle_26 = objNull;
if (true) then
{
  _this = createVehicle ["Wire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_26 = _this;
  _this setDir 135;
  _this setPos [(_centerSpawnX)+5.42188, (_centerSpawnY)-9.03516, (_centerSpawnZ)+0];
};

_vehicle_27 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNet_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_27 = _this;
  _this setDir 316.928;
  _this setPos [(_centerSpawnX)-1.73438, (_centerSpawnY)+1.72852, (_centerSpawnZ)+0];
  _vehicle_27 allowdamage false;
  _vehicle_27 setdamage 0;
};

_vehicle_22 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_22 = _this;
  _this setDir 92.8878;
  _this setPos [(_centerSpawnX)+9.02539, (_centerSpawnY)+1.21484, (_centerSpawnZ)+0];
};

_groupBunker1 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;

_groupTower = [[0,0], EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_groupTower setBehaviour "SAFE";
_guard1 moveinGunner _vehicle_22;
_towerGuard setPos [(getpos _vehicle_13 select 0),(getpos _vehicle_13 select 1),1];

/*
private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle _flagPos];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";*\
