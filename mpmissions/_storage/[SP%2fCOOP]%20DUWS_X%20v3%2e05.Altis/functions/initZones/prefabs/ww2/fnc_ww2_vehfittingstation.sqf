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
  _this = createVehicle ["CUP_A1_Road_ces10_25", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 71.139;
  _this setPos [(_centerSpawnX)-3.00781, (_centerSpawnY)-0.412109, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 259.82;
  _this setPos [(_centerSpawnX)+7.19336, (_centerSpawnY)+1.74023, (_centerSpawnZ)+1.90735e-006];
};

_vehicle_4 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_4 = _this;
  _this setDir 119.62;
  _this setPos [(_centerSpawnX)+0.505859, (_centerSpawnY)-5.19336, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_5 = _this;
  _this setDir 119.62;
  _this setPos [(_centerSpawnX)+1.13281, (_centerSpawnY)-4.61914, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_6 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_6 = _this;
  _this setDir 14.6195;
  _this setPos [(_centerSpawnX)+1.89063, (_centerSpawnY)-5.07422, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_AmmoCrates_NoInteractive_Large", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_7 = _this;
  _this setDir 262.584;
  _this setPos [(_centerSpawnX)+3.33203, (_centerSpawnY)-4.41211, (_centerSpawnZ)+0];
};

_vehicle_8 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_8 = _this;
  _this setDir 75.315;
  _this setPos [(_centerSpawnX)-8.98828, (_centerSpawnY)-1.86914, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle [opfor_REPAIR_TRUCK_X, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setDir 131.664;
  _this setPos [(_centerSpawnX)-0.230469, (_centerSpawnY)+5.79102, (_centerSpawnZ)+0.0730042];
};

_vehicle_10 = objNull;
if (true) then
{
  _this = createVehicle ["Land_PillboxWall_01_6m_round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_10 = _this;
  _this setDir 352.305;
  _this setPos [(_centerSpawnX)+2.32422, (_centerSpawnY)-5.75195, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces10_100", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  _this setDir 305.072;
  _this setPos [(_centerSpawnX)+13.5254, (_centerSpawnY)-5.66992, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_12 = objNull;
if (true) then
{
  _this = createVehicle [opfor_STATIC_REFIT, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_12 = _this;
  _this setDir 75.8916;
  _this setPos [(_centerSpawnX)-6.96875, (_centerSpawnY)-1.60938, (_centerSpawnZ)+1.90735e-006];
};

_vehicle_13 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_WeaponsBox_Big_GER", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_14 = _this;
  _this setDir 79.7213;
  _this setPos [(_centerSpawnX)+3.72852, (_centerSpawnY)-6.91602, (_centerSpawnZ)+7.15256e-007];
};

_vehicle_15 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_AmmoCrates_NoInteractive_Large", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_15 = _this;
  _this setDir 343.794;
  _this setPos [(_centerSpawnX)-5.82031, (_centerSpawnY)+5.35547, (_centerSpawnZ)+0];
};

_vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_16 = _this;
  _this setDir 139.388;
  _this setPos [(_centerSpawnX)-3.82227, (_centerSpawnY)+10.1406, (_centerSpawnZ)+0];
};

_vehicle_17 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_17 = _this;
  _this setDir 71.8723;
  _this setPos [(_centerSpawnX)-6.95508, (_centerSpawnY)+5.13672, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_18 = _this;
  _this setDir 25.4238;
  _this setPos [(_centerSpawnX)+6.66992, (_centerSpawnY)-5.84766, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_19 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Lamp_Small_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_19 = _this;
  _this setDir 130.562;
  _this setPos [(_centerSpawnX)-5.45313, (_centerSpawnY)+7.18359, (_centerSpawnZ)+0];
};

_vehicle_20 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Lamp_Small_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_20 = _this;
  _this setDir 46.4037;
  _this setPos [(_centerSpawnX)+7.90039, (_centerSpawnY)-5.37109, (_centerSpawnZ)+0];
};

_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNet_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setDir 341.718;
  _this setPos [(_centerSpawnX)+2.32422, (_centerSpawnY)-9.3418, (_centerSpawnZ)+0];
  _vehicle_21 allowdamage false;
  _vehicle_21 setdamage 0;
};

_vehicle_22 = objNull;
if (true) then
{
  _this = createVehicle ["Land_MetalBarrel_empty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_22 = _this;
  _this setDir 112.762;
  _this setPos [(_centerSpawnX)+8.54297, (_centerSpawnY)+5.44727, (_centerSpawnZ)-9.53674e-007];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["Land_PillboxWall_01_6m_round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 312.227;
  _this setPos [(_centerSpawnX)-5.24805, (_centerSpawnY)+9.33203, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_24 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_24 = _this;
  _this setDir 97.7622;
  _this setPos [(_centerSpawnX)+8.25195, (_centerSpawnY)+6.86719, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_25 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_25 = _this;
  _this setDir 82.7623;
  _this setPos [(_centerSpawnX)+9.33008, (_centerSpawnY)+5.95703, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_26 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_26 = _this;
  _this setDir 202.762;
  _this setPos [(_centerSpawnX)+9.78516, (_centerSpawnY)+5.37891, (_centerSpawnZ)+9.05991e-006];
};

_vehicle_27 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_27 = _this;
  _this setDir 327.683;
  _this setPos [(_centerSpawnX)-4.79102, (_centerSpawnY)-8.79297, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_28 = objNull;
if (true) then
{
  _this = createVehicle ["Land_I44_Buildings_Guard_Post_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_28 = _this;
  _this setDir 254.178;
  _this setPos [(_centerSpawnX)-10.4082, (_centerSpawnY)+3.64648, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_29 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_29 = _this;
  _this setDir 85.9118;
  _this setPos [(_centerSpawnX)+8.08203, (_centerSpawnY)-8.01758, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_30 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Pallets_stack_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_30 = _this;
  _this setDir 72.0321;
  _this setPos [(_centerSpawnX)+1.56836, (_centerSpawnY)-11.3594, (_centerSpawnZ)+9.53674e-007];
};

_vehicle_31 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CamoNetB_EAST", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 261.028;
  _this setPos [(_centerSpawnX)-10.9863, (_centerSpawnY)-2.3125, (_centerSpawnZ)+0.357523];
  _vehicle_31 allowdamage false;
  _vehicle_31 setdamage 0;
};

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle ["Land_PillboxWall_01_6m_round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 47.0135;
  _this setPos [(_centerSpawnX)+9.62891, (_centerSpawnY)+7.04688, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_33 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Pallets_stack_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_33 = _this;
  _this setDir 147.032;
  _this setPos [(_centerSpawnX)-0.398438, (_centerSpawnY)-11.875, (_centerSpawnZ)+6.67572e-006];
};

_vehicle_34 = objNull;
if (true) then
{
  _this = createVehicle ["MetalBarrel_burning_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_34 = _this;
  _this setDir 227.952;
  _this setPos [(_centerSpawnX)+11.668, (_centerSpawnY)+2.76172, (_centerSpawnZ)-9.53674e-007];
};

_vehicle_35 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_35 = _this;
  _this setDir 163.891;
  _this setPos [(_centerSpawnX)+5.47266, (_centerSpawnY)-10.7168, (_centerSpawnZ)-0.0750005];
};

_vehicle_36 = objNull;
if (true) then
{
  _this = createVehicle ["Land_vodni_vez", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_36 = _this;
  _this setDir 45.0677;
  _this setPos [(_centerSpawnX)+0.580078, (_centerSpawnY)+11.416, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_37 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_37 = _this;
  _this setDir 167.613;
  _this setPos [(_centerSpawnX)+5.92578, (_centerSpawnY)-12.3535, (_centerSpawnZ)-0.2];
};

_vehicle_38 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_Wachhaus", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_38 = _this;
  _this setDir 47.3046;
  _this setPos [(_centerSpawnX)+13.2754, (_centerSpawnY)+0.835938, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_39 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Pallets_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_39 = _this;
  _this setDir 301.183;
  _this setPos [(_centerSpawnX)+10.6895, (_centerSpawnY)+7.54883, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_40 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_AmmoCrates_NoInteractive_Large", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_40 = _this;
  _this setDir 337.399;
  _this setPos [(_centerSpawnX)-12.2051, (_centerSpawnY)-4.60352, (_centerSpawnZ)+0];
};

_vehicle_41 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_41 = _this;
  _this setDir 226.183;
  _this setPos [(_centerSpawnX)+12.6172, (_centerSpawnY)+3.71094, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_42 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Pallet_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_42 = _this;
  _this setDir 45.4408;
  _this setPos [(_centerSpawnX)+11.3672, (_centerSpawnY)+7.00195, (_centerSpawnZ)+9.05991e-006];
};

_vehicle_43 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_43 = _this;
  _this setDir 72.0331;
  _this setPos [(_centerSpawnX)-1.91406, (_centerSpawnY)-13.3594, (_centerSpawnZ)-4.76837e-007];
};

_vehicle_44 = objNull;
if (true) then
{
  _this = createVehicle ["LIB_AmmoCrates_NoInteractive_Large", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_44 = _this;
  _this setDir 339.944;
  _this setPos [(_centerSpawnX)-13.2695, (_centerSpawnY)+2.58203, (_centerSpawnZ)+0];
};

_vehicle_45 = objNull;
if (true) then
{
  _this = createVehicle ["Land_PillboxWall_01_6m_round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_45 = _this;
  _this setDir 312.227;
  _this setPos [(_centerSpawnX)-1.27539, (_centerSpawnY)+13.6758, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_46 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_46 = _this;
  _this setDir 226.183;
  _this setPos [(_centerSpawnX)+14.3887, (_centerSpawnY)+0.984375, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_47 = objNull;
if (true) then
{
  _this = createVehicle ["Land_WW2_BET_Schranke", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_47 = _this;
  _this setDir 42.5519;
  _this setPos [(_centerSpawnX)+10.248, (_centerSpawnY)-8.24805, (_centerSpawnZ)+0.328293];
};

_vehicle_48 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_48 = _this;
  _this setDir 165.926;
  _this setPos [(_centerSpawnX)-12.1504, (_centerSpawnY)+5.74219, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_49 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_49 = _this;
  _this setDir 5.43997;
  _this setPos [(_centerSpawnX)-10.2109, (_centerSpawnY)-11.3203, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_50 = objNull;
if (true) then
{
  _this = createVehicle ["TK_WarfareBContructionSite_Base_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_50 = _this;
  _this setDir 156.408;
  _this setPos [(_centerSpawnX)-14.1445, (_centerSpawnY)-5.60938, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_51 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_51 = _this;
  _this setDir 226.183;
  _this setPos [(_centerSpawnX)+4.23828, (_centerSpawnY)+12.6367, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_52 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_52 = _this;
  _this setDir 119.62;
  _this setPos [(_centerSpawnX)-15.8398, (_centerSpawnY)-1.91406, (_centerSpawnZ)-0.000240803];
};

_vehicle_53 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Pallet_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_53 = _this;
  _this setDir 336.864;
  _this setPos [(_centerSpawnX)-16.2148, (_centerSpawnY)-1.86914, (_centerSpawnZ)+5.24521e-006];
};

_vehicle_54 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_54 = _this;
  _this setDir 119.62;
  _this setPos [(_centerSpawnX)-16.3594, (_centerSpawnY)-1.58203, (_centerSpawnZ)-0.000240803];
};

_vehicle_55 = objNull;
if (true) then
{
  _this = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_55 = _this;
  _this setDir 119.62;
  _this setPos [(_centerSpawnX)-16.4355, (_centerSpawnY)-2.18164, (_centerSpawnZ)-0.000240803];
};

_vehicle_56 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Pallet_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_56 = _this;
  _this setDir 256.89;
  _this setPos [(_centerSpawnX)-16.7637, (_centerSpawnY)-0.328125, (_centerSpawnZ)+5.24521e-006];
};

_vehicle_57 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_57 = _this;
  _this setDir 245.395;
  _this setPos [(_centerSpawnX)-15.334, (_centerSpawnY)-7.73438, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_58 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_58 = _this;
  _this setDir 245.395;
  _this setPos [(_centerSpawnX)-16.5313, (_centerSpawnY)-5.02344, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_59 = objNull;
if (true) then
{
  _this = createVehicle ["CUP_A1_Road_ces6konec", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_59 = _this;
  _this setDir 305.309;
  _this setPos [(_centerSpawnX)+18.4844, (_centerSpawnY)-9.32813, (_centerSpawnZ)+9.53674e-006];
};

_vehicle_60 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_60 = _this;
  _this setDir 70.3648;
  _this setPos [(_centerSpawnX)-17.7598, (_centerSpawnY)-2.21094, (_centerSpawnZ)+5.72205e-006];
};

_vehicle_61 = objNull;
if (true) then
{
  _this = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_61 = _this;
  _this setDir 260.022;
  _this setPos [(_centerSpawnX)-18.418, (_centerSpawnY)+0.642578, (_centerSpawnZ)+5.72205e-006];
};

_groupBunker1 = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker1 deleteGroupWhenEmpty true;
_guard1 = units _groupBunker1 select 0;
_guard1 moveinGunner _vehicle_35;

/*
private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+5,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";*/
