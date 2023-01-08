
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
	["uns_mash_main",[-0.242188,0.200806,0],0.774844,1,0,[],"","",true,false], 
	["MedicalGarbage_01_3x3_v2_F",[-0.0766602,-5.7533,0],272.396,1,0,[],"","",true,false], 
	["LAND_stretcher",[-1.28906,-5.83386,0],357.769,1,0,[],"","",true,false], 
	["MedicalGarbage_01_1x1_v3_F",[-1.92578,-5.797,0],272.396,1,0,[],"","",true,false], 
	["LAND_stretcher",[-2.51782,-5.86267,0],357.769,1,0,[],"","",true,false], 
	["CamoNet_BLUFOR_F",[-1.40088,-6.53699,0],178.74,1,0,[],"","",true,false], 
	["LAND_stretcher",[-3.52515,-5.87708,0],357.769,1,0,[],"","",true,false], 
	["MedicalGarbage_01_1x1_v3_F",[-4.33813,-6.31177,0],272.396,1,0,[],"","",true,false], 
	["uns_M577_amb",[1.31616,7.79187,-0.51834],89.5766,1,0,[],"","",true,false], 
	["uns_medical1",[-5.26709,-6.77002,0],179.737,1,0,[],"","",true,false], 
	["CamoNet_BLUFOR_F",[-0.251709,8.46448,1.10279],352.668,1,0,[],"","",true,false], 
	["wx_defenceposition_06_Stretcher",[-6.67236,-6.94763,0],182.792,1,0,[],"","",true,false], 
	["LAND_t_sb_20_half",[-0.487061,-6.09827,0],179.528,1,0,[],"","",true,false], 
	["uns_sbagwall_8",[10.2444,-0.70752,0],180.473,1,0,[],"","",true,false], 
	["wx_defenceposition_06_Stretcher",[-2.68774,10.1252,0],3.35737,1,0,[],"","",true,false], 
	["wx_defenceposition_06_Stretcher",[-3.54053,10.1591,0],3.89766,1,0,[],"","",true,false], 
	["Land_barels3",[-5.39453,9.07031,0],272.396,1,0,[],"","",true,false], 
	["uns_sbagwall_4",[11.0881,1.91833,0],58.2482,1,0,[],"","",true,false], 
	["LAND_t_sb_cnr_half",[-11.6885,-6.38013,0],90.0604,1,0,[],"","",true,false], 
	["Land_fortified_nest_small_ep1",[11.1052,-5.50037,0],270.792,1,0,[],"","",true,false], 
	["uns_medical1",[-11.5728,-1.66211,0],272.396,1,0,[],"","",true,false], 
	["LAND_barel6",[-7.40381,9.20642,0],272.396,1,0,[],"","",true,false], 
	["uns_FlagCarrierMed",[10.8667,3.66284,0],272.396,1,0,[],"","",true,false], 
	["LAND_barel8",[-6.95557,9.87769,0],272.396,1,0,[],"","",true,false], 
	["uns_engineerbox_US",[-11.7903,-3.43982,0],91.2995,1,0,[],"","",true,false], 
	["uns_sbagwall_4",[11.8721,3.49902,0],358.193,1,0,[],"","",true,false], 
	["LAND_t_sb_20_half",[0.0773926,9.15186,0],0.0500789,1,0,[],"","",true,false], 
	["Land_fortified_nest_small_ep1",[-12.1665,9.23804,0],89.7684,1,0,[],"","",true,false] 
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
_this setPosATL [(_centerSpawnX)-10.7864, (_centerSpawnY)-6.37061, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_104 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)+11.8862, (_centerSpawnY)-4.03857], [], 0, "CAN_COLLIDE"];
  _vehicle_104 = _this;
  _this setDir 89.515;
};
_vehicle_104 allowdamage false;
_vehicle_104 setdamage 0;
//_vehicle_104 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_105 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)-11.624, (_centerSpawnY)+9.76489], [], 0, "CAN_COLLIDE"];
  _vehicle_105 = _this;
  _this setDir 269.458;
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

