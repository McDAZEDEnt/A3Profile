
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
	["mapboard",[1.74634,-0.102295,0],90.5037,1,0,[],"","",true,false], 
	["wx_table04",[1.14087,-1.6344,0],264.108,1,0,[],"","",true,false], 
	["uns_villtable1",[1.55542,1.69958,0],0,1,0,[],"","",true,false], 
	["wx_table03",[-1.97827,-1.56018,0],270.284,1,0,[],"","",true,false], 
	["uns_SON9_NVA",[4.11353,-0.630493,-0.0749998],89.8929,1,0,[],"","",true,false],	
	["ABox_2",[-1.42041,9.42261,0],173.218,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-11.1501,0.296997,0],9.25694,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-11.0154,-4.93188,0],353.317,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[3.57349,-11.6042,0],274.613,1,0,[],"","",true,false], 
	[opfor_STATIC_FLAG,[10.113,-6.64319,0],271.386,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-12.88892,-1.9502,0],87.5168,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[9.13452,-11.2546,0],258.672,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[5.74976,-13.17273,0],1.23938,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-1.68091,14.7877,0],88.7779,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-7.1792,13.8743,0],72.8375,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[15.8987,3.81067,0],186.133,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-3.05103,17.2137,0],176.922,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[15.697,9.37976,0],170.193,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[17.4434,5.56799,0],270.165,1,0,[],"","",true,false] 
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

_vehicle_95 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-0.459473, (_centerSpawnY)+0.716797], [], 0, "CAN_COLLIDE"];
  _vehicle_95 = _this;
  _this setDir 89.6231;
};
_vehicle_95 allowdamage false;
_vehicle_95 setdamage 0;

_vehicle_96 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)+0.0244141, (_centerSpawnY)+3.84448], [], 0, "CAN_COLLIDE"];
  _vehicle_96 = _this;
  _this setDir 267.348;
};
_vehicle_96 allowdamage false;
_vehicle_96 setdamage 0;

_vehicle_97 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-3.91162, (_centerSpawnY)-0.140381], [], 0, "CAN_COLLIDE"];
  _vehicle_97 = _this;
  _this setDir 178.406;
};
_vehicle_97 allowdamage false;
_vehicle_97 setdamage 0;

_vehicle_98 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-0.136426, (_centerSpawnY)-3.94849], [], 0, "CAN_COLLIDE"];
  _vehicle_98 = _this;
  _this setDir 90.5905;
};
_vehicle_98 allowdamage false;
_vehicle_98 setdamage 0;

_vehicle_99 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)+5.42334, (_centerSpawnY)+4.91736], [], 0, "CAN_COLLIDE"];
  _vehicle_99 = _this;
  _this setDir 270.451;
};
_vehicle_99 allowdamage false;
_vehicle_99 setdamage 0;

_vehicle_100 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)+5.38232, (_centerSpawnY)-5.06958], [], 0, "CAN_COLLIDE"];
  _vehicle_100 = _this;
  _this setDir 90.5905;
};
_vehicle_100 allowdamage false;
_vehicle_100 setdamage 0;

_vehicle_101 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter2", [(_centerSpawnX)+14.4136, (_centerSpawnY)+12.7926], [], 0, "CAN_COLLIDE"];
  _vehicle_101 = _this;
  _this setDir 180.8679;
};
_vehicle_101 allowdamage false;
_vehicle_101 setdamage 0;

_vehicle_102 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter2", [(_centerSpawnX)-5.06665, (_centerSpawnY)-8.31982], [], 0, "CAN_COLLIDE"];
  _vehicle_102 = _this;
  _this setDir 0;
};
_vehicle_102 allowdamage false;
_vehicle_102 setdamage 0;

_vehicle_101 = objNull;
_this = createVehicle ["uns_AmmoBoxNVA", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_101 = _this;
_this setDir 268.857;
_this setPosATL [(_centerSpawnX)-5.74585, (_centerSpawnY)+0.328491, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_102 = objNull;
_this = createVehicle ["uns_AmmoBoxVC", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_102 = _this;
_this setDir 272.376;
_this setPosATL [(_centerSpawnX)-7.28003, (_centerSpawnY)-8.42041, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_105 = objNull;
_this = createVehicle ["uns_AmmoBoxVC", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_105 = _this;
_this setDir 87.0816;
_this setPosATL [(_centerSpawnX)+11.73071, (_centerSpawnY)+12.1508, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_103 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)-1.38208, (_centerSpawnY)-8.89148], [], 0, "CAN_COLLIDE"];
  _vehicle_103 = _this;
  _this setDir 180.135;
};
_vehicle_103 allowdamage false;
_vehicle_103 setdamage 0;
//_vehicle_103 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_104 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)-8.66895, (_centerSpawnY)+5.00952], [], 0, "CAN_COLLIDE"];
  _vehicle_104 = _this;
  _this setDir 272.113;
};
_vehicle_104 allowdamage false;
_vehicle_104 setdamage 0;
//_vehicle_104 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_106 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)+3.41382, (_centerSpawnY)+12.0251], [], 0, "CAN_COLLIDE"];
  _vehicle_106 = _this;
  _this setDir 0;
};
_vehicle_106 allowdamage false;
_vehicle_106 setdamage 0;
//_vehicle_106 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_107 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_VC", [(_centerSpawnX)+13.2651, (_centerSpawnY)-1.66699], [], 0, "CAN_COLLIDE"];
  _vehicle_107 = _this;
  _this setDir 91.0097;
};
_vehicle_107 allowdamage false;
_vehicle_107 setdamage 0;
//_vehicle_107 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

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
  _this = createVehicle ["uns_sniper_tree2_t6_empty", [(_centerSpawnX)-100, (_centerSpawnY)-50], [], 0, "CAN_COLLIDE"];
  _vehicle_109 = _this;
  _this setDir 0;
};


sleep 1;

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard4 = units _groupBunker select 3;
_guard1 moveinGunner _vehicle_103;
_guard2 moveinGunner _vehicle_104;
_guard3 moveinGunner _vehicle_106;
_guard4 moveinGunner _vehicle_107;

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

