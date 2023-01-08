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
  _this = createVehicle ["Land_MetalBarrel_empty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 285;
  _this setPos [(_centerSpawnX)-0.0332031, (_centerSpawnY)-2.2793, (_centerSpawnZ)-9.53674e-007];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_AMMO, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 314.302;
  _this setPos [(_centerSpawnX)-2.61719, (_centerSpawnY)+0.564453, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_17 = objNull;
if (true) then
{
  _this = createVehicle ["Land_tent_east", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_17 = _this;
  _this setDir 226.025;
  _this setPos [(_centerSpawnX)-2.96289, (_centerSpawnY)-4.87695, (_centerSpawnZ)+0];
  _vehicle_17 allowdamage false;
  _vehicle_17 setdamage 0;
};

_vehicle_4 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_conference_table_a", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_4 = _this;
  _this setDir 227.59;
  _this setPos [(_centerSpawnX)-1.11523, (_centerSpawnY)-3.375, (_centerSpawnZ)-0.0164423];
};

_vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle ["OfficeTable_01_old_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_16 = _this;
  _this setDir 47.238;
  _this setPos [(_centerSpawnX)+1.0332, (_centerSpawnY)-5.75977, (_centerSpawnZ)+0];
};

_vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["Land_I44_Object_Radio_G_20WSd", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_5 = _this;
  _this setDir 46.0215;
  _this setPos [(_centerSpawnX)-1.15625, (_centerSpawnY)-3.24609, (_centerSpawnZ)+0.687105];
};

_vehicle_6 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_SovRadio", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_6 = _this;
  _this setDir 343.37;
  _this setPos [(_centerSpawnX)-0.802734, (_centerSpawnY)-3.72852, (_centerSpawnZ)+0.670721];
};

_vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Lamp_Small_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_7 = _this;
  _this setDir 37.3505;
  _this setPos [(_centerSpawnX)+0.46875, (_centerSpawnY)-3.39258, (_centerSpawnZ)+0];
};

_vehicle_8 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_8 = _this;
  _this setDir 170.057;
  _this setPos [(_centerSpawnX)+3.66211, (_centerSpawnY)+3.10938, (_centerSpawnZ)+0];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_RAD, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setDir 324.01;
  _this setPos [(_centerSpawnX)+4.26758, (_centerSpawnY)+0.769531, (_centerSpawnZ)+1.90735e-006];
};

_vehicle_10 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_FLAG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_10 = _this;
  _this setDir 325.305;
  _this setPos [(_centerSpawnX)-0.972656, (_centerSpawnY)-1.70703, (_centerSpawnZ)+0];
};


_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["WallMap", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  _this setDir 6.38706;
  _this setPos [(_centerSpawnX)-4.03516, (_centerSpawnY)-1.38477, (_centerSpawnZ)-1.90735e-006];
};

_vehicle_12 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_kitchen_chair_a", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_12 = _this;
  _this setDir 247.834;
  _this setPos [(_centerSpawnX)-2.10156, (_centerSpawnY)-3.85352, (_centerSpawnZ)+0];
};

_vehicle_13 = objNull;
if (true) then
{
  _this = createVehicle ["EvMap", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_14 = _this;
  _this setDir 199.699;
  _this setPos [(_centerSpawnX)+0.738281, (_centerSpawnY)-5.73047, (_centerSpawnZ)+0.833021];
};

_vehicle_15 = objNull;
if (true) then
{
  _this = createVehicle ["Land_I44_Object_Radio_G_20WSd", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_15 = _this;
  _this setDir 46.9167;
  _this setPos [(_centerSpawnX)+1.1582, (_centerSpawnY)-5.65625, (_centerSpawnZ)-0.0178132];
};

_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 225;
  _this setPos [(_centerSpawnX)+2.07227, (_centerSpawnY)-5.67773, (_centerSpawnZ)-2.38419e-007];
};

_vehicle_19 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_Staszow_Map", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_19 = _this;
  _this setDir 43.7429;
  _this setPos [(_centerSpawnX)+0.492188, (_centerSpawnY)+6.22852, (_centerSpawnZ)-0.2];
};

_vehicle_20 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_kitchen_chair_a", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_20 = _this;
  _this setDir 180.825;
  _this setPos [(_centerSpawnX)+0.445313, (_centerSpawnY)-6.35352, (_centerSpawnZ)+0];
};

_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle ["Land_PicnicTable_01_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setDir 222.289;
  _this setPos [(_centerSpawnX)-0.433594, (_centerSpawnY)+6.77539, (_centerSpawnZ)+0];
};

_vehicle_22 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Setka_Dor", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_22 = _this;
  _this setDir 225.856;
  _this setPos [(_centerSpawnX)+6.50781, (_centerSpawnY)+4.27539, (_centerSpawnZ)+3.8147e-006];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNetVar_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 314.701;
  _this setPos [(_centerSpawnX)-2.03516, (_centerSpawnY)+6.0625, (_centerSpawnZ)+0.649835];
  _vehicle_23 allowdamage false;
  _vehicle_23 setdamage 0;
};

_vehicle_25 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_vojenska_palanda", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_25 = _this;
  _this setDir 135;
  _this setPos [(_centerSpawnX)-4.38672, (_centerSpawnY)-6.54102, (_centerSpawnZ)+0];
};

_vehicle_26 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CratesWooden_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_26 = _this;
  _this setDir 136.567;
  _this setPos [(_centerSpawnX)-8.13867, (_centerSpawnY)-2.44141, (_centerSpawnZ)+0];
};

_vehicle_27 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces10_50", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_27 = _this;
  _this setDir 350.177;
  _this setPos [(_centerSpawnX)+5.47461, (_centerSpawnY)-11.4902, (_centerSpawnZ)+0];
};

_vehicle_28 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_28 = _this;
  _this setDir 45.0001;
  _this setPos [(_centerSpawnX)-4.22852, (_centerSpawnY)+7.76172, (_centerSpawnZ)+0];
};

_vehicle_29 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_29 = _this;
  _this setDir 45.0001;
  _this setPos [(_centerSpawnX)+1.53125, (_centerSpawnY)+9.00195, (_centerSpawnZ)+0];
};

_vehicle_31 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 135;
  _this setPos [(_centerSpawnX)+8.42188, (_centerSpawnY)-4.10938, (_centerSpawnZ)-0.2];
};

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 225;
  _this setPos [(_centerSpawnX)-7.16406, (_centerSpawnY)-6.16406, (_centerSpawnZ)+0];
};

_vehicle_33 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_33 = _this;
  _this setDir 315;
  _this setPos [(_centerSpawnX)-1.66602, (_centerSpawnY)-10.1016, (_centerSpawnZ)+0];
};

_vehicle_34 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_34 = _this;
  _this setDir 225;
  _this setPos [(_centerSpawnX)-5.01367, (_centerSpawnY)-8.29102, (_centerSpawnZ)+0];
};

_vehicle_35 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_35 = _this;
  _this setDir 225;
  _this setPos [(_centerSpawnX)+10.2715, (_centerSpawnY)-0.814453, (_centerSpawnZ)-0.2];
};

_vehicle_36 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_36 = _this;
  _this setDir 97.4542;
  _this setPos [(_centerSpawnX)+7.28516, (_centerSpawnY)-6.50781, (_centerSpawnZ)-0.2];
};

_vehicle_37 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_37 = _this;
  _this setDir 135.687;
  _this setPos [(_centerSpawnX)-9.59766, (_centerSpawnY)+3.79688, (_centerSpawnZ)-0.2];
};

_vehicle_38 = objNull;
if (true) then
{
  _this = createVehicle ["Wire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_38 = _this;
  _this setDir 45.0001;
  _this setPos [(_centerSpawnX)+8.5625, (_centerSpawnY)+5.90039, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_39 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_39 = _this;
  _this setDir 135;
  _this setPos [(_centerSpawnX)-1.84961, (_centerSpawnY)+10.8203, (_centerSpawnZ)+0];
};

_vehicle_40 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_Setka_Dor", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_40 = _this;
  _this setDir 45.2612;
  _this setPos [(_centerSpawnX)-6.50391, (_centerSpawnY)-8.80078, (_centerSpawnZ)+0];
};

_vehicle_42 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_42 = _this;
  _this setDir 208.468;
  _this setPos [(_centerSpawnX)-11.1191, (_centerSpawnY)-3.19922, (_centerSpawnZ)-0.2];
};

_vehicle_43 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_43 = _this;
  _this setDir 285;
  _this setPos [(_centerSpawnX)-14.0371, (_centerSpawnY)+0.833984, (_centerSpawnZ)-0.2];
};

_vehicle_44 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_44 = _this;
  _this setDir 349.298;
  _this setPos [(_centerSpawnX)+6.49023, (_centerSpawnY)-17.5918, (_centerSpawnZ)+0];
};

_vehicle_30 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_30 = _this;
  _this setDir 137.184;
  _this setPos [(_centerSpawnX)+8.99609, (_centerSpawnY)-1.7793, (_centerSpawnZ)-0.075];
};

_vehicle_41 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_AA, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_41 = _this;
  _this setDir 321.504;
  _this setPos [(_centerSpawnX)-11.0684, (_centerSpawnY)-0.117188, (_centerSpawnZ)+0];
};

_groupBunker1 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_groupBunker2 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker2 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;
_guard2 = units _groupBunker2 select 0;
_guard1 moveinGunner _vehicle_30;
_guard2 moveinGunner _vehicle_41;

/*
private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+5,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";*/
