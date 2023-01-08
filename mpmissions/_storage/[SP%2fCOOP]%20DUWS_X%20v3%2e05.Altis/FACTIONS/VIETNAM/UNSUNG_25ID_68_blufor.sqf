
///////////////
///////////////   "UNSUNG_W_US", "US 25th Infantry Division 1968", "UNSUNG_25ID_68"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"uns_US_25ID_RF1";					//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"uns_US_25ID_AT";				//initHQ\guards.sqf, support\paradrop.sqf
blufor_SOLDIER_GL_X =			"uns_US_25ID_GL";				//initHQ\guards.sqf, support\paradrop.sqf
blufor_SOLDIER_TL_X =			"uns_US_25ID_SL";				//initHQ\createpatrol.sqf, initHQ\guards.sqf
blufor_SOLDIER_SL_X =			"uns_US_25ID_PL";				//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"uns_US_25ID_HMG";				//support\paradrop.sqf, initHQ\guards.sqf
blufor_MARKSMAN_X = 			"uns_US_25ID_MRK";				//initHQ\guards.sqf
blufor_OFFICER_X =				"uns_US_25ID_COM";				//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"uns_pilot7";					//missions\missions\pilot\mission.sqf

blufor_BOAT_ARMED_X	=			"uns_pbr_mk18";					//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"uns_bw2";						//support\taxi\boatTaxi.sqf

blufor_HELI_TRANS_ARM_X =		"uns_UH1H_m60";					//support\taxi\helotaxi.sqf, random patrol
blufor_HELI_TRANS_UNARM_X =		"uns_ch34_army_M60";   			//random patrol
blufor_HELI_ATTACK_X =			"UNS_AH1G_FFAR";				//dialog\request_hcATTchop.sqf
blufor_HELI_ATTACK1_X =			"uns_UH1C_M6_M200";				//dialog\request_hcATTchop.sqf Dang
blufor_HELI_ATTACK2_X =			"uns_UH1C_M21_M200_1AC";		//dialog\request_hcATTchop.sqf Dang
blufor_HELI_ATTACK3_X =			"uns_UH1C_M6_M200_M134";		//dialog\request_hcATTchop.sqf Dang
blufor_PLANE_CAS_X =			"uns_A7_CAS";					//dialog\request_hcCAS.sqf
blufor_PLANE_FIGHTER_X =		"uns_F4E_CHICO";				//dialog\request_hcCAS1.sqf Dang
blufor_PLANE_PATROL_X = 		"uns_A1J_CAS";					//random patrol Dang
blufor_PLANE_PATROL1_X = 		"UNS_F111_D_CAS";				//random patrol Dang
blufor_PLANE_PATROL2_X = 		"uns_f105D_CAS";				//random patrol Dang
blufor_PLANE_PATROL3_X = 		"uns_f100b_CAS";				//random patrol Dang
blufor_PLANE_CARGO_X = 			"uns_KC130_H";					//support\paradrop.sqf Dang
blufor_PLANE_RECON_X = 			"UNS_skymaster_CAS";			//support\uavmap.sqf Dang
blufor_CAR_PATROL1_X =			"uns_xm706e1";					//random patrol
blufor_APC_PATROL1_X =			"uns_m163";						//random patrol
blufor_APC_PATROL2_X =			"uns_M113A1_M60";				//random patrol
blufor_APC_PATROL3_X =			"uns_M113A1_M2";				//random patrol Dang
blufor_APC_PATROL4_X =			"uns_M113A1_M134";				//random patrol Dang
blufor_APC_PATROL5_X =			"uns_M113A1_XM182";				//random patrol Dang
blufor_APC_PATROL6_X =			"uns_M113A1_M40";				//random patrol Dang
blufor_TANK_PATROL1_X =			"uns_m48a3";					//random patrol
blufor_TANK_PATROL2_X =			"uns_m551";						//random patrol Dang
blufor_TANK_PATROL3_X =			"uns_m551";						//random patrol Dang
blufor_TANK_PATROL4_X =			"uns_M67A";						//random patrol Dang


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"uns_M55_Quad";
blufor_TURRET_AT =				"uns_M40_106mm_US";
blufor_TURRET_HMG =				"B_G_HMG_02_high_F";
blufor_TURRET_GMG =				"uns_US_MK18_low";
blufor_STATIC_CRASH =			"uns_uh1d_wreck";
blufor_STATIC_FLAG =			"uns_FlagCarrier25ID";
blufor_STATIC_RADIO =			"uns_radio2_radio";

/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"uns_US_25ID_RF1";			//operator
blufor_SPECOPS_GL_X =			"uns_US_25ID_GL";			//operator
blufor_SPECOPS_LAT_X =			"uns_US_25ID_AT";			//operator
blufor_SPECOPS_HAT_X =			"uns_US_25ID_AT";			//operator
blufor_SPECOPS_AA_X =			"uns_US_25ID_RTO";			//operator
blufor_SPECOPS_MG_X =			"uns_US_25ID_HMG";			//operator
blufor_SPECOPS_MEDIC_X =		"uns_US_25ID_MED";			//operator
blufor_SPECOPS_MARK_X =			"uns_US_25ID_MRK3";			//operator
blufor_SPECOPS_SNIPER_X =		"uns_US_25ID_MRK";			//operator
blufor_SPECOPS_EXP_X =			"uns_US_25ID_DEM";			//operator
blufor_SPECOPS_ENG_X = 			"uns_US_25ID_ENG";			//operator
blufor_SPECOPS_SL_X = 			"uns_US_25ID_SL";			//operator Dang
blufor_SPECOPS_PL_X = 			"uns_US_25ID_PL";			//operator Dang
blufor_SPECOPS_ASS_X = 			"uns_US_25ID_RF5";			//operator Dang


/////////////////////////////////////////////////////////////////
// REQUEST Units/Vehicles
//
// THESE HAVE FIXED AMOUNTS -fill the ends with ["empty",0,0];
//
// - Units = 				14
// - Vehicles/Statics = 	50
//
/////////////////////////////////////////////////////////////////

// request.sqf,request_fob.sqf defines labels/index for all request menu units/vehicles (not Operators)

// request_vehicle, request_vehicle_fob, request_unit, request_unit_fob 
// - these files contain the classnames referenced by the label/index


///////////////////////////////
// dialog\request_unit.sqf
//   _index = lbCurSel 2100;
// dialog\request_unit_fob.sqf
//   _index = lbCurSel 2120;
///////////////////////////////


blufor_RQST_UNIT_01_X = 			["uns_US_25ID_RF1","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["uns_US_25ID_GL","Grenadier (3CP)",3];
blufor_RQST_UNIT_03_X =				["uns_US_25ID_HMG","Machinegunner (3CP)",3];
blufor_RQST_UNIT_04_X =				["uns_US_25ID_RTO","Radio Operator (2CP)",4];
blufor_RQST_UNIT_05_X =				["uns_US_25ID_MED","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["uns_US_25ID_AT","AT Rifleman (3CP)",3];
blufor_RQST_UNIT_07_X =				["uns_US_25ID_SL","Squad Leader (2CP)",4];
blufor_RQST_UNIT_08_X =				["uns_US_25ID_DEM","Demolitions Expert (3CP)",4];
blufor_RQST_UNIT_09_X =				["uns_US_25ID_ENG","Engineer (4CP)",4];
blufor_RQST_UNIT_10_X =				["uns_US_25ID_MRK2","Marksman (3CP)",3];
blufor_RQST_UNIT_11_X =				["uns_US_25ID_MRK","Sniper (4CP)",4];
blufor_RQST_UNIT_12_X =				["empty",0,0];
blufor_RQST_UNIT_13_X =				["empty",0,0];
blufor_RQST_UNIT_14_X =				["empty",0,0];


///////////////////////////////
// dialog\request_vehicle.sqf
//   _index = lbCurSel 2102;
// dialog\request_vehicle_fob.sqf
//   _index = lbCurSel 2122;
////////////////////////////////   

blufor_RQST_VEHICLE_01_X =			["uns_willys_2","Willy's Jeep (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["uns_willysmg50","Willy's Jeep M2 (2CP)",2];
blufor_RQST_VEHICLE_03_X =			["uns_willysm40","Willy's Jeep M40 (4CP)",4];
blufor_RQST_VEHICLE_04_X =			["uns_m37b1","M-37B1 Dodge Truck (4CP)",4];
blufor_RQST_VEHICLE_05_X =			["uns_m37b1_m1919","M-37B1 Dodge Truck M1919 (5CP)",5];
blufor_RQST_VEHICLE_06_X =			["uns_M35A2","M35A2 Truck (5CP)",5];
blufor_RQST_VEHICLE_07_X =			["uns_M35A2_Open","M35A2 Truck Open(5CP)",5];
blufor_RQST_VEHICLE_08_X =			["uns_M35A2_ammo","M35A2 Ammo Truck (10CP)",10];
blufor_RQST_VEHICLE_09_X =			["uns_M35A2_fueltanker","M35A2 Fuel Truck (10CP)",10];
blufor_RQST_VEHICLE_10_X =			["uns_M35A2_repair","M35A2 Repair Truck (12CP)",12];
blufor_RQST_VEHICLE_11_X =			["uns_M577_amb","M113 Ambulance (8CP)",8];
blufor_RQST_VEHICLE_12_X =			["uns_xm706e2","XM-706-E2 Commando Armored Car (12CP)",12];
blufor_RQST_VEHICLE_13_X =			["uns_xm706e1","XM-706-E1 Commando Armored Car 30Cal (15CP)",15];
blufor_RQST_VEHICLE_14_X =			["uns_M113_30Cal","M113 APC Twin 30Cal (18CP)",18];
blufor_RQST_VEHICLE_15_X =			["uns_M113_M60","M113 APC M60 (18CP)",18];
blufor_RQST_VEHICLE_16_X =			["uns_M113_M2","M113 APC M2 (20CP)",20];
blufor_RQST_VEHICLE_17_X =			["uns_M113_M134","M113 APC Minigun (25CP)",25];
blufor_RQST_VEHICLE_18_X =			["uns_M113_XM182","M113 APC GMG (28CP)",28];
blufor_RQST_VEHICLE_19_X =			["uns_M113A1_M60","M113A1 APC M60 (25CP)",25];
blufor_RQST_VEHICLE_20_X =			["uns_M113A1_M2","M113A1 APC M2 (27CP)",27];
blufor_RQST_VEHICLE_21_X =			["uns_M113A1_M134","M113A1 APC Minigun (30CP)",30];
blufor_RQST_VEHICLE_22_X =			["uns_M113A1_XM182","M113A1 APC GMG (32CP)",32];
blufor_RQST_VEHICLE_23_X =			["uns_M113A1_M40","M113A1 APC M40 (35CP)",35];
blufor_RQST_VEHICLE_24_X =			["uns_M113_M30_HQ","M113 Mortar Carrier (45CP)",45];
blufor_RQST_VEHICLE_25_X =			["uns_m107sp","M-107 Self Propelled Gun (50CP)",50];
blufor_RQST_VEHICLE_26_X =			["uns_m110sp","M-110 Self Propelled Gun (55CP)",55];
blufor_RQST_VEHICLE_27_X =			["uns_m163","M-163 Vulcan ADS (35CP)",35];
blufor_RQST_VEHICLE_28_X =			["uns_m551","M-551 Sheridan Tank (40CP)",40];
blufor_RQST_VEHICLE_29_X =			["uns_m48a3","M-48 Patton Tank (50CP",50];
blufor_RQST_VEHICLE_30_X =			["uns_M67A","M-67A Patton Flamethrower Tank (55CP)",55];
blufor_RQST_VEHICLE_31_X =			["uns_oh6_transport","OH-6 Loach Unarmed (20CP)",20];
blufor_RQST_VEHICLE_32_X =			["uns_oh6_m27r","OH-6 Loach Armed (25CP)",25];
blufor_RQST_VEHICLE_33_X =			["uns_UH1D_m60","UH-1D Iroquois Slick (25CP)",25];
blufor_RQST_VEHICLE_34_X =			["uns_UH1H_m60","UH-1H Iroquois Slick (25CP)",25];
blufor_RQST_VEHICLE_35_X =			["uns_ch34_army_M60","CH-34 Chocktaw (28CP)",28];
blufor_RQST_VEHICLE_36_X =			["uns_ch47_m60_1AC","CH-47 Chinook (30CP)",30];
blufor_RQST_VEHICLE_37_X =			["uns_UH1C_M6_M200","UH-1C Huey Gunship M60(30CP)",30];
blufor_RQST_VEHICLE_38_X =			["uns_UH1C_M21_M200_1AC","UH-1C Huey Gunship M134 (35CP)",35];
blufor_RQST_VEHICLE_39_X =			["uns_UH1C_M6_M200_M134","UH-1C Huey Gunship M134 Gunners (35CP)",35];
blufor_RQST_VEHICLE_40_X =			["uns_ach47_m200","CH-47 Chinook Guns a GoGo (40CP)",40];
blufor_RQST_VEHICLE_41_X =			["UNS_AH1G_FFAR","AH-1G Cobra (45CP)",45];
blufor_RQST_VEHICLE_42_X =			["uns_A1J_CAS","A-1H Skyraider (30CP)",30];
blufor_RQST_VEHICLE_43_X =			["uns_f100b_CAS","F-100B Supersabre (35CP)",35];
blufor_RQST_VEHICLE_44_X =			["uns_f105D_CAS","F-105D Thunderchief (40CP)",40];
blufor_RQST_VEHICLE_45_X =			["UNS_F111_D_CAS","F-111D Aardvark (45CP)",45];
blufor_RQST_VEHICLE_46_X =			["uns_A7_CAS","A-7D Corsair II (50CP)",50];
blufor_RQST_VEHICLE_47_X =			["uns_F4E_CHICO","F-4E Phantom II (55CP)",55];
blufor_RQST_VEHICLE_48_X =			["empty",0,0];
blufor_RQST_VEHICLE_49_X =			["empty",0,0];
blufor_RQST_VEHICLE_50_X =			["empty",0,0];
blufor_RQST_VEHICLE_51_X =			["empty",0,0];



