
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

///////////////////////////////////////////////////////////////////////

_staticsArray = [
	["Land_dp_transformer_F",[2.00293,4.99219,0],192.999,1,0,[],"","",true,false], 
	["Land_BarrelTrash_F",[-0.851563,6.40234,-0.000926971],3.74565,1,0,[],"","",true,false], 
	["Land_WaterBarrel_F",[-0.0605469,6.55273,0.00536537],356.077,1,0,[],"","",true,false], 
	["Land_CncWall4_F",[-2.03223,6.18164,0],325.046,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[7.24902,-0.580078,0],110.499,1,0,[],"","",true,false], 
	["Land_WaterTank_F",[6.5498,3.66211,-0.00131607],46.4697,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-2.34961,-7.16406,0],13.4016,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[4.79004,-6.0957,0],123.31,1,0,[],"","",true,false], 
	["Land_CncWall4_F",[2.6582,7.28516,0],13.7998,1,0,[],"","",true,false], 
	[opfor_COVERED_TRUCK_X,[-8.00391,-2.00977,-0.0145664],3.58031,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[6.7168,4.87695,0],42.1329,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[5.58496,6.16016,0],46.2758,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[8.24414,2.55078,0],94.134,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[7.64063,3.93164,0],51.7571,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[8.16797,-4.77344,0],120.599,1,0,[],"","",true,false], 
	["Land_Communication_F",[0.800781,1.24414,0],12.4822,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[10.5977,12.9277,0],180,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[-9.40332,-14.293,0],0.0487538,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[10.6963,10.6484,0],0.015886,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[-9.30371,-14.3516,0],0.0487538,1,0,[],"","",true,false] 
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
_vehicle_101 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Cargo_Patrol_V1_F", [0,0,0], [], 0, "CAN_COLLIDE"];
  _vehicle_101 = _this;
  _this setDir 14.7631;
  _this setPosATL [(_centerSpawnX)-1.0498, (_centerSpawnY)-3.01367, 0];
};

_vehicle_102 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Cargo20_grey_F", [0,0,0], [], 0, "CAN_COLLIDE"];
  _vehicle_102 = _this;
  _this setDir 16.6017;
  _this setPosATL [(_centerSpawnX)-0.998047, (_centerSpawnY)-4.32813, 0];
};

_vehicle_103 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)+10.5273, (_centerSpawnY)+11.8906], [], 0, "CAN_COLLIDE"];
  _vehicle_103 = _this;
  _this setDir 43.0991;
};
_vehicle_103 allowdamage false;
_vehicle_103 setdamage 0;
//_vehicle_103 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_104 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)-9.63086, (_centerSpawnY)-13.1152], [], 0, "CAN_COLLIDE"];
  _vehicle_104 = _this;
  _this setDir 215.154;
};
_vehicle_104 allowdamage false;
_vehicle_104 setdamage 0;
//_vehicle_104 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 1;

_groupTower = [[0,0], EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_towerGuard setPos [getpos _vehicle_101 select 0,getpos _vehicle_101 select 1,4];
_towerGuard setUnitPos "UP";
_groupTower setBehaviour "SAFE";

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard1 moveinGunner _vehicle_103;
_guard2 moveinGunner _vehicle_104;

private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+8,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";

_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos _flagPos;





