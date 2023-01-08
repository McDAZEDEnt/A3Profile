
///////////////
///////////////   "LIB_DAK", "IFA AFRIKA KORPS", "IFA_AFRIKA_KORPS"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"LIB_DAK_soldier";					//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"LIB_DAK_AT_soldier";				//initHQ\guards.sqf, support\paradrop.sqf
blufor_SOLDIER_GL_X =			"LIB_DAK_AT_grenadier";				//initHQ\guards.sqf, support\paradrop.sqf
blufor_SOLDIER_TL_X =			"LIB_DAK_soldier_2";				//initHQ\createpatrol.sqf, initHQ\guards.sqf
blufor_SOLDIER_SL_X =			"LIB_DAK_NCO_2";					//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"LIB_DAK_soldier_4";				//support\paradrop.sqf, initHQ\guards.sqf
blufor_MARKSMAN_X = 			"LIB_DAK_sniper";					//initHQ\guards.sqf
blufor_OFFICER_X =				"LIB_DAK_lieutenant";				//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"LIB_GER_Pilot";					//missions\missions\pilot\mission.sqf


blufor_BOAT_ARMED_X	=			"sab_boat_s38_o";							//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"LIB_DAK_Sentry_2";					//support\taxi\boatTaxi.sqf

blufor_PLANE_SUPP_X =			"sab_w34";							//Support Paratroopers and Supply drop
blufor_PLANE_PATROL_X =			"sab_fiatg55";						//support\taxi\helotaxi.sqf, random patrol
blufor_PLANE_PATROL1_X =		"LIB_DAK_FW190F8_Desert3";   		//support\uav_map.sqf, random patrol
blufor_PLANE_PATROL2_X =		"sab_fiatg55";   					//random patrol
blufor_PLANE_PATROL3_X =		"LIB_DAK_FW190F8_Desert2";   		//random patrol
blufor_PLANE_PATROL4_X =		"LIB_DAK_Ju87";   					//random patrol
blufor_PLANE_FIGHTER_X =		"LIB_DAK_FW190F8";					//dialog\request_hcATTchop.sqf, random patrol
blufor_PLANE_CAS_X =			"LIB_Ju87_Italy";					//dialog\request_hcCAS.sqf, random patrol
blufor_CAR_PATROL1_X =			"LIB_DAK_Kfz1_MG42";				//random patrol
blufor_APC_PATROL1_X =			"LIB_DAK_SdKfz251";					//random patrol
blufor_APC_PATROL2_X =			"LIB_DAK_SdKfz251_FFV";				//random patrol
blufor_TANK_PATROL_X =			"LIB_DAK_FlakPanzerIV_Wirbelwind";	//random patrol
blufor_TANK_PATROL1_X =			"LIB_StuG_III_G";					//random patrol Dang Edit
blufor_TANK_PATROL2_X =			"LIB_DAK_PzKpfwIV_H";				//random patrol Dang Edit
blufor_TANK_PATROL3_X =			"LIB_DAK_PzKpfwIV_H";				//random patrol Dang Edit
blufor_TANK_PATROL4_X =			"LIB_DAK_PzKpfwIV_H";				//random patrol Dang Edit
blufor_TANK_PATROL5_X =			"LIB_DAK_PzKpfwVI_E";				//random patrol Dang Edit

///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"LIB_Flak_38";
blufor_TURRET_AT =				"LIB_DAK_FlaK_36";
blufor_TURRET_HMG =				"LIB_MG42_Lafette_Deployed";
blufor_TURRET_GMG =				"LIB_DAK_Pak40";
blufor_TURRET_RAD =				"LIB_Static_opelblitz_radio";				//LT.Dang Edit Radar Vehicle at HQ and FOBS
blufor_TURRET_FLAG =			"LIB_FlagCarrier_GER";						//LT.Dang Flag at HQ and FOBS

/////////////////////////
// PARADROP SUPPORT TROOPS 
/////////////////////////

blufor_PARA_X =				"LIB_FSJ_soldier_dak";						//support\paradrop.sqf		
blufor_PARA_AT_X =			"LIB_FSJ_AT_soldier_dak";					//support\paradrop.sqf	
blufor_PARA_GL_X =			"LIB_FSJ_AT_grenadier_dak";					//support\paradrop.sqf	
blufor_PARA_TL_X =			"LIB_FSJ_NCO_dak";							//support\paradrop.sqf	
blufor_PARA_RAD_X =			"LIB_FSJ_radioman_dak";						//support\paradrop.sqf	
blufor_PARA_AR_X =			"LIB_FSJ_Mgunner_dak";						//support\paradrop.sqf	
blufor_PARA_MED_X =			"LIB_FSJ_medic_dak";						//support\paradrop.sqf


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"LIB_DAK_soldier";				//operator
blufor_SPECOPS_GL_X =			"LIB_DAK_AT_grenadier";			//operator
blufor_SPECOPS_LAT_X =			"LIB_DAK_AT_soldier";			//operator
blufor_SPECOPS_HAT_X =			"LIB_DAK_AT_soldier";			//operator
blufor_SPECOPS_AA_X =			"LIB_DAK_radioman";				//operator
blufor_SPECOPS_MG_X =			"LIB_DAK_soldier_4";			//operator
blufor_SPECOPS_AR_X =			"LIB_DAK_soldier_3";			//operator Dang Edit
blufor_SPECOPS_MEDIC_X =		"LIB_DAK_medic";				//operator
blufor_SPECOPS_MARK_X =			"LIB_DAK_sniper";				//operator
blufor_SPECOPS_SNIPER_X =		"LIB_DAK_sniper";				//operator
blufor_SPECOPS_EXP_X =			"LIB_DAK_sapper";				//operator
blufor_SPECOPS_ENG_X = 			"LIB_DAK_sapper_gefr";			//operator
blufor_SPECOPS_SL_X = 			"LIB_DAK_lieutenant";			//operator Lt.Dang edit
blufor_SPECOPS_TL_X = 			"LIB_DAK_NCO";					//operator Lt.Dang edit
blufor_SPECOPS_ASS_X = 			"LIB_DAK_soldier2";				//operator Lt.Dang edit


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


blufor_RQST_UNIT_01_X = 			["LIB_DAK_soldier","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["LIB_DAK_AT_grenadier","Grenadier  (3CP)",3];
blufor_RQST_UNIT_03_X =				["LIB_DAK_soldier_3","MG34 gunner (3CP)",3];
blufor_RQST_UNIT_04_X =				["LIB_DAK_soldier_4","MG42 gunner (4CP)",4];
blufor_RQST_UNIT_05_X =				["LIB_DAK_medic","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["LIB_DAK_AT_soldier","AT Soldier (4CP)",4];
blufor_RQST_UNIT_07_X =				["LIB_DAK_radioman","Radioman (2CP)",2];
blufor_RQST_UNIT_08_X =				["LIB_DAK_sapper","Engineer (4CP)",4];
blufor_RQST_UNIT_09_X =				["LIB_DAK_sniper","Sniper (3CP)",3];
blufor_RQST_UNIT_10_X =				["empty",0,0];
blufor_RQST_UNIT_11_X =				["empty",0,0];
blufor_RQST_UNIT_12_X =				["empty",0,0];
blufor_RQST_UNIT_13_X =				["empty",0,0];
blufor_RQST_UNIT_14_X =				["empty",0,0];

///////////////////////////////
// dialog\request_vehicle.sqf
//   _index = lbCurSel 2102;
// dialog\request_vehicle_fob.sqf
//   _index = lbCurSel 2122;
////////////////////////////////

blufor_RQST_VEHICLE_01_X =			["LIB_DAK_Kfz1","Kubelwagen (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["LIB_DAK_Kfz1_Hood","Kubelwagen Covered (1CP)",1];
blufor_RQST_VEHICLE_03_X =			["LIB_DAK_Kfz1_MG42","Kubelwagen MG42 (4CP)",4];
blufor_RQST_VEHICLE_04_X =			["LIB_DAK_OpelBlitz_Open","Opel Truck Open (10CP)",10];
blufor_RQST_VEHICLE_05_X =			["LIB_DAK_OpelBlitz_Tent","Opel Truck Covered(10CP)",10];
blufor_RQST_VEHICLE_06_X =			["LIB_DAK_SdKfz_7","SdKfz 7 Mittlerer Zugkraftwagen (12CP)",12];
blufor_RQST_VEHICLE_07_X =			["LIB_DAK_OpelBlitz_Ammo","Opel Ammo Truck (12CP)",12];
blufor_RQST_VEHICLE_08_X =			["LIB_DAK_OpelBlitz_Fuel","Opel Fuel Truck (12CP)",12];
blufor_RQST_VEHICLE_09_X =			["LIB_DAK_OpelBlitz_Ambulance","Opel Ambulance Truck (12CP)",12];
blufor_RQST_VEHICLE_10_X =			["LIB_DAK_OpelBlitz_Parm","7T Opel Repair Truck (15CP)",15];
blufor_RQST_VEHICLE_11_X =			["LIB_DAK_SdKfz251","SdKfz 251 1xMG42 (18CP)",18];
blufor_RQST_VEHICLE_12_X =			["LIB_DAK_SdKfz251_FFV","SdKfz 251 2xMG42(20CP)",20];
blufor_RQST_VEHICLE_13_X =			["LIB_DAK_SdKfz_7_AA","SdKfz 7 Mittlerer Zugkraftwagen AA (25CP)",25];
blufor_RQST_VEHICLE_14_X =			["LIB_DAK_FlakPanzerIV_Wirbelwind","FlakPanzerIV Wirbelwind (30CP)",30];
blufor_RQST_VEHICLE_15_X =			["LIB_SdKfz124","SdKfz124 Wespe (30CP)",30];
blufor_RQST_VEHICLE_16_X =			["LIB_StuG_III_G","Sturmgeschutz III (35CP)",35];
blufor_RQST_VEHICLE_17_X =			["LIB_DAK_PzKpfwIV_H","Panzerkampfwagen IV (45CP)",45];
blufor_RQST_VEHICLE_18_X =			["LIB_DAK_PzKpfwVI_E","PzKpfwVI E Tiger (60CP)",60];
blufor_RQST_VEHICLE_19_X =			["sab_bf109","Messerschmitt BF109 (30CP)",30];
blufor_RQST_VEHICLE_20_X =			["sab_bf110","Messerschmitt Bf 110 (35CP)",35];
blufor_RQST_VEHICLE_21_X =			["sab_ta152c","Focke-Wulf Ta 152 (35CP)",35];
blufor_RQST_VEHICLE_22_X =			["sab_do335","Dornier Do 335 (35CP)",40];
blufor_RQST_VEHICLE_23_X =			["sab_me262","Messerschmitt Me 262 (40CP)",40];
blufor_RQST_VEHICLE_24_X =			["sab_hix","Horten Ho 229 (40CP)",40];
blufor_RQST_VEHICLE_25_X =			["LIB_DAK_FW190F8","Focke-Wulf FW190 F8 (40CP)",40];
blufor_RQST_VEHICLE_26_X =			["LIB_DAK_Ju87","Ju87 Stuka (45CP)",45];
blufor_RQST_VEHICLE_27_X =			["sab_ju88","Junkers Ju 88 (50CP)",50];
blufor_RQST_VEHICLE_28_X =			["sab_he111","Heinkel He 111 (60CP)",60];
blufor_RQST_VEHICLE_29_X =			["empty",0,0];
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


