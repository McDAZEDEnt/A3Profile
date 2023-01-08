
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
  _this = createVehicle ["Land_Bunker_01_blocks_1_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 226.147;
  _this setPos [(_centerSpawnX)-0.587891, (_centerSpawnY)-1.375, (_centerSpawnZ)+1.05672];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Bunker_01_blocks_1_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 226.147;
  _this setPos [(_centerSpawnX)-1.72852, (_centerSpawnY)-0.164063, (_centerSpawnZ)+1.05631];
};

_vehicle_4 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Barrel_gr", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_4 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)+0.15625, (_centerSpawnY)-2.76758, (_centerSpawnZ)+0];
};

_vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_5 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)-2.70898, (_centerSpawnY)+0.642578, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_6 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNetVar_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_6 = _this;
  _this setDir 287.356;
  _this setPos [(_centerSpawnX)-1.59766, (_centerSpawnY)+1.04492, (_centerSpawnZ)+0.678116];
  _vehicle_6 allowdamage false;
  _vehicle_6 setdamage 0;
};

_vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_AMMO, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_7 = _this;
  _this setDir 134.489;
  _this setPos [(_centerSpawnX)-2.63086, (_centerSpawnY)-1.62695, (_centerSpawnZ)+0];
};

_vehicle_8 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Barrel_gr", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_8 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)+0.662109, (_centerSpawnY)-3.33594, (_centerSpawnZ)+0];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Barrel_op", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setDir 280.415;
  _this setPos [(_centerSpawnX)-0.0664063, (_centerSpawnY)-3.41602, (_centerSpawnZ)+0];
};

_vehicle_10 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Barrel_sm768768768", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_10 = _this;
  _this setDir 133.522;
  _this setPos [(_centerSpawnX)-2.77148, (_centerSpawnY)-3.5332, (_centerSpawnZ)+0];
};

_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Sacks_heap_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  _this setDir 300.707;
  _this setPos [(_centerSpawnX)-3.65625, (_centerSpawnY)+3.91992, (_centerSpawnZ)+0];
};

_vehicle_12 = objNull;
if (true) then
{
  _this = createVehicle ["Fort_Crate_wood", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_12 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)-4.85352, (_centerSpawnY)+3.08398, (_centerSpawnZ)+1.90735e-006];
};

_vehicle_13 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_FLAG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_14 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)+1.70703, (_centerSpawnY)-4.49414, (_centerSpawnZ)+0];
};

_vehicle_15 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_15 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)-5.06641, (_centerSpawnY)+4.1875, (_centerSpawnZ)+1.90735e-006];
};

_vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_16 = _this;
  _this setDir 315.707;
  _this setPos [(_centerSpawnX)+3.11914, (_centerSpawnY)+5.63867, (_centerSpawnZ)+0];
};

_vehicle_17 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_17 = _this;
  _this setDir 315.707;
  _this setPos [(_centerSpawnX)+2.52734, (_centerSpawnY)-6.77148, (_centerSpawnZ)+0];
};

_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_RGB_667_Com_B", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 135.707;
  _this setPos [(_centerSpawnX)+6.42383, (_centerSpawnY)-0.503906, (_centerSpawnZ)+0];
};

_vehicle_19 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_MG34_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_19 = _this;
  _this setDir 137.891;
  _this setPos [(_centerSpawnX)+7.86328, (_centerSpawnY)-0.787109, (_centerSpawnZ)-0.075];
};

_vehicle_20 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_20 = _this;
  _this setDir 315.707;
  _this setPos [(_centerSpawnX)-0.166016, (_centerSpawnY)-8.57813, (_centerSpawnZ)+0];
};

_vehicle_22 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_22 = _this;
  _this setDir 225.707;
  _this setPos [(_centerSpawnX)+5.85547, (_centerSpawnY)+5.71484, (_centerSpawnZ)+0];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 300.707;
  _this setPos [(_centerSpawnX)-9.47656, (_centerSpawnY)+2.19727, (_centerSpawnZ)-0.2];
};

_vehicle_24 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_24 = _this;
  _this setDir 46.435;
  _this setPos [(_centerSpawnX)-5.45898, (_centerSpawnY)-5.08984, (_centerSpawnZ)+0];
};

_vehicle_25 = objNull;
if (true) then
{
  _this = createVehicle ["Wire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_25 = _this;
  _this setDir 45.0805;
  _this setPos [(_centerSpawnX)+6.4082, (_centerSpawnY)+7.73438, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_26 = objNull;
if (true) then
{
  _this = createVehicle ["Wire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_26 = _this;
  _this setDir 315.707;
  _this setPos [(_centerSpawnX)+4.1582, (_centerSpawnY)-10.3867, (_centerSpawnZ)+0];
};

_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_AT, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setDir 307.246;
  _this setPos [(_centerSpawnX)-7.93945, (_centerSpawnY)+1.29688, (_centerSpawnZ)-0.06826];
};

_groupBunker1 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_groupBunker2 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker2 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;
_guard2 = units _groupBunker2 select 0;
_guard1 moveinGunner _vehicle_21;
_guard2 moveinGunner _vehicle_19;

_groupTower = [[0,0], EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_towerGuard setPos [(getpos _vehicle_18 select 0),(getpos _vehicle_18 select 1),4];
_groupTower setBehaviour "SAFE";

/*
private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle _flagPos];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";*\
