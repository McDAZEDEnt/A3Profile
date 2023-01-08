
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
	["pook_Land_fort_rampart_MUD",[-11.94824,1.16418,0],89.0714,1,0,[],"","",true,false],
	["pook_Land_fort_rampart_MUD",[12.25708,0.484619,0],270.165,1,0,[],"","",true,false],
	["pook_Land_fort_rampart_MUD",[-0.420898,-15.55762,0],359.612,1,0,[],"","",true,false],
	["LAND_uns_firepit1",[-0.321777,1.07422,0.327234],0,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[-0.733154,1.05103,0],1.74992,1,0,[],"","",true,false], 
	["csj_VCshelter01a",[-0.0258789,-3.30432,-0.840071],0,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[-4.40308,1.23279,0],359.953,1,0,[],"","",true,false], 
	["LAND_uns_vcshelter4",[3.09497,0.795166,-0.545806],1.74992,1,0,[],"","",true,false], 
	["csj_VCshelter01a",[0.254395,5.49548,0],0,1,0,[],"","",true,false], 
	[opfor_STATIC_FLAG,[5.62646,-3.54468,0],220.33,1,0,[],"","",true,false], 
	["wx_sandbag03_mid",[6.36914,7.60339,0],272.149,1,0,[],"","",true,false], 
	["wx_sandbag03_mid",[-5.9375,8.44324,0],272.149,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-10.1956,-1.64087,0],351.796,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-10.0266,3.80078,0],4.09328,1,0,[],"","",true,false], 
	["wx_sandbag03_end",[5.88843,10.77722,0],248.266,1,0,[],"","",true,false],  
	["Land_wx_fielddefence_04",[10.8901,-2.30591,0],186.133,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[10.6885,3.26318,0],170.193,1,0,[],"","",true,false], 
	["wx_sandbag03_end",[-4.87769,11.51709,0],301.128,1,0,[],"","",true,false],  
	["wx_sandbag05",[0.10376,13.6685,0],180.202,1,0,[],"","",true,false] 
	 
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
_vehicle_20 = objNull;
_this = createVehicle ["uns_AmmoBoxNVA", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_20 = _this;
_this setDir 180.973;
_this setPosATL [(_centerSpawnX)+0.0463867, (_centerSpawnY)-3.2627, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;


_vehicle_21 = objNull;
_this = createVehicle ["uns_EQPT_NVA", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_21 = _this;
_this setDir 178.542;
_this setPosATL [(_centerSpawnX)+4.87842, (_centerSpawnY)+1.08301, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;


_vehicle_28 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_twin_bunker_closed_VC", [(_centerSpawnX)-6.96533, (_centerSpawnY)-9.69238], [], 0, "CAN_COLLIDE"];
  _vehicle_28 = _this;
  _this setDir 217.55;
};
_vehicle_28 allowdamage false;
_vehicle_28 setdamage 0;
//_vehicle_28 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_29 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_twin_bunker_closed_VC", [(_centerSpawnX)+6.26904, (_centerSpawnY)-10.1846], [], 0, "CAN_COLLIDE"];
  _vehicle_29 = _this;
  _this setDir 156.613;
};
_vehicle_29 allowdamage false;
_vehicle_29 setdamage 0;
//_vehicle_29 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_30 = objNull;
if (true) then
{
  _this = createVehicle ["uns_ZU23_NVA", [(_centerSpawnX)+0.0795898, (_centerSpawnY)+10.9404], [], 0, "CAN_COLLIDE"];
  _vehicle_30 = _this;
  _this setDir 0;
};
_vehicle_30 allowdamage false;
_vehicle_30 setdamage 0;
//_vehicle_30 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

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
  _this = createVehicle ["uns_sniper_tree2_t6_empty", [(_centerSpawnX)-1, (_centerSpawnY)-100], [], 0, "CAN_COLLIDE"];
  _vehicle_109 = _this;
  _this setDir 0;
};

sleep 1;
_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard1 moveinGunner _vehicle_28;
_guard2 moveinGunner _vehicle_29;
_guard3 moveinGunner _vehicle_30;

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
