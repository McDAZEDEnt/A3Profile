
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
	["Land_Bunker_F",[0.638281,2.175391,0.0219965],13.849,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[-2.62695,1.30078,-1.90735e-006],191.129,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[3.13086,-0.117188,3.33786e-006],13.3297,1,0,[],"","",true,false], 
	["Land_BagFence_Round_F",[-4.34375,-1.67383,8.58307e-006],12.3193,1,0,[],"","",true,false], 
	["Land_BagFence_Round_F",[2.22656,-4.38477,-4.76837e-006],12.3193,1,0,[],"","",true,false], 
	["Land_LampHarbour_F",[-3.4668,1.95898,-3.33786e-006],194.396,1,0,[],"","",true,false], 
	["Land_LampHarbour_F",[4.01953,0.0664063,0],194.396,1,0,[],"","",true,false], 
	["Land_HBarrier_3_F",[1.14648,6.8125,1.90735e-006],14.2632,1,0,[],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[6.84375,-1.23242,-2.86102e-006],106.182,1,0,[],"","",true,false], 
	["Land_CargoBox_V1_F",[-0.265625,7.58984,0.0130765],0.565644,1,0,[],"","",true,false], 
	["Land_HBarrier_1_F",[4.51367,6.26563,-1.90735e-006],12.5262,1,0,[],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[-6.67773,2.60938,4.29153e-006],286.122,1,0,[],"","",true,false], 
	["Land_BagFence_End_F",[-6.11914,5.53711,-1.90735e-006],283.482,1,0,[],"","",true,false], 
	["Land_BagFence_Corner_F",[8.10156,2.26172,6.67572e-006],101.859,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[0.158203,10.1191,-2.38419e-006],11.1645,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[5.3125,8.74805,-1.52588e-005],18.73,1,0,[],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[-4.95508,8.42383,0],286.122,1,0,[],"","",true,false], 
	["Land_Mil_WallBig_4m_F",[8.78125,5.10938,1.43051e-006],108.103,1,0,[],"","",true,false], 
	["Land_BagFence_Corner_F",[9.08203,6.9668,-4.76837e-006],15.327,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[-8.95313,-6.48242,0],0,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[11.0469,13.5176,0],0,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[-8.95313,-6.48242,0],0,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[11.0469,14.627,0],180,1,0,[],"","",true,false]
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
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)-8.95313, (_centerSpawnY)-5.92773], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 226.635;
};
_vehicle_31 allowdamage false;
_vehicle_31 setdamage 0;
//_vehicle_31 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)+11.0469, (_centerSpawnY)+14.0723], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 43.4542;
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



