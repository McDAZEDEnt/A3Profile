
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
  _this = createVehicle ["INS_WarfareBFieldhHospital", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 267.133;
  _this setPos [(_centerSpawnX)-0.114746, (_centerSpawnY)+0.400391, (_centerSpawnZ)-0.000642776];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 351.754;
  _this setPos [(_centerSpawnX)-5.82617, (_centerSpawnY)-2.82202, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["Land_I44_Buildings_Trench2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_5 = _this;
  _this setDir 86.4212;
  _this setPos [(_centerSpawnX)+6.82617, (_centerSpawnY)+0.494629, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle ["FlagCarrierRedCross_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_7 = _this;
  _this setDir 0;
  _this setPos [(_centerSpawnX)+2.03564, (_centerSpawnY)-5.3877, (_centerSpawnZ)+0.00166321];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_AMMO, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setDir 0;
  _this setPos [(_centerSpawnX)-7.46875, (_centerSpawnY)-3.01172, (_centerSpawnZ)-2.09808e-005];
};

_vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_AMMO, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_16 = _this;
  _this setDir 1.57336;
  _this setPos [(_centerSpawnX)-7.14209, (_centerSpawnY)-4.39404, (_centerSpawnZ)-0.000265121];
};

_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle [opfor_AMBULANCE_TRUCK_X, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 0;
  _this setPos [(_centerSpawnX)-6.65039, (_centerSpawnY)+5.06812, (_centerSpawnZ)+0.0481949];
};

_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_BasicAmmunitionBox_US", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setDir 357.31;
  _this setPos [(_centerSpawnX)-2.31104, (_centerSpawnY)+8.64063, (_centerSpawnZ)-2.47955e-005];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["Land_I44_Buildings_Trench2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 264.977;
  _this setPos [(_centerSpawnX)-9.07227, (_centerSpawnY)-1.05176, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_40 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_40 = _this;
  _this setDir 346.347;
  _this setPos [(_centerSpawnX)-1.75293, (_centerSpawnY)+9.73511, (_centerSpawnZ)-0.2];
};

_vehicle_41 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_AMMO, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_41 = _this;
  _this setDir 286.12231;
  _this setPos [(_centerSpawnX)-7.68457, (_centerSpawnY)-6.52051, (_centerSpawnZ)-9.53674e-006];
};

_vehicle_51 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_51 = _this;
  _this setDir 180.094;
  _this setPos [(_centerSpawnX)+1.08057, (_centerSpawnY)+10.1296, (_centerSpawnZ)-0.2];
};

_vehicle_52 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_52 = _this;
  _this setDir 358.585;
  _this setPos [(_centerSpawnX)-0.36084, (_centerSpawnY)-10.2302, (_centerSpawnZ)-0.2];
};

_vehicle_53 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_53 = _this;
  _this setDir 14.766;
  _this setPos [(_centerSpawnX)-3.06982, (_centerSpawnY)-9.87769, (_centerSpawnZ)-0.2];
};

_vehicle_54 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_54 = _this;
  _this setDir 177.231;
  _this setPos [(_centerSpawnX)+2.57617, (_centerSpawnY)-10.0271, (_centerSpawnZ)-0.2];
};

_vehicle_56 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_56 = _this;
  _this setDir 198.178;
  _this setPos [(_centerSpawnX)+3.77979, (_centerSpawnY)+9.70605, (_centerSpawnZ)-0.2];
};

_vehicle_57 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_57 = _this;
  _this setDir 177.231;
  _this setPos [(_centerSpawnX)-5.87012, (_centerSpawnY)-9.51904, (_centerSpawnZ)-0.2];
};

_vehicle_58 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces10_100", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_58 = _this;
  _this setDir 357.619;
  _this setPos [(_centerSpawnX)-6.63965, (_centerSpawnY)+3.31079, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_59 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Setka_Dor", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_59 = _this;
  _this setDir 271.901;
  _this setPos [(_centerSpawnX)-9.0957, (_centerSpawnY)+12.6917, (_centerSpawnZ)+0.0239391];
};

_vehicle_60 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_60 = _this;
  _this setDir 186.683;
  _this setPos [(_centerSpawnX)-5.10547, (_centerSpawnY)+26.7825, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_12 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNetVar_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_12 = _this;
  _this setDir 263.596;
  _this setPos [(_centerSpawnX)-7.34766, (_centerSpawnY)+0.70166, (_centerSpawnZ)+0.972585];
  _vehicle_12 allowdamage false;
  _vehicle_12 setdamage 0;
};

_vehicle_27 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_27 = _this;
  _this setDir 0;
  _this setPos [(_centerSpawnX)+3.83447, (_centerSpawnY)+8.33594, (_centerSpawnZ)-0.0895424];
};

_vehicle_29 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_29 = _this;
  _this setDir 180.639;
  _this setPos [(_centerSpawnX)-5.45752, (_centerSpawnY)-7.85498, (_centerSpawnZ)-0.0495892];
};

_groupBunker1 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_groupBunker2 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker2 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;
_guard2 = units _groupBunker2 select 0;
_guard1 moveinGunner _vehicle_27;
_guard2 moveinGunner _vehicle_29;

/*
private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle _flagPos];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";*/
