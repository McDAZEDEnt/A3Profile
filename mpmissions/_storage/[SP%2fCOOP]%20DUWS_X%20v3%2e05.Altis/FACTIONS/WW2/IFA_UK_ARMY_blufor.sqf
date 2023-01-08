
///////////////
///////////////   "LIB_UK_ARMY", "IFA UK ARMY (Europe)","IFA_UK_ARMY"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"LIB_UK_Rifleman";					//patrol, fortify
blufor_SOLDIER_LAT_X =			"LIB_UK_AT_Soldier";				//initHQ\guards.sqf
blufor_SOLDIER_GL_X =			"LIB_UK_Grenadier_Jerkins";			//initHQ\guards.sqf 
blufor_SOLDIER_TL_X =			"LIB_UK_Corporal_Jerkins";			//initHQ\createpatrol.sqf
blufor_SOLDIER_SL_X =			"LIB_UK_Sergeant_Jerkins";			//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"LIB_UK_LanceCorporal";				//initHQ\guards.sqf
blufor_MARKSMAN_X = 			"LIB_UK_Sniper";					//initHQ\guards.sqf
blufor_OFFICER_X =				"LIB_UK_Officer";					//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"LIB_US_Pilot_2";					//missions\missions\pilot\mission.sqf

blufor_BOAT_ARMED_X	=			"LIB_UK_LCA";						//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"LIB_UK_Rifleman_Jerkins";			//support\taxi\boatTaxi.sqf

blufor_PLANE_SUPP_X =			"LIB_C47_RAF";						//Support Paratroopers and Supply drop
blufor_PLANE_PATROL_X =			"sab_meteor";						//support\taxi\helotaxi.sqf, random patrol
blufor_PLANE_PATROL1_X =		"LIB_RAF_P39";   					//support\uav_map.sqf, random patrol
blufor_PLANE_PATROL2_X =		"sab_mb5";   						//random patrol
blufor_PLANE_PATROL3_X =		"sab_b25";   						//random patrol
blufor_PLANE_PATROL4_X =		"sab_b17";   						//random patrol
blufor_PLANE_FIGHTER_X =		"sab_mb5";							//dialog\request_hcATTchop.sqf
blufor_PLANE_CAS_X =			"LIB_P47";							//dialog\request_hcCAS.sqf
blufor_CAR_PATROL1_X =			"LIB_UK_Willys_MB_M1919";			//random patrol
blufor_APC_PATROL1_X =			"LIB_UniversalCarrier";				//random patrol
blufor_APC_PATROL2_X =			"LIB_UK_M3_Halftrack";				//random patrol
blufor_TANK_PATROL_X =			"LIB_Cromwell_MK4";					//random patrol
blufor_TANK_PATROL1_X =			"LIB_Cromwell_MK4";					//random patrol Dang Edit
blufor_TANK_PATROL2_X =			"LIB_M4A4_FIREFLY";					//random patrol Dang Edit
blufor_TANK_PATROL3_X =			"LIB_Churchill_Mk7_Howitzer";		//random patrol Dang Edit
blufor_TANK_PATROL4_X =			"LIB_Churchill_Mk7";				//random patrol Dang Edit
blufor_TANK_PATROL5_X =			"LIB_Churchill_Mk7_Crocodile";		//random patrol Dang Edit


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"LIB_61K";
blufor_TURRET_AT =				"LIB_Zis3";
blufor_TURRET_HMG =				"B_G_HMG_02_high_F";
blufor_TURRET_GMG =				"LIB_Zis3";
blufor_TURRET_RAD =				"LIB_Static_zis6_radar";			//LT.Dang Edit Radar Vehicle at HQ and FOBS
blufor_TURRET_FLAG =			"LIB_FlagCarrier_UK";				//LT.Dang Flag at HQ and FOBS

/////////////////////////
// PARADROP SUPPORT TROOPS Dang Edit
/////////////////////////

blufor_PARA_X =				"LIB_UK_Para_Sniper";					//support\paradrop.sqf		
blufor_PARA_AT_X =			"LIB_UK_Para_AT_Soldier";				//support\paradrop.sqf	
blufor_PARA_GL_X =			"LIB_UK_Para_Grenadier";				//support\paradrop.sqf	
blufor_PARA_TL_X =			"LIB_UK_Para_Sergeant";					//support\paradrop.sqf	
blufor_PARA_RAD_X =			"LIB_UK_Para_Radioman";					//support\paradrop.sqf	
blufor_PARA_AR_X =			"LIB_UK_Para_LanceCorporal";			//support\paradrop.sqf	
blufor_PARA_MED_X =			"LIB_UK_Para_Medic";					//support\paradrop.sqf


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"LIB_UK_Para_Rifleman";				//operator
blufor_SPECOPS_GL_X =			"LIB_UK_Para_Grenadier";			//operator
blufor_SPECOPS_LAT_X =			"LIB_UK_Para_AT_Soldier";			//operator
blufor_SPECOPS_HAT_X =			"LIB_UK_Para_AT_Soldier";			//operator
blufor_SPECOPS_AA_X =			"LIB_UK_Para_Radioman";				//operator
blufor_SPECOPS_MG_X =			"LIB_UK_Para_LanceCorporal";		//operator
blufor_SPECOPS_AR_X =			"LIB_UK_Para_LanceCorporal";		//operator Dang Edit
blufor_SPECOPS_MEDIC_X =		"LIB_UK_Para_Medic";				//operator
blufor_SPECOPS_MARK_X =			"LIB_UK_Para_Sniper";				//operator
blufor_SPECOPS_SNIPER_X =		"LIB_UK_Para_Sniper";				//operator
blufor_SPECOPS_EXP_X =			"LIB_UK_Para_Engineer";				//operator
blufor_SPECOPS_ENG_X = 			"LIB_UK_Para_Engineer";				//operator
blufor_SPECOPS_SL_X = 			"LIB_UK_Officer";					//operator Lt.Dang edit
blufor_SPECOPS_TL_X = 			"LIB_UK_Corporal";				//operator Lt.Dang edit
blufor_SPECOPS_ASS_X = 			"LIB_UK_Sergeant";				//operator Lt.Dang edit


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


blufor_RQST_UNIT_01_X = 			["LIB_UK_Rifleman","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["LIB_UK_Grenadier_Jerkins","Grenadier (3CP)",3];
blufor_RQST_UNIT_03_X =				["LIB_UK_Corporal_Jerkins","Corporal (2CP)",2];
blufor_RQST_UNIT_04_X =				["LIB_UK_LanceCorporal","Bren Gunner (4CP)",4];
blufor_RQST_UNIT_05_X =				["LIB_UK_Medic","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["LIB_UK_AT_Soldier","AT Rifleman (3CP)",3];
blufor_RQST_UNIT_07_X =				["LIB_UK_Officer","Officer (2CP)",2];
blufor_RQST_UNIT_08_X =				["LIB_UK_Radioman","Radioman (2CP)",2];
blufor_RQST_UNIT_09_X =				["LIB_UK_Engineer","Engineer (4CP)",4];
blufor_RQST_UNIT_10_X =				["LIB_UK_Sergeant_Jerkins","Sergeant (3CP)",3];
blufor_RQST_UNIT_11_X =				["LIB_UK_Sniper","Sniper (4CP)",4];
blufor_RQST_UNIT_12_X =				["empty",0,0];
blufor_RQST_UNIT_13_X =				["empty",0,0];
blufor_RQST_UNIT_14_X =				["empty",0,0];


///////////////////////////////
// dialog\request_vehicle.sqf
//   _index = lbCurSel 2102;
// dialog\request_vehicle_fob.sqf
//   _index = lbCurSel 2122;
////////////////////////////////   

blufor_RQST_VEHICLE_01_X =			["LIB_US_Willys_MB","Willys Jeep (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["LIB_US_Willys_MB_Hood","Covered Willys Jeep (1CP)",1];
blufor_RQST_VEHICLE_03_X =			["LIB_US_Willys_MB_M1919","Willys Jeep.30cal (4CP)",4];
blufor_RQST_VEHICLE_04_X =			["LIB_US_GMC_Tent","GMC Truck Closed (10CP)",10];
blufor_RQST_VEHICLE_05_X =			["LIB_US_GMC_Open","GMC Truck Open (10CP)",10];
blufor_RQST_VEHICLE_06_X =			["LIB_US_GMC_Ammo","GMC Ammo Truck (12CP)",12];
blufor_RQST_VEHICLE_07_X =			["LIB_US_GMC_Fuel","GMC Fuel Truck (12CP)",12];
blufor_RQST_VEHICLE_08_X =			["LIB_US_GMC_Ambulance","GMC Ambulance Truck (12CP)",12];
blufor_RQST_VEHICLE_09_X =			["LIB_US_GMC_Parm","GMC Repair Truck (15CP)",15];
blufor_RQST_VEHICLE_10_X =			["LIB_Scout_M3_FFV","M3 Scout Car (18CP)",18];
blufor_RQST_VEHICLE_11_X =			["LIB_UK_M3_Halftrack","M3 Halftrack (20CP)",20];
blufor_RQST_VEHICLE_12_X =			["LIB_UniversalCarrier","UniversalCarrier (10CP)",10];
blufor_RQST_VEHICLE_13_X =			["LIB_M3A3_Stuart","M3A3 Stuart Tank (25CP)",25];
blufor_RQST_VEHICLE_14_X =			["LIB_M5A1_Stuart","M4A1 Stuart Tank (30CP)",30];
blufor_RQST_VEHICLE_15_X =			["LIB_Cromwell_MK4","Mk4 Cromwell Tank (35CP)",35];
blufor_RQST_VEHICLE_16_X =			["LIB_Churchill_Mk7_AVRE","Mk7 Churchill AVRE Tank (35CP)",35];
blufor_RQST_VEHICLE_17_X =			["LIB_Churchill_Mk7_Howitzer","Mk7 Churchill AVRE Tank (35CP)",35];
blufor_RQST_VEHICLE_18_X =			["LIB_Churchill_Mk7","Mk7 Churchill Tank (40CP)",40];
blufor_RQST_VEHICLE_19_X =			["LIB_Churchill_Mk7_Crocodile","Mk7 Churchill Crocodile Tank (45CP)",45];
blufor_RQST_VEHICLE_20_X =			["LIB_M4A4_FIREFLY","M4A4 FIREFLY Tank (45CP)",45];
blufor_RQST_VEHICLE_21_X =			["LIB_C47_RAF","C47 Transport (25CP)",25];
blufor_RQST_VEHICLE_22_X =			["LIB_RAAF_P39","P39 Aerocobra (30CP)",30];
blufor_RQST_VEHICLE_23_X =			["sab_ca_12bo","CAC Boomerang (30CP)",30];
blufor_RQST_VEHICLE_24_X =			["sab_mb5","MB5 Martin Baker (35CP)",35];
blufor_RQST_VEHICLE_25_X =			["sab_meteor","F8 Gloster Meteor (40CP)",40];
blufor_RQST_VEHICLE_26_X =			["LIB_P47","P47 Thunderbolt (45CP)",45];
blufor_RQST_VEHICLE_27_X =			["sab_a26","A26 Invader (40CP)",40];
blufor_RQST_VEHICLE_28_X =			["sab_p61","P61 Black Widow (40CP)",40];
blufor_RQST_VEHICLE_29_X =			["sab_b25","B25 Mitchell (505CP)",50];
blufor_RQST_VEHICLE_30_X =			["sab_b24","B24 Liberator (60CP)",60];
blufor_RQST_VEHICLE_31_X =			["sab_b17","B17 Flying Fortress (70CP)",70];
blufor_RQST_VEHICLE_32_X =			["empty",0,0];
blufor_RQST_VEHICLE_33_X =			["empty",0,0];
blufor_RQST_VEHICLE_34_X =			["empty",0,0];
blufor_RQST_VEHICLE_35_X =			["empty",0,0];
blufor_RQST_VEHICLE_36_X =			["empty",0,0];
blufor_RQST_VEHICLE_37_X =			["empty",0,0];
blufor_RQST_VEHICLE_38_X =			["empty",0,0];
blufor_RQST_VEHICLE_39_X =			["empty",0,0];
blufor_RQST_VEHICLE_40_X =			["empty",0,0];
blufor_RQST_VEHICLE_41_X =			["empty",0,0];
blufor_RQST_VEHICLE_42_X =			["empty",0,0];
blufor_RQST_VEHICLE_43_X =			["empty",0,0];
blufor_RQST_VEHICLE_44_X =			["empty",0,0];
blufor_RQST_VEHICLE_45_X =			["empty",0,0];
blufor_RQST_VEHICLE_46_X =			["empty",0,0];
blufor_RQST_VEHICLE_47_X =			["empty",0,0];
blufor_RQST_VEHICLE_48_X =			["empty",0,0];
blufor_RQST_VEHICLE_49_X =			["empty",0,0];
blufor_RQST_VEHICLE_50_X =			["empty",0,0];



