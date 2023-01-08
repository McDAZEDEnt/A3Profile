
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
	["m113ruin2",[1.55688,8.15015,0],0,1,0,[],"","",true,false], 
	["uns_motorpool1_repair",[-0.759277,8.19702,0],0,1,0,[],"","",true,false], 
	["uns_sbagwall_4",[8.71777,1.59509,0],90.5043,1,0,[],"","",true,false], 
	["CSJPet8_pump",[6.5647,-6.29126,0],91.5633,1,0,[],"","",true,false], 
	["Land_scntr_open",[8.43286,6.69141,0.0674505],1.16362,1,0,[],"","",true,false], 
	[opfor_STATIC_FLAG,[-9.00977,-2.12537,0],118.353,1,0,[],"","",true,false],
	["CamoNet_BLUFOR_F",[-11.2073,4.13513,0],82.6476,1,0,[],"","",true,false],
	["CamoNet_BLUFOR_F",[9.52759,8.09766,0],89.5665,1,0,[],"","",true,false],	
	["Land_wall_indcnc_4_d",[-10.0085,-0.185425,0],271.217,1,0,[],"","",true,false], 
	["uns_M35A2",[2.47681,-10.8733,0.0319748],271.883,1,0,[],"","",true,false], 
	["Land_Wall_indcnc_4",[-9.86304,5.37085,0],90.7923,1,0,[],"","",true,false], 
	["uns_sbagwall_8",[-12.2175,-1.30237,0],108.885,1,0,[],"","",true,false], 
	["LAND_barel5",[-1.1814,-12.9104,0],174.877,1,0,[],"","",true,false], 
	["LAND_t_sb_5_half",[12.18242,-4.95227,0.074193],93.3635,1,0,[],"","",true,false], 
	["Barel",[-1.82788,-13.2268,0],143.007,1,0,[],"","",true,false], 
	["Barels",[-3.54395,-13.4509,0],0,1,0,[],"","",true,false], 
	["LAND_barel8",[-0.581787,-13.5198,0],219.053,1,0,[],"","",true,false], 
	["LAND_sb_revetment",[-8.46387,-13.7107,0],0,1,0,[],"","",true,false], 
	["Land_BarGate_01_open_F",[-11.8501,-7.75464,0],89.8802,1,0,[],"","",true,false], 
	["LAND_t_sb_cnr_half",[7.03589,-11.7743,0],0,1,0,[],"","",true,false], 
	["LAND_tower_1",[-8.73145,-12.8098,0],271.255,1,0,[],"","",true,false], 
	["LAND_t_sb_45_half",[13.4107,7.12463,0],293.903,1,0,[],"","",true,false], 
	["Land_fortified_nest_small_EP1",[-16.1682,1.44165,0],79.7576,1,0,[],"","",true,false], 
	["uns_sbagwall_8",[-15.6714,5.17383,0],349.915,1,0,[],"","",true,false], 
	["LAND_t_sb_5_half",[-1.56812,-17.4176,0.0742116],164.153,1,0,[],"","",true,false], 
	["LAND_t_sb_5_half",[-12.24829,12.024,0.0742025],268.573,1,0,[],"","",true,false], 
	["uns_sbagwall_4",[-15.2676,8.03149,0],227.69,1,0,[],"","",true,false], 
	["Land_fortified_nest_small_EP1",[8.74268,15.9485,0],182.803,1,0,[],"","",true,false], 
	["uns_sbagwall_8",[-8.99487,15.9043,0],28.4929,1,0,[],"","",true,false],  
	["uns_sbagwall_4",[-6.90381,17.7552,0],266.269,1,0,[],"","",true,false] 
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
_this = createVehicle ["uns_AmmoBoxUS_army", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_101 = _this;
_this setDir 268.593;
_this setPosATL [(_centerSpawnX)-11.0052, (_centerSpawnY)+4.97241, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_102 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)-9.23145, (_centerSpawnY)-12.8098,3.97301], [], 0, "CAN_COLLIDE"];
  _vehicle_102 = _this;
  _this setDir 272.66;
};
_vehicle_102 allowdamage false;
_vehicle_102 setdamage 0;
//_vehicle_102 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_103 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)-16.5862, (_centerSpawnY)+0.957764], [], 0, "CAN_COLLIDE"];
  _vehicle_103 = _this;
  _this setDir 184.153;
};
_vehicle_103 allowdamage false;
_vehicle_103 setdamage 0;
//_vehicle_103 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_104 = objNull;
if (true) then
{
  _this = createVehicle ["uns_m60_high", [(_centerSpawnX)+8.2688, (_centerSpawnY)+16.4099], [], 0, "CAN_COLLIDE"];
  _vehicle_104 = _this;
  _this setDir 358.2;
};
_vehicle_104 allowdamage false;
_vehicle_104 setdamage 0;
//_vehicle_104 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 1;

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard1 moveinGunner _vehicle_102;
_guard2 moveinGunner _vehicle_103;
_guard3 moveinGunner _vehicle_104;

