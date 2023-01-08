
///////////////
///////////////   "Simc_UA_ETO_w", "US GEN EQUIP & ACC IFA US ARMY (Winter)","USGEA_US_ARMY_WINTER"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"Simc_US_Mantel_Legging_rifleman_w";	//patrol, fortify
blufor_SOLDIER_LAT_X =			"Simc_US_Mantel_AT_soldier_w";			//initHQ\guards.sqf
blufor_SOLDIER_GL_X =			"Simc_US_Panser_Grenadier_w";			//initHQ\guards.sqf 
blufor_SOLDIER_TL_X =			"Simc_US_Panser_smgunner_w";			//initHQ\createpatrol.sqf
blufor_SOLDIER_SL_X =			"Simc_US_Panser_First_Lieutenant_w";	//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"Simc_US_M43_Mgunner_w";				//initHQ\guards.sqf
blufor_MARKSMAN_X = 			"Simc_US_M43_Sniper_w";					//initHQ\guards.sqf
blufor_OFFICER_X =				"Simc_US_M43_Captain_w";				//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"LIB_US_Pilot_2";						//missions\missions\pilot\mission.sqf

blufor_BOAT_ARMED_X	=			"LIB_LCM3_Armed";						//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"Simc_US_Mantel_Legging_rifleman_w";	//support\taxi\boatTaxi.sqf

blufor_PLANE_SUPP_X =			"LIB_C47_RAF_bob";					//Support Paratroopers and Supply drop
blufor_PLANE_PATROL_X =			"LIB_US_P39";						//support\taxi\helotaxi.sqf, random patrol
blufor_PLANE_PATROL1_X =		"sab_p38";   						//support\uav_map.sqf, random patrol
blufor_PLANE_PATROL2_X =		"sab_p51b";   						//random patrol
blufor_PLANE_PATROL3_X =		"sab_b25";   						//random patrol
blufor_PLANE_PATROL4_X =		"sab_b17";   						//random patrol
blufor_PLANE_FIGHTER_X =		"sab_mustang";						//dialog\request_hcATTchop.sqf
blufor_PLANE_CAS_X =			"LIB_P47";							//dialog\request_hcCAS.sqf
blufor_CAR_PATROL1_X =			"LIB_M8_Greyhound";					//random patrol
blufor_APC_PATROL1_X =			"LIB_US_Scout_M3_FFV_w";			//random patrol
blufor_APC_PATROL2_X =			"LIB_US_M3_Halftrack_w";			//random patrol
blufor_TANK_PATROL_X =			"LIB_M3A3_Stuart";						//random patrol
blufor_TANK_PATROL1_X =			"LIB_M5A1_Stuart";					//random patrol Dang Edit
blufor_TANK_PATROL2_X =			"LIB_M4A3_75_w";					//random patrol Dang Edit
blufor_TANK_PATROL3_X =			"LIB_M4A3_75_w";					//random patrol Dang Edit
blufor_TANK_PATROL4_X =			"LIB_M4A3_76";						//random patrol Dang Edit
blufor_TANK_PATROL5_X =			"LIB_M4A3_76_HVSS";					//random patrol Dang Edit

///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"LIB_61K";
blufor_TURRET_AT =				"LIB_Zis3_w";
blufor_TURRET_HMG =				"B_G_HMG_02_high_F";
blufor_TURRET_GMG =				"LIB_Zis3_w";
blufor_TURRET_RAD =				"LIB_Static_zis6_radar";			//LT.Dang Edit Radar Vehicle at HQ and FOBS
blufor_TURRET_FLAG =			"LIB_FlagCarrier_USA";				//LT.Dang Flag at HQ and FOBS

/////////////////////////
// PARADROP SUPPORT TROOPS Dang Edit
/////////////////////////

blufor_PARA_X =				"Simc_US_M43_82AB_mgunner_assistant";			//support\paradrop.sqf		
blufor_PARA_AT_X =			"Simc_US_M43_82AB_AT_soldier";					//support\paradrop.sqf	
blufor_PARA_GL_X =			"Simc_US_M43_82AB_grenadier";					//support\paradrop.sqf	
blufor_PARA_TL_X =			"Simc_US_M43_82AB_NCO";							//support\paradrop.sqf	
blufor_PARA_RAD_X =			"Simc_US_M43_82AB_radioman";					//support\paradrop.sqf	
blufor_PARA_AR_X =			"Simc_US_M43_82AB_mgunner";						//support\paradrop.sqf	
blufor_PARA_MED_X =			"LIB_US_82AB_medic";							//support\paradrop.sqf

	
/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"Simc_US_M43_rifleman_w";				//operator
blufor_SPECOPS_GL_X =			"Simc_US_Mantel_Grenadier_w";			//operator
blufor_SPECOPS_LAT_X =			"Simc_US_M43_AT_soldier_w";				//operator
blufor_SPECOPS_HAT_X =			"Simc_US_Panser_AT_soldier_w";			//operator
blufor_SPECOPS_AA_X =			"Simc_US_Mantel_Radioman_w";			//operator
blufor_SPECOPS_MG_X =			"Simc_US_Panser_Mgunner_w";				//operator
blufor_SPECOPS_AR_X =			"Simc_US_Mantel_Mgunner_w";				//operator Dang Edit
blufor_SPECOPS_MEDIC_X =		"Simc_US_M43_Medic_w";					//operator
blufor_SPECOPS_MARK_X =			"Simc_US_M43_Sniper_w";					//operator
blufor_SPECOPS_SNIPER_X =		"Simc_US_Panser_Sniper_w";				//operator
blufor_SPECOPS_EXP_X =			"Simc_US_M43_Engineer_w";				//operator
blufor_SPECOPS_ENG_X = 			"Simc_US_Panser_Engineer_w";			//operator
blufor_SPECOPS_SL_X = 			"Simc_US_Panser_First_Lieutenant_w";	//operator Lt.Dang edit
blufor_SPECOPS_TL_X = 			"Simc_US_M43_Second_lieutenant_w";		//operator Lt.Dang edit
blufor_SPECOPS_ASS_X = 			"Simc_US_Mantel_Smgunner_w";			//operator Lt.Dang edit


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


blufor_RQST_UNIT_01_X = 			["Simc_US_Mantel_Legging_rifleman_w","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["Simc_US_Panser_Grenadier_w","Grenadier (3CP)",3];
blufor_RQST_UNIT_03_X =				["Simc_US_Mantel_Smgunner_w","SMG Soldier (2CP)",2];
blufor_RQST_UNIT_04_X =				["Simc_US_M43_Mgunner_w","Heavy Gunner (4CP)",4];
blufor_RQST_UNIT_05_X =				["Simc_US_M43_Medic_w","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["Simc_US_M43_Corporal_w","Corporal (2CP)",2];
blufor_RQST_UNIT_07_X =				["Simc_US_Panser_AT_soldier_w","AT Soldier (4CP)",4];
blufor_RQST_UNIT_08_X =				["Simc_US_Panser_Radioman_w","Radioman (2CP)",2];
blufor_RQST_UNIT_09_X =				["Simc_US_Panser_Engineer_w","Engineer (4CP)",4];
blufor_RQST_UNIT_10_X =				["Simc_US_M43_First_Lieutenant_w","1st Leiutenant (2CP)",2];
blufor_RQST_UNIT_11_X =				["Simc_US_M43_Sniper_w","Sniper (4CP)",4];
blufor_RQST_UNIT_12_X =				["empty",0,0];
blufor_RQST_UNIT_13_X =				["empty",0,0];
blufor_RQST_UNIT_14_X =				["empty",0,0];


///////////////////////////////
// dialog\request_vehicle.sqf
//   _index = lbCurSel 2102;
// dialog\request_vehicle_fob.sqf
//   _index = lbCurSel 2122;
////////////////////////////////   

blufor_RQST_VEHICLE_01_X =			["LIB_US_Willys_MB_w","Willys Jeep (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["LIB_US_Willys_MB_Hood_w","Covered Willys Jeep (1CP)",1];
blufor_RQST_VEHICLE_03_X =			["LIB_US_Willys_MB_M1919_w","Willys Jeep.30cal (4CP)",4];
blufor_RQST_VEHICLE_04_X =			["LIB_US_GMC_Tent_w","GMC Truck Closed (10CP)",10];
blufor_RQST_VEHICLE_05_X =			["LIB_US_GMC_Open_w","GMC Truck Open (10CP)",10];
blufor_RQST_VEHICLE_06_X =			["LIB_US_GMC_Ammo_w","GMC Ammo Truck (12CP)",12];
blufor_RQST_VEHICLE_07_X =			["LIB_US_GMC_Fuel_w","GMC Fuel Truck (12CP)",12];
blufor_RQST_VEHICLE_08_X =			["LIB_US_GMC_Ambulance_w","GMC Ambulance Truck (12CP)",12];
blufor_RQST_VEHICLE_09_X =			["LIB_US_GMC_Parm_w","GMC Repair Truck (15CP)",15];
blufor_RQST_VEHICLE_10_X =			["LIB_US_Scout_M3_FFV_w","M3 Scout Car (18CP)",18];
blufor_RQST_VEHICLE_11_X =			["LIB_US_M3_Halftrack_w","M3 Halftrack (20CP)",20];
blufor_RQST_VEHICLE_12_X =			["LIB_M8_Greyhound","M8 Greyhound (25CP)",25];
blufor_RQST_VEHICLE_13_X =			["LIB_M3A3_Stuart","M3A3 Stuart Tank (25CP)",25];
blufor_RQST_VEHICLE_14_X =			["LIB_M5A1_Stuart","M4A1 Stuart Tank (30CP)",30];
blufor_RQST_VEHICLE_15_X =			["LIB_M4A3_75_w","M4A3 75mm Sherman Tank (35CP)",35];
blufor_RQST_VEHICLE_16_X =			["LIB_M4A3_75_Tubes","M4A3 75 Sherman Wading Gear (35CP)",35];
blufor_RQST_VEHICLE_17_X =			["LIB_M4A3_76","M4A3-76mm Sherman Tank (40CP)",40];
blufor_RQST_VEHICLE_18_X =			["LIB_M4A3_76_HVSS","M4A3-76mmHV Sherman Tank (45CP)",45];
blufor_RQST_VEHICLE_19_X =			["LIB_C47_RAF_bob","C47 Transport (25CP)",25];
blufor_RQST_VEHICLE_20_X =			["LIB_US_P39","P39 Aerocobra (30CP)",30];
blufor_RQST_VEHICLE_21_X =			["sab_p51b","P51B Mustang (30CP)",30];
blufor_RQST_VEHICLE_22_X =			["sab_mustang","P51D Mustang (35CP)",35];
blufor_RQST_VEHICLE_23_X =			["sab_p38","P38 Lightning (35CP)",35];
blufor_RQST_VEHICLE_24_X =			["LIB_P47","P47 Thunderbolt (45CP)",45];
blufor_RQST_VEHICLE_25_X =			["sab_a26","A26 Invader (40CP)",40];
blufor_RQST_VEHICLE_26_X =			["sab_p61","P61 Black Widow (40CP)",40];
blufor_RQST_VEHICLE_27_X =			["sab_b25","B25 Mitchell (505CP)",50];
blufor_RQST_VEHICLE_28_X =			["sab_b24","B24 Liberator (60CP)",60];
blufor_RQST_VEHICLE_29_X =			["sab_b17","B17 Flying Fortress (70CP)",70];
blufor_RQST_VEHICLE_30_X =			["empty",0,0];
blufor_RQST_VEHICLE_31_X =			["empty",0,0];
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


