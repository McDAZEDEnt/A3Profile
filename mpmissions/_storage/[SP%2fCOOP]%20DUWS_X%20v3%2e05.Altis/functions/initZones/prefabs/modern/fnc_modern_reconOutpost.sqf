
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
	["Land_BagFence_Corner_F",[-1.73047,-0.0703125,-0.57502],106.368,1,0,[],"","",true,false], 
	["Land_CratesWooden_F",[1.70508,1.4082,-4.76837e-007],278.793,1,0,[],"","",true,false], 
	["Land_HBarrier_1_F",[-0.341797,2.76641,2.38419e-006],90,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[-3.33203,0.008281,0.0166333],193.9,1,0,[],"","",true,false], 
	["Land_HBarrier_3_F",[-1.17773,-5.2832,-4.76837e-006],17.1555,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[5.23438,-0.236953,-3.33786e-006],287.894,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[-5.66406,0.551172,2.86102e-006],193.224,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[-3.73438,-4.40625,5.72205e-006],16.9139,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[1.25586,-6.00195,-6.67572e-006],19.507,1,0,[],"","",true,false], 
	["Land_BagFence_Round_F",[3.4043,-5.75977,1.90735e-006],311.699,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[2.033203,7.75586,-2.43187e-005],15.4057,1,0,[],"","",true,false], 
	["Land_HBarrier_3_F",[-5.69336,7.91797,1.04904e-005],323.127,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[5.41602,6.72461,-1.43051e-006],12.8758,1,0,[],"","",true,false], 
	["Land_BagFence_Round_F",[-7.52734,5.03516,2.86102e-005],106.267,1,0,[],"","",true,false], 
	["Land_BagFence_Corner_F",[7.11719,6.33203,4.76837e-007],11.736,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[-2.42773,9.07422,-1.43051e-006],20.2918,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[-9.9707,-8.88672,0],0,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[10.0293,12.2227,0],180,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[-9.9707,-8.88672,0],0,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[10.0293,11.1133,0],0,1,0,[],"","",true,false] 
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
_this = createVehicle ["Box_East_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_101 = _this;
_this setDir 1.18232;
_this setPosATL [(_centerSpawnX)-2.09297, (_centerSpawnY)+0.430859, 1];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_102 = objNull;
_this = createVehicle ["Box_East_Grenades_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_102 = _this;
_this setDir 108.023;
_this setPosATL [(_centerSpawnX)-3.14453, (_centerSpawnY)+0.878906, 1];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;


_vehicle_103 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Cargo_Patrol_V1_F", [(_centerSpawnX)-0.595703, (_centerSpawnY)-0.228516], [], 0, "CAN_COLLIDE"];
  _vehicle_103 = _this;
  _this setDir 16.6528;
};

_vehicle_104 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)-9.9707, (_centerSpawnY)-8.33203], [], 0, "CAN_COLLIDE"];
  _vehicle_104 = _this;
  _this setDir 226.618;
};
_vehicle_104 allowdamage false;
_vehicle_104 setdamage 0;
//_vehicle_104 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_105 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)+10.0313, (_centerSpawnY)+11.668], [], 0, "CAN_COLLIDE"];
  _vehicle_105 = _this;
  _this setDir 43.4524;
};
_vehicle_105 allowdamage false;
_vehicle_105 setdamage 0;
//_vehicle_105 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 1;

_groupTower = [[0,0], EAST, [opfor_MARK_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupTower deleteGroupWhenEmpty true;
_towerGuard = units _groupTower select 0;
_towerGuard setPos [getpos _vehicle_103 select 0,getpos _vehicle_103 select 1,4];
_towerGuard setUnitPos "UP";
_groupTower setBehaviour "SAFE";

_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard1 moveinGunner _vehicle_104;
_guard2 moveinGunner _vehicle_105;

private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+8,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";

_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos _flagPos;
