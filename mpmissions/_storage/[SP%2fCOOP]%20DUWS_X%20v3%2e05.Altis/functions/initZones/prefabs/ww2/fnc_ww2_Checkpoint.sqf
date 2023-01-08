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
  _this = createVehicle ["CUP_A1_Road_ces10_100", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 351.751;
  _this setPos [(_centerSpawnX)+0.809082, (_centerSpawnY)-9.18921, (_centerSpawnZ)+0];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Pegasus_Bridge_Control", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 89.988;
  _this setPos [(_centerSpawnX)-6.33252, (_centerSpawnY)+0.591064, (_centerSpawnZ)+0.00267601];
};

_vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_5 = _this;
  _this setDir 270.861;
  _this setPos [(_centerSpawnX)-2.55762, (_centerSpawnY)-6.47534, (_centerSpawnZ)-0.00946999];
};

_vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Posed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_7 = _this;
  _this setDir 179.055;
  _this setPos [(_centerSpawnX)-2.58203, (_centerSpawnY)-5.84497, (_centerSpawnZ)-0.0170212];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_Wachhaus", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setDir 270.273;
  _this setPos [(_centerSpawnX)-4.83301, (_centerSpawnY)+6.58887, (_centerSpawnZ)+0.0166588];
};

_vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_16 = _this;
  _this setDir 182.241;
  _this setPos [(_centerSpawnX)-3.71045, (_centerSpawnY)+7.39966, (_centerSpawnZ)+0.0304203];
};

_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_Wachhaus", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 86.7464;
  _this setPos [(_centerSpawnX)+5.61719, (_centerSpawnY)-6.33691, (_centerSpawnZ)-0.0122261];
};

_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle [opfor_AMMO_TRUCK_X, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setDir 89.6438;
  _this setPos [(_centerSpawnX)+7.79395, (_centerSpawnY)+2.04126, (_centerSpawnZ)+0.124029];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 358.248;
  _this setPos [(_centerSpawnX)+4.41943, (_centerSpawnY)-7.46069, (_centerSpawnZ)-0.0287609];
};

_vehicle_27 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_27 = _this;
  _this setDir 91.8183;
  _this setPos [(_centerSpawnX)+4.02002, (_centerSpawnY)+7.08447, (_centerSpawnZ)+0.0112839];
};

_vehicle_29 = objNull;
if (true) then
{
  _this = createVehicle [opfor_ARMED_CAR1_X, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_29 = _this;
  _this setDir 270.296;
  _this setPos [(_centerSpawnX)+8.0625, (_centerSpawnY)-2.56152, (_centerSpawnZ)+0.0764446];
};

_vehicle_40 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Posed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_40 = _this;
  _this setDir 359.727;
  _this setPos [(_centerSpawnX)+4.15039, (_centerSpawnY)+6.59912, (_centerSpawnZ)+0.0251312];
};

_vehicle_41 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNet_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_41 = _this;
  _this setDir 84.7431;
  _this setPos [(_centerSpawnX)+9.71094, (_centerSpawnY)-0.155762, (_centerSpawnZ)+0.00332642];
  _vehicle_41 allowdamage false;
  _vehicle_41 setdamage 0;
};

_vehicle_51 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_FLAG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_51 = _this;
  _this setDir 0;
  _this setPos [(_centerSpawnX)+6.87451, (_centerSpawnY)-5.95435, (_centerSpawnZ)+0];
};

_vehicle_53 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_Schranke", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_53 = _this;
  _this setDir 91.8866;
  _this setPos [(_centerSpawnX)-3.39941, (_centerSpawnY)-9.92822, (_centerSpawnZ)+0.00928497];
};

_vehicle_56 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_56 = _this;
  _this setDir 183.883;
  _this setPos [(_centerSpawnX)+0.264648, (_centerSpawnY)+14.4028, (_centerSpawnZ)+0];
};

_vehicle_57 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_Schranke", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_57 = _this;
  _this setDir 268.584;
  _this setPos [(_centerSpawnX)+4.32666, (_centerSpawnY)+11.0032, (_centerSpawnZ)+0.00670242];
};

_vehicle_58 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_58 = _this;
  _this setDir 175.534;
  _this setPos [(_centerSpawnX)-7.70215, (_centerSpawnY)-9.87695, (_centerSpawnZ)+0];
};

_vehicle_60 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_60 = _this;
  _this setDir 351.753;
  _this setPos [(_centerSpawnX)+1.62598, (_centerSpawnY)-15.3521, (_centerSpawnZ)+0];
};

_vehicle_61 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_61 = _this;
  _this setDir 358.364;
  _this setPos [(_centerSpawnX)-8.08057, (_centerSpawnY)+10.5457, (_centerSpawnZ)-0.2];
};

_vehicle_62 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_62 = _this;
  _this setDir 269.378;
  _this setPos [(_centerSpawnX)-10.7886, (_centerSpawnY)+6.46924, (_centerSpawnZ)-0.000297546];
};

_vehicle_63 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_63 = _this;
  _this setDir 265.214;
  _this setPos [(_centerSpawnX)-11.0278, (_centerSpawnY)-6.28003, (_centerSpawnZ)-0.000255585];
};

_vehicle_64 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_64 = _this;
  _this setDir 359.593;
  _this setPos [(_centerSpawnX)+9.11963, (_centerSpawnY)+10.0786, (_centerSpawnZ)-0.2];
};

_vehicle_66 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_66 = _this;
  _this setDir 180.322;
  _this setPos [(_centerSpawnX)+9.39697, (_centerSpawnY)-10.2976, (_centerSpawnZ)-0.2];
};

_vehicle_67 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_67 = _this;
  _this setDir 91.2743;
  _this setPos [(_centerSpawnX)-11.0815, (_centerSpawnY)+0.161865, (_centerSpawnZ)-0.00215149];
};

_vehicle_68 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_68 = _this;
  _this setDir 90.4928;
  _this setPos [(_centerSpawnX)+11.918, (_centerSpawnY)+6.646, (_centerSpawnZ)+0.00112534];
};

_vehicle_69 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_69 = _this;
  _this setDir 89.5461;
  _this setPos [(_centerSpawnX)+12.2314, (_centerSpawnY)-6.46582, (_centerSpawnZ)+0.0010376];
};

_vehicle_70 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_70 = _this;
  _this setDir 267.704;
  _this setPos [(_centerSpawnX)+12.0425, (_centerSpawnY)-0.11084, (_centerSpawnZ)-0.0039978];
};

_vehicle_71 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_71 = _this;
  _this setDir 89.5642;
  _this setPos [(_centerSpawnX)-10.5918, (_centerSpawnY)-74.2905, (_centerSpawnZ)-1.33514e-005];
};

_vehicle_72 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_72 = _this;
  _this setDir 263.596;
  _this setPos [(_centerSpawnX)-8.53271, (_centerSpawnY)-75.5403, (_centerSpawnZ)+1.14441e-005];
};

_vehicle_52 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_AT1, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_52 = _this;
  _this setDir 184.721;
  _this setPos [(_centerSpawnX)-7.77002, (_centerSpawnY)-5.99805, (_centerSpawnZ)-0.0515079];
};

_vehicle_54 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_AA, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_54 = _this;
  _this setDir 0;
  _this setPos [(_centerSpawnX)-7.98682, (_centerSpawnY)+7.35327, (_centerSpawnZ)-0.0325794];
};

_vehicle_65 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_65 = _this;
  _this setDir 188.218;
  _this setPos [(_centerSpawnX)+9.30469, (_centerSpawnY)-8.87988, (_centerSpawnZ)-0.125292];
};

_vehicle_59 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_AT, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_59 = _this;
  _this setDir 11.6573;
  _this setPos [(_centerSpawnX)+9.50293, (_centerSpawnY)+7.80933, (_centerSpawnZ)-0.0945511];
};

_groupBunker1 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_groupBunker2 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker2 deleteGroupWhenEmpty true;
_groupBunker3 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker3 deleteGroupWhenEmpty true;
_groupBunker4 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker4 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;
_guard2 = units _groupBunker2 select 0;
_guard3 = units _groupBunker3 select 0;
_guard4 = units _groupBunker4 select 0;
_guard1 moveinGunner _vehicle_52;
_guard2 moveinGunner _vehicle_54;
_guard3 moveinGunner _vehicle_65;
_guard4 moveinGunner _vehicle_59;

//private "_flg";
//missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], opfor_STATIC_FLAG createVehicle [(_flagPos select 0)+8,(_flagPos select 1)]];
//call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
//_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";

//private "_flg";
//missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+5,(_flagPos select 1)]];
//call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
//_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";*/
