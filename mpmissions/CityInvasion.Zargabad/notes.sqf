
//CO auto surrender - redco init box

[_this] call fnc_fleeSurrender;

////////////////////////////////////////// TRIGGERS

//CO capped trigger
//condition
call{redco in thisList;}
//activation
["coCapped", true, 2] call BIS_fnc_endMissionServer;

//CO killed trigger
//condition
alive redco == false
//activation
["coKilled", false, 2] call BIS_fnc_endMissionServer;

//SaveGame trigger
//condition - radio message echo
[] call fnc_autoSave;

//Unlimited vehicle ammo for init box
[_this] call fnc_infiniteVehAmmo;

//In sector expression
sleep 5;
[_this select 1, halObj] call fnc_sectorCapped;

//Boneyard qrf
//when activated
hint "boneyard waypoint fired";

missionNamespace setVariable ["BoneyardQRFired",true];publicVariable"BoneyardQRFired";

//city centre qrf
hint "city centre spawn fired";
missionNamespace setVariable ["CityCentreQRFired",true];publicVariable"CityCentreQRFired";

_unitpool = ["rhssaf_army_o_m10_para_ft_lead", 
"rhssaf_army_o_m10_para_mgun_m84", 
"rhssaf_army_o_m10_para_gl_ag36", 
"rhssaf_army_o_m10_para_sniper_m76", 
"rhssaf_army_o_m10_para_sq_lead"];
_spawn = getPosATL qrf_cc_spawn;
_order = getPosATL qrf_cc_order;

call {
_grp = [_spawn,east,_unitpool,0] call BIS_fnc_spawnGroup;
_wpt = _grp addWaypoint [_order,5];
_wpt setWaypointType "TASK ASSAULT";
};

//villa qrf
hint "villa spawn fired";
missionNamespace setVariable ["VillaQRFired",true];publicVariable"VillaQRFired";

_unitpool = ["rhssaf_army_o_m10_para_ft_lead", 
"rhssaf_army_o_m10_para_mgun_m84", 
"rhssaf_army_o_m10_para_gl_ag36", 
"rhssaf_army_o_m10_para_sniper_m76", 
"rhssaf_army_o_m10_para_sq_lead"];
_spawn = getPosATL qrf_vl_spawn;
_order = getPosATL qrf_vl_order;

call {
_grp = [_spawn,east,_unitpool,0] call BIS_fnc_spawnGroup;
_wpt = _grp addWaypoint [_order,5];
_wpt setWaypointType "TASK ASSAULT";
};


//Disable Tasking
(group _this) setVariable ["Unable",true];

//Hal spawn & reinforce arguments
{
	_x disableAI "AUTOCOMBAT";
	_x disableAI "RADIOPROTOCOL"; 

} forEach units _this;
Sleep 60;
{
	_x enableAI "AUTOCOMBAT";
	_x enableAI "RADIOPROTOCOL"; 

} forEach units _this;

//Placed unit init box
this setVariable ["Unable",true];
_leader = leader this;
_vehicle = vehicle _leader;
_driver = driver _vehicle;
this selectLeader _driver;

//Support vehicle init box
[_this] call fnc_infiniteVehAmmo;

//vehicle despawn trigger area
{{deleteVehicle _x} foreach crew _x} foreach thislist;

