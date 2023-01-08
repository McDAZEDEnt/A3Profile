
_centerSpawn = _this select 0;
_centerSpawnX = _centerSpawn select 0;
_centerSpawnY = _centerSpawn select 1;
//_flagPos = _this select 0;

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
	["LAND_uns_vccache1",[-2.30981,0.292725,0],179.595,1,0,[],"","",true,false],
	["uns_HiddenAmmoBox",[6.23315,4.49585,0.0169601],95.9469,1,0,[],"","",true,false], 
	["Land_Wood_Tower2",[-7.14966,-7.66626,0],0,1,0,[],"","",true,false], 
	["uns_HiddenAmmoBox_small3",[6.06128,9.35522,0],0,1,0,[],"","",true,false], 
	["uns_trap_box_VC",[6.948,9.10522,0],88.7546,1,0,[],"","",true,false], 
	["wx_sandbag03_mid",[11.3464,-3.03052,-0.00800037],124.582,1,0,[],"","",true,false], 
	["uns_resupply_crate_NVA",[6.95386,9.97241,-0.000999928],160.583,1,0,[],"","",true,false], 
	["wx_sandbag03_end",[10.6333,5.02651,0],261.99,1,0,[],"","",true,false], 
	["wx_sandbag03_mid",[11.5279,2.464648,-0.00800037],62.0284,1,0,[],"","",true,false], 
	["wx_sandbag05",[12.3596,-0.352051,-0.00800037],270.643,1,0,[],"","",true,false], 
	["wx_sandbag03_end",[11.3914,-5.78765,0],64.0805,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-2.61255,12.5659,0],79.1564,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-0.212158,-13.073,0],260.963,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[2.95239,12.8684,0],95.0968,1,0,[],"","",true,false], 
	["Land_wx_fielddefence_04",[-5.78345,-13.2019,0],276.903,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[0.128906,15.74414,0],179.299,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-2.22119,-16.30469,0],0.216879,1,0,[],"","",true,false], 
	["pook_Land_fort_rampart_MUD",[-17.927,-0.18311,0],89.5721,1,0,[],"","",true,false]
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
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-0.242676, (_centerSpawnY)+7.78906], [], 0, "CAN_COLLIDE"];
  _vehicle_31 = _this;
  _this setDir 89.5233;
};
_vehicle_31 allowdamage false;
_vehicle_31 setdamage 0;

_vehicle_32 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-3.24854, (_centerSpawnY)-6.36914], [], 0, "CAN_COLLIDE"];
  _vehicle_32 = _this;
  _this setDir 89.5233;
};
_vehicle_32 allowdamage false;
_vehicle_32 setdamage 0;

_vehicle_33 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-9.00684, (_centerSpawnY)+0.946777], [], 0, "CAN_COLLIDE"];
  _vehicle_33 = _this;
  _this setDir 179.493;
};
_vehicle_33 allowdamage false;
_vehicle_33 setdamage 0;

_vehicle_34 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter4", [(_centerSpawnX)-9.18652, (_centerSpawnY)-4.39673], [], 0, "CAN_COLLIDE"];
  _vehicle_34 = _this;
  _this setDir 180.509;
};
_vehicle_34 allowdamage false;
_vehicle_34 setdamage 0;

_vehicle_35 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter3", [(_centerSpawnX)+9.41431, (_centerSpawnY)-0.502686], [], 0, "CAN_COLLIDE"];
  _vehicle_35 = _this;
  _this setDir 0;
};
_vehicle_35 allowdamage false;
_vehicle_35 setdamage 0;

_vehicle_36 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter2", [(_centerSpawnX)+8.93213, (_centerSpawnY)+10.81714], [], 0, "CAN_COLLIDE"];
  _vehicle_36 = _this;
  _this setDir 88.4553;
};
_vehicle_36 allowdamage false;
_vehicle_36 setdamage 0;

_vehicle_37 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter2", [(_centerSpawnX)-10.1667, (_centerSpawnY)-7.43506], [], 0, "CAN_COLLIDE"];
  _vehicle_37 = _this;
  _this setDir 2.75598;
};
_vehicle_37 allowdamage false;
_vehicle_37 setdamage 0;

_vehicle_42 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter5", [(_centerSpawnX)+4.54956, (_centerSpawnY)+0.80151], [], 0, "CAN_COLLIDE"];
  _vehicle_42 = _this;
  _this setDir 182.888;
};
_vehicle_42 allowdamage false;
_vehicle_42 setdamage 0;

_vehicle_43 = objNull;
if (true) then
{
  _this = createVehicle ["LAND_uns_vcshelter5", [(_centerSpawnX)+4.25269, (_centerSpawnY)-4.57935], [], 0, "CAN_COLLIDE"];
  _vehicle_43 = _this;
  _this setDir 182.888;
};
_vehicle_43 allowdamage false;
_vehicle_43 setdamage 0;

_vehicle_27 = objNull;
_this = createVehicle ["uns_HiddenAmmoBox", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_27 = _this;
_this setDir 271.853;
_this setPosATL [(_centerSpawnX)+5.43237, (_centerSpawnY)-1.25415, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_28 = objNull;
_this = createVehicle ["uns_HiddenAmmoBox", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_28 = _this;
_this setDir 272.244;
_this setPosATL [(_centerSpawnX)+5.69214, (_centerSpawnY)+2.16187, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_29 = objNull;
_this = createVehicle ["uns_HiddenAmmoBox", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_29 = _this;
_this setDir 5.07251;
_this setPosATL [(_centerSpawnX)+5.49683, (_centerSpawnY)-3.45532, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_30 = objNull;
_this = createVehicle ["uns_AmmoBoxVC", [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle_30 = _this;
_this setDir 272.376;
_this setPosATL [(_centerSpawnX)-12.6594, (_centerSpawnY)-7.63696, 0];
[_this,"opfor"] spawn fnc_fill_ammobox; 
//[[_this,["<t color='#ff1111'>VA Arsenal</t>","misc\bisArsenal.sqf",[], 0, false, false, "", "_this distance _target < 4"]],"addAction",true,true] call BIS_fnc_MP;

_vehicle_38 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_NVA", [(_centerSpawnX)+6.96753, (_centerSpawnY)-10.0627], [], 0, "CAN_COLLIDE"];
  _vehicle_38 = _this;
  _this setDir 137.447;
};
_vehicle_38 allowdamage false;
_vehicle_38 setdamage 0;
//_vehicle_38 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_39 = objNull;
if (true) then
{
  _this = createVehicle ["uns_dshk_bunker_closed_NVA", [(_centerSpawnX)-11.3079, (_centerSpawnY)+9.11304], [], 0, "CAN_COLLIDE"];
  _vehicle_39 = _this;
  _this setDir 316.574;
};
_vehicle_39 allowdamage false;
_vehicle_39 setdamage 0;
//_vehicle_39 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_40 = objNull;
if (true) then
{
  _this = createVehicle ["uns_pk_high_NVA", [(_centerSpawnX)-7.14966, (_centerSpawnY)-8.66626,3], [], 0, "CAN_COLLIDE"];
  _vehicle_40 = _this;
  _this setDir 182.695;
};
_vehicle_40 allowdamage false;
_vehicle_40 setdamage 0;
//_vehicle_40 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_41 = objNull;
if (true) then
{
  _this = createVehicle ["uns_SPG9_73mm_NVA", [(_centerSpawnX)+11.8328, (_centerSpawnY)-0.418213], [], 0, "CAN_COLLIDE"];
  _vehicle_41 = _this;
  _this setDir 86.9872;
};
_vehicle_41 allowdamage false;
_vehicle_41 setdamage 0;
//_vehicle_41 addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

_vehicle_108 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sniper_tree2_t5_empty", [(_centerSpawnX)+100, (_centerSpawnY)+20], [], 0, "CAN_COLLIDE"];
  _vehicle_108 = _this;
  _this setDir 0;
};

_vehicle_109 = objNull;
if (true) then
{
  _this = createVehicle ["uns_sniper_tree2_t2_empty", [(_centerSpawnX)-100, (_centerSpawnY)-70], [], 0, "CAN_COLLIDE"];
  _vehicle_109 = _this;
  _this setDir 0;
};

sleep 5;
_groupBunker = [[0,0], EAST, [opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X,opfor_SOLDIER_X],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_groupBunker deleteGroupWhenEmpty true;
_guard1 = units _groupBunker select 0;
_guard2 = units _groupBunker select 1;
_guard3 = units _groupBunker select 2;
_guard4 = units _groupBunker select 3;
_guard1 moveinGunner _vehicle_38;
_guard2 moveinGunner _vehicle_39;
_guard3 moveinGunner _vehicle_40;
_guard4 moveinGunner _vehicle_41;

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
_towerGuard1 setPos [(getposATL _vehicle_109 select 0)-1.7,(getposATL _vehicle_109 select 1)-0.5,+12];
_towerGuard1 setUnitPos "DOWN";
_towerGuard1 setDir 180;
_groupTower1 setBehaviour "AWARE";
