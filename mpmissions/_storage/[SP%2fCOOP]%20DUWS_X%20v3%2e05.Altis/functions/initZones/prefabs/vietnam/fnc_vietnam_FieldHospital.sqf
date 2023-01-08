
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
	["uns_mash_main",[0.806641,0.220215,0.1],180.194,1,0,[],"","",true,false], 
	["MedicalGarbage_01_3x3_v2_F",[0.580811,6.17236,0],91.8154,1,0,[],"","",true,false], 
	["LAND_stretcher",[1.79248,6.26526,0],177.189,1,0,[],"","",true,false], 
	["MedicalGarbage_01_1x1_v3_F",[2.42969,6.23474,0],91.8154,1,0,[],"","",true,false], 
	["LAND_stretcher",[3.021,6.3064,0],177.189,1,0,[],"","",true,false], 
	["CamoNet_BLUFOR_F",[1.89722,6.9696,0],358.16,1,0,[],"","",true,false], 
	["LAND_stretcher",[4.02808,6.33118,0],177.189,1,0,[],"","",true,false], 
	["uns_M577_amb",[-0.489258,-7.5769,-0.518341],268.996,1,0,[],"","",true,false], 
	["CamoNet_BLUFOR_F",[0.900391,-8.04285,1.20279],172.088,1,0,[],"","",true,false], 
	["MedicalGarbage_01_1x1_v3_F",[4.83667,6.77393,0],91.8154,1,0,[],"","",true,false], 
	["uns_medical1",[5.76099,7.24158,0],359.156,1,0,[],"","",true,false], 
	["uns_sbagwall_8",[-9.68848,1.02222,0],359.892,1,0,[],"","",true,false], 
	["wx_defenceposition_06_Stretcher",[3.35254,-9.67896,0],182.777,1,0,[],"","",true,false], 
	["wx_defenceposition_06_Stretcher",[7.16431,7.43359,0],2.21145,1,0,[],"","",true,false], 
	["LAND_t_sb_20_half",[0.964111,10.30938,0],358.948,1,0,[],"","",true,false], 
	["wx_defenceposition_06_Stretcher",[4.20581,-9.70398,0],183.317,1,0,[],"","",true,false], 
	["uns_sbagwall_4",[-10.5056,-1.61206,0],237.668,1,0,[],"","",true,false], 
	["Land_barels3",[6.04907,-8.59668,0],91.8154,1,0,[],"","",true,false], 
	["uns_FlagCarrierMed",[-10.2664,-3.35425,0],91.8154,1,0,[],"","",true,false], 
	["Land_fortified_nest_small_ep1",[-10.5979,5.80615,0],90.2114,1,0,[],"","",true,false], 
	["uns_sbagwall_4",[-11.2734,-3.20056,0],177.612,1,0,[],"","",true,false], 
	["LAND_barel6",[8.05957,-8.71228,0],91.8154,1,0,[],"","",true,false], 
	["LAND_t_sb_cnr_half",[11.386,5.41687,0],269.48,1,0,[],"","",true,false], 
	["LAND_barel8",[7.61792,-9.38806,0],91.8154,1,0,[],"","",true,false], 
	["uns_medical1",[12.1182,2.19775,0],91.8154,1,0,[],"","",true,false], 
	["LAND_t_sb_20_half",[0.554688,-12.92139,0],179.47,1,0,[],"","",true,false], 
	["uns_engineerbox_US",[12.366,3.65515,0],270.719,1,0,[],"","",true,false], 
	["Land_fortified_nest_small_ep1",[12.822,-8.6958,0],269.188,1,0,[],"","",true,false] 
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
_this = createVehicle ["uns_AmmoBoxUS_SOG2", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_101 = _this;
_this setDir 222.524;
_this setPosATL [(_centerSpawnX)+11.2859, (_centerSpawnY)+5.89661, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_104 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)-11.7939, (_centerSpawnY)+5.78357], [], 0, "CAN_COLLIDE"];
  _vehicle_104 = _this;
  _this setDir 268.934;
};
_vehicle_104 allowdamage false;
_vehicle_104 setdamage 0;
//_vehicle_104 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_105 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)+11.8547, (_centerSpawnY)-7.78101], [], 0, "CAN_COLLIDE"];
  _vehicle_105 = _this;
  _this setDir 88.8776;
};
_vehicle_105 allowdamage false;
_vehicle_105 setdamage 0;
//_vehicle_105 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 1;

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard1 moveinGunner _vehicle_104;
_guard2 moveinGunner _vehicle_105;

