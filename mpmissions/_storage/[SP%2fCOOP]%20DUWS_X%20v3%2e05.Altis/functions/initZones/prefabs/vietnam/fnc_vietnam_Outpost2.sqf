
_centerSpawn = _this select 0;
_centerSpawnX = _centerSpawn select 0;
_centerSpawnY = _centerSpawn select 1;



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
	["LAND_CSJ_Yard_penGate",[-1.96094,0.713989,0],90.1885,1,0,[],"","",true,false], 
	["LAND_uns_CongCage",[4.01978,2.711133,0],0,1,0,[],"","",true,false], 
	["LAND_csj_hut02",[3.31274,-3.30886,0],0,1,0,[],"","",true,false], 
	["LAND_uns_corral1",[-5.50537,-1.8064,0],0,1,0,[],"","",true,false], 
	["LAND_CSJ_Yard_pen1",[-5.22461,2.15613,0],269.561,1,0,[],"","",true,false], 
	[opfor_STATIC_FLAG,[0.740234,-4.16565,0],220.33,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[7.7417,-1.34243,0],1.09855,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[3.14941,8.39026,0],91.0847,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[-2.34424,-9.53125,0],273.884,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter5",[-6.10059,6.98962,0.00100136],271.48,1,0,[],"","",true,false], 
	["Land_Wood_Tower2",[-6.49658,-8.68884,0],0,1,0,[],"","",true,false], 
	["Land_Wood_Tower2",[7.99268,7.77893,0],179.293,1,0,[],"","",true,false], 
	["Vil_Fence",[4.55884,-11.8221,0],178.703,1,0,[],"","",true,false], 
	["Vil_Fence",[-12.027,5.61072,0],90.7951,1,0,[],"","",true,false], 
	["Vil_Fence",[10.313,-6.87561,0],88.8664,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-0.335938,-13.9429,0],260.963,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[2.01416,13.86,0],82.9544,1,0,[],"","",true,false], 
	["Vil_Fence",[11.9333,8.59241,0],54.5555,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-15.1953,0.762695,0],6.02869,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-5.90723,-14.0715,0],276.903,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-14.9817,-4.8064,0],350.088,1,0,[],"","",true,false],
	["Land_wx_fielddefence_04",[7.58618,13.7953,0],98.8948,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[4.83252,17.1691,0],177.891,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-3.71411,-17.8816,0],0.216879,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-18.1033,-2.11096,4.76837e-007],89.8345,1,0,[],"","",true,false] 
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
  _this = createVehicle ["uns_pk_high_NVA", [(_centerSpawnX)-6.49658, (_centerSpawnY)-9.68884,3], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 182.695;
};
_vehicle_31 allowdamage false;
_vehicle_31 setdamage 0;
//_vehicle_31 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle ["uns_pk_high_NVA", [(_centerSpawnX)+7.99268, (_centerSpawnY)+8.77893,3], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 1.98805;
};
_vehicle_32 allowdamage false;
_vehicle_32 setdamage 0;
//_vehicle_32 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_33 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_NVA", [(_centerSpawnX)+11.0313, (_centerSpawnY)-1.95593], [], 0, "CAN_COLLIDE"];
  _vehicle_33 = _this;
  _this setDir 87.9372;
};
_vehicle_33 allowdamage false;
_vehicle_33 setdamage 0;
//_vehicle_33 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_108 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sniper_tree2_t5_empty", [(_centerSpawnX)+100, (_centerSpawnY)-1], [], 0, "CAN_COLLIDE"];
  _vehicle_108 = _this;
  _this setDir 0;
};

_vehicle_109 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sniper_tree2_t2_empty", [(_centerSpawnX)-1, (_centerSpawnY)-75], [], 0, "CAN_COLLIDE"];
  _vehicle_109 = _this;
  _this setDir 0;
};

sleep 5;
_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard1 moveinGunner _vehicle_31;
_guard2 moveinGunner _vehicle_32;
_guard3 moveinGunner _vehicle_33;

//sniper trees
_groupTower = [getpos _vehicle_108, EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_towerGuard setPos [(getposATL _vehicle_108 select 0)-1.7,(getposATL _vehicle_108 select 1)+0.5,+12];
_towerGuard setUnitPos "DOWN";
_groupTower setBehaviour "AWARE";

_groupTower1 = [getpos _vehicle_109, EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower1 deleteGroupWhenEmpty true;
_towerGuard1 = units _groupTower1 select 0;
_towerGuard1 setPos [(getposATL _vehicle_109 select 0)-1.7,(getposATL _vehicle_109 select 1)-0.5,+15];
_towerGuard1 setUnitPos "DOWN";
_towerGuard1 setDir 180;
_groupTower1 setBehaviour "AWARE";
