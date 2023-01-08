
_centerSpawn = _this select 0;
_centerSpawnX = _centerSpawn select 0;
_centerSpawnY = _centerSpawn select 1;
_flagPos = _this select 0;

_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["Land_MultiMeter_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setPos _centerSpawn;
};
_centerSpawnZ = (getpos _vehicle_0 select 2);
deleteVehicle _vehicle_0;

////////////////////////////////////////////////////////////////////

_staticsArray = [
	["Land_Bench_F",[-0.404297,2.15234,0],14.868,1,0,[],"","",true,false], 
	["Land_CanisterPlastic_F",[-2.05762,-1.0918,-3.8147e-006],138.15,1,0,[],"","",true,false], 
	["Land_Cargo_House_V1_F",[-3.53613,-0.0820313,-1.90735e-006],285.444,1,0,[],"","",true,false], 
	["Land_CanisterPlastic_F",[-2.24023,-1.5625,9.53674e-006],193.168,1,0,[],"","",true,false], 
	["Land_WaterBarrel_F",[-2.21484,-2.36328,0],360,1,0,[],"","",true,false], 
	["Land_WaterTank_F",[4.05664,-1.61289,-1.71661e-005],30.685,1,0,[],"","",true,false], 
	["Land_HBarrier_3_F",[-5.93848,3.99609,0],15.8872,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[2.38281,4.85547,-9.53674e-006],16.4987,1,0,[],"","",true,false], 
	["Land_Cargo20_grey_F",[2.05176,-4.92383,0],301.021,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[0.546875,5.77148,-7.62939e-006],0,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[4.2002,4.28906,1.90735e-006],11.829,1,0,[],"","",true,false], 
	["Land_HBarrier_1_F",[-8.44531,4.04102,0],103.437,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-8.97754,1.26758,5.72205e-006],104.75,1,0,[],"","",true,false], 
	["Land_FieldToilet_F",[-6.8877,-3.61211,-3.8147e-006],359.188,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-5.83984,-6.41992,-1.90735e-006],15.3326,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[8.29102,10.1074,0],180,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[-11.709,-11.002,0],0,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[8.29102,8.99805,0],0,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[-11.709,-11.002,0],0,1,0,[],"","",true,false] 
];

// PLACE STATICS WITHOUT INTERACTION
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

// PLACE STATICS WITH INTERACTION
_vehicle_31 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)+8.29102, (_centerSpawnY)+9.55273], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 43.4536;
};
_vehicle_31 allowdamage false;
_vehicle_31 setdamage 0;
//_vehicle_31 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)-11.709, (_centerSpawnY)-10.4473], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 226.646;
};
_vehicle_32 allowdamage false;
_vehicle_32 setdamage 0;
//_vehicle_32 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard1 moveinGunner _vehicle_31;
_guard2 moveinGunner _vehicle_32;

private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+5,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";

_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos _flagPos;

