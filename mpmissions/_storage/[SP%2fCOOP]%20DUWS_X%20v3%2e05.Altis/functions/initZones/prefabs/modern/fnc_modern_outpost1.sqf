
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
	["Land_CncBarrierMedium_F",[1.03125,2.57031,0],20.5707,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[-0.835938,3.07813,-0.0055871],12.2205,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[2.84766,2.1543,0],13.9168,1,0,[],"","",true,false], 
	["Land_CncBarrier_F",[-1.22852,6.93945,0],104.394,1,0,[],"","",true,false], 
	["Land_CncBarrier_F",[2.75977,6.77539,0.000242472],104.196,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium4_F",[7.27148,-2.48828,0],105.177,1,0,[],"","",true,false], 
	["Land_CncBarrierMedium_F",[-4.52148,-6.43164,0],22.3881,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[-6.75195,-5.34375,-0.000999928],204.372,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-0.07617,9.32617,0],11.9176,1,0,[],"","",true,false], 
	["Land_HBarrier_5_F",[-8.47461,2.7832,0],104.476,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[5.30078,-7.28516,-0.0544333],131.316,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[4.26367,7.98438,-0.0326011],194.907,1,0,[],"","",true,false], 
	["Land_BagFence_End_F",[-8.33398,-4.40234,-0.00100017],204.875,1,0,[],"","",true,false], 
	["Land_BagFence_Corner_F",[6.19922,7.42773,-0.0775306],10.7067,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[-6.07227,7.19727,-0.0128233],126.862,1,0,[],"","",true,false], 
	["Land_BagFence_Short_F",[0.976563,-9.44141,-0.00851679],9.04182,1,0,[],"","",true,false], 
	["Land_BagFence_Round_F",[-4.15234,9.49023,-0.0469728],158.399,1,0,[],"","",true,false], 
	["Land_BagBunker_Small_F",[-1.50977,-7.55273,0],22.0096,1,0,[],"","",true,false], 
	["CamoNet_INDP_open_F",[0.160156,-0.625,0],0.0555481,1,0,[],"","",true,false] 
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
_this = createVehicle ["Box_East_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_20 = _this;
_this setDir 8.49289;
_this setPosATL [(_centerSpawnX)-3.68555, (_centerSpawnY)-5.46484, 0];
// Put some crap in the ammobox
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_21 = objNull;
_this = createVehicle ["Box_East_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_21 = _this;
_this setDir 336.737;
_this setPosATL [(_centerSpawnX)+0.720703, (_centerSpawnY)+6.90625, 0];
// Put some crap in the ammobox
[_this,"opfor"] spawn fnc_fill_ammobox; 
//  [[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_23 = objNull;
_this = createVehicle ["Box_East_Ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_23 = _this;
_this setDir 280.64;
_this setPosATL [(_centerSpawnX)-0.808594, (_centerSpawnY)-8.14453, 0];
// Put some crap in the ammobox
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_24 = objNull;
_this = createVehicle ["Box_East_Grenades_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_25 = _this;
_this setDir 90.6023;
_this setPosATL [(_centerSpawnX)-0.142578, (_centerSpawnY)+7.28516, 0];
// Put some crap in the ammobox
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_26 = objNull;
_this = createVehicle ["Box_East_AmmoOrd_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_26 = _this;
_this setDir 43.2632;
_this setPosATL [(_centerSpawnX)+1.60742, (_centerSpawnY)+6.79297, 0];
// Put some crap in the ammobox
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>",fnc_duws_Arsenal,[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_28 = objNull;
if (true) then
{
  _this = createVehicle [opfor_TURRET_HMG, [(_centerSpawnX)-1.24805, (_centerSpawnY)-6.16992], [], 0, "CAN_COLLIDE"];
  _vehicle_28 = _this;
  _this setDir 192.514;
};
_vehicle_28 allowdamage false;
_vehicle_28 setdamage 0;
//_vehicle_28 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

sleep 1;
_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard1 moveinGunner _vehicle_28;

private "_flg";
missionNamespace setVariable [format["flag%1%2",round (_flagPos select 0),round (_flagPos select 1)], "FlagPole_F" createVehicle [(_flagPos select 0)+5,(_flagPos select 1)]];
call compile format["_flg = flag%1%2",round (_flagPos select 0),round (_flagPos select 1)]; 
_flg setFlagTexture "\A3\Data_F\Flags\flag_red_CO.paa";

_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos _flagPos;
