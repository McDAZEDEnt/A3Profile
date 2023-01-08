
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
	["Land_Grinder_F",[0.808594,-0.402344,-0.00592327],246.938,1,0,[],"","",true,false], 
	["Land_IronPipes_F",[3.0957,-1.25781,-9.53674e-007],271.875,1,0,[],"","",true,false], 
	["Land_Pipes_large_F",[0.046875,-3.29492,0],262.486,1,0,[],"","",true,false], 
	["Land_Tyres_F",[1.29883,3.87891,0],60.68,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[3,3.65234,7.62939e-006],84.5021,1,0,[],"","",true,false], 
	["Land_Bench_F",[-2.82813,-3.90625,-4.76837e-007],180.328,1,0,[],"","",true,false], 
	["Land_MetalBarrel_F",[4.2832,-2.23047,1.43051e-006],359.998,1,0.00473517,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[4.4707,-4.17773,-3.8147e-006],103.707,1,0,[],"","",true,false], 
	["Land_Shoot_House_Tunnel_Crouch_F",[-4.38281,-4.16016,-4.76837e-007],5.50054,1,0,[],"","",true,false], 
	["Land_Bench_F",[-6.51953,1.72852,-2.38419e-007],96.6072,1,0,[],"","",true,false], 
	["Land_MetalBarrel_empty_F",[5.38477,-4.72852,-1.04904e-005],0,1,0,[],"","",true,false], 
	["Land_Wreck_Truck_dropside_F",[1.0332,-7.55469,-1.52588e-005],30.3095,1,0,[],"","",true,false], 
	[opfor_TRANS_TRUCK_X,[-6.94727,-2.16406,-0.0147729],187.683,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[4.47656,-6.16992,-3.33786e-006],101.438,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[2.9375,7.04688,-6.67572e-006],272.201,1,0,[],"","",true,false], 
	[opfor_APC1_X,[6.64258,4.07422,0.00771236],350.886,1,0,[],"","",true,false], 
	["Land_BarrelSand_F",[0.650391,8.46484,1.90735e-006],359.997,1,0,[],"","",true,false], 
	["Land_CargoBox_V1_F",[-2.38477,-8.44141,0.0305395],23.6635,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[3.95703,-8.16406,0],108.549,1,0,[],"","",true,false], 
	["Land_Pallet_F",[-9.14648,1.24805,-2.38419e-007],360,1,0,[],"","",true,false], 
	["Land_WorkStand_F",[-9.90625,-1.57031,-4.76837e-007],126.171,1,0,[],"","",true,false], 
	["Land_BarrelSand_F",[9.72656,-2.98047,1.90735e-006],359.997,1,0,[],"","",true,false], 
	["Land_WaterBarrel_F",[-9.75391,3.03906,0],360,1,0,[],"","",true,false], 
	["Land_MetalBarrel_empty_F",[9.58984,-3.66797,-1.38283e-005],0,1,0,[],"","",true,false], 
	[opfor_COVERED_TRUCK_X,[-7.65234,6.66406,-0.014904],141.587,1,0,[],"","",true,false], 
	["Land_MetalBarrel_F",[-9.87891,4.29688,1.43051e-006],359.998,1,0.00466837,[],"","",true,false], 
	["Land_CncBarrier_F",[-2.26758,-10.5469,-4.76837e-007],14.8286,1,0,[],"","",true,false], 
	["Land_MetalBarrel_empty_F",[-10.5625,2.28906,-2.6226e-005],0,1,0,[],"","",true,false], 
	["Land_WaterTank_F",[-10.8359,-0.371094,1.88351e-005],106.685,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[2.01172,-10.8594,-2.86102e-006],133.02,1,0,[],"","",true,false], 
	["Land_MetalBarrel_F",[-10.9395,2.92383,1.43051e-006],0.00190544,1,0.00494642,[],"","",true,false], 
	["Land_CncWall4_F",[10.7461,2.11328,-7.62939e-006],86.0197,1,0,[],"","",true,false], 
	["Land_CncBarrier_F",[-6.88281,-9.43164,-9.53674e-007],11.7665,1,0,[],"","",true,false], 
	["Land_CncWall4_F",[10.2598,-4.82422,0],93.953,1,0,[],"","",true,false], 
	["Land_Cargo20_grey_F",[8.34961,-8.12891,0],95.525,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[10.0684,6.23438,-7.62939e-006],87.3103,1,0,[],"","",true,false], 
	["Land_WaterBarrel_F",[-10.9629,4.49609,0],4.60718e-005,1,0,[],"","",true,false], 
	["Land_MetalBarrel_F",[-11.9844,4.43555,-0.000998735],359.998,1,0,[],"","",true,false], 
	["Land_WaterBarrel_F",[-11.4824,5.73242,0.00359559],359.619,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[9.90625,8.22852,-1.81198e-005],81.7966,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[12.5566,-1.55664,1.43051e-006],87.5294,1,0,[],"","",true,false], 
	["Land_Cargo20_military_green_F",[-13.0156,0.841797,0],96.0996,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[10.1953,-8.42188,-1.81198e-005],100.028,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[-13.2656,-3.24414,-2.86102e-006],101.573,1,0,[],"","",true,false], 
	["Land_CncWall1_F",[9.83984,-9.36719,-6.19888e-006],94.1228,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[-12.8984,5.43164,-1.04904e-005],100.541,1,0,[],"","",true,false], 
	["Land_CncBarrier_F",[-12.0781,-7.99414,-1.43051e-006],16.1985,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[-13.3652,-6.50781,4.76837e-007],93.6246,1,0,[],"","",true,false], 
	["Land_CncBarrier_F",[-12.6621,8.46094,-2.86102e-006],90.7596,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium4_F",[-7.875,-13.0879,3.8147e-006],190.205,1,0,[],"","",true,false], 
	["Box_East_AmmoVeh_F",[0.230469,5.98633,-0.0843728],333.904,1,0.465098,[],"","",true,false], 
	["Box_East_AmmoVeh_F",[-14.7988,5.17188,0.0305417],15.017,1,0,[],"","",true,false],
	["Land_BagBunker_Small_F",[-18.6445,-13.9922,0],0,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[16.3555,17.1172,0],180,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[-18.6445,-13.9922,0],0,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[16.3555,16.0078,0],0,1,0,[],"","",true,false] 
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
_this = createVehicle ["O_supplyCrate_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_101 = _this;
_this setDir 64.2202;
_this setPosATL [(_centerSpawnX)-4.37305, (_centerSpawnY)-4.09375, 1.34656];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_102 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)-18.6445, (_centerSpawnY)-13.4375], [], 0, "CAN_COLLIDE"];
  _vehicle_102 = _this;
  _this setDir 226.073;
};
_vehicle_102 allowdamage false;
_vehicle_102 setdamage 0;
//_vehicle_102 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_103 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)+16.3555, (_centerSpawnY)+16.5625], [], 0, "CAN_COLLIDE"];
  _vehicle_103 = _this;
  _this setDir 52.1263;
};
_vehicle_103 allowdamage false;
_vehicle_103 setdamage 0;
//_vehicle_103 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 1;

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard1 moveinGunner _vehicle_102;
_guard2 moveinGunner _vehicle_103;

private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+8,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";

_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos _flagPos;

