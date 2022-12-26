///save


persist1 = commanderX;publicVariable"persist1";

RCOP_VehicleCratesToSave = 
[
	"I_G_Offroad_01_F", 
	"I_G_Offroad_01_armed_F", 
	"I_E_Offroad_01_F", 
	"rhsgref_tla_g_offroad", 
	"rhsgref_tla_g_offroad_armed", 
	"B_G_Offroad_01_F", 
	"B_G_Offroad_01_armed_F", 
	"B_GEN_Offroad_01_gen_F"
];publicVariable"RCOP_VehicleCratesToSave";
RCOP_permittedMines = [""];publicVariable"RCOP_permittedMines";
RCOP_FOBObjects = [""];publicVariable"RCOP_FOBObjects";

[[true],"RCOP\RCOPersist\RCOPsaving.sqf"] remoteExec ["execVM",0];

[] spawn A3A_fnc_persistentSave;

"hcDown" call BIS_fnc_endMissionServer;

////load


persist1 = commanderX;publicVariable"persist1";

RCOP_VehicleCratesToSave = 
[
	"I_G_Offroad_01_F", 
	"I_G_Offroad_01_armed_F", 
	"I_E_Offroad_01_F", 
	"rhsgref_tla_g_offroad", 
	"rhsgref_tla_g_offroad_armed", 
	"B_G_Offroad_01_F", 
	"B_G_Offroad_01_armed_F", 
	"B_GEN_Offroad_01_gen_F"
];publicVariable"RCOP_VehicleCratesToSave";
RCOP_permittedMines = [""];publicVariable"RCOP_permittedMines";
RCOP_FOBObjects = [""];publicVariable"RCOP_FOBObjects";

[[0,1,0,0,0,1,false],"RCOP\RCOPersist\RCOPcrateFiller.sqf"] remoteExec ["execVM",0];
