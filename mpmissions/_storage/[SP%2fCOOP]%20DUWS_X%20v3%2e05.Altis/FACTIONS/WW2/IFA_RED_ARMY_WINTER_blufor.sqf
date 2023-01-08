
///////////////
///////////////   "LIB_RKKA_w", "IFA RED ARMY (Winter)","IFA_RED_ARMY_WINTER"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"LIB_SOV_rifleman_w";				//patrol, fortify
blufor_SOLDIER_LAT_X =			"LIB_SOV_AT_soldier_w";				//initHQ\guards.sqf
blufor_SOLDIER_GL_X =			"LIB_SOV_grenadier_w";				//initHQ\guards.sqf 
blufor_SOLDIER_TL_X =			"LIB_SOV_sergeant_w";				//initHQ\createpatrol.sqf
blufor_SOLDIER_SL_X =			"LIB_SOV_first_lieutenant_w";		//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"LIB_SOV_mgunner_w";				//initHQ\guards.sqf
blufor_MARKSMAN_X = 			"LIB_SOV_scout_sniper_w";			//initHQ\guards.sqf
blufor_OFFICER_X =				"LIB_SOV_captain_w";				//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"LIB_SOV_pilot";					//missions\missions\pilot\mission.sqf

blufor_BOAT_ARMED_X	=			"LIB_LCM3_Armed";					//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"LIB_SOV_LC_rifleman_w";			//support\taxi\boatTaxi.sqf

blufor_PLANE_SUPP_X =			"LIB_Li2";							//Support Paratroopers and Supply drop
blufor_PLANE_PATROL_X =			"LIB_P39_w";						//support\taxi\helotaxi.sqf, random patrol
blufor_PLANE_PATROL1_X =		"sab_i16";   						//support\uav_map.sqf, random patrol
blufor_PLANE_PATROL2_X =		"sab_la5_2";   						//random patrol
blufor_PLANE_PATROL3_X =		"sab_il2";   						//random patrol
blufor_PLANE_PATROL4_X =		"sab_tusb2";   						//random patrol
blufor_PLANE_FIGHTER_X =		"sab_la5";							//dialog\request_hcATTchop.sqf
blufor_PLANE_CAS_X =			"LIB_Pe2_w";						//dialog\request_hcCAS.sqf
blufor_CAR_PATROL1_X =			"LIB_Scout_M3_FFV_w";				//random patrol
blufor_APC_PATROL1_X =			"LIB_SdKfz251_captured_FFV_w";		//random patrol
blufor_APC_PATROL2_X =			"LIB_SOV_M3_Halftrack_w";			//random patrol
blufor_TANK_PATROL_X =			"LIB_M4A2_SOV_w";					//random patrol
blufor_TANK_PATROL1_X =			"LIB_SU85_w";						//random patrol Dang Edit
blufor_TANK_PATROL2_X =			"LIB_t34_76_w";						//random patrol Dang Edit
blufor_TANK_PATROL3_X =			"LIB_t34_76_w";						//random patrol Dang Edit
blufor_TANK_PATROL4_X =			"LIB_t34_85_w";						//random patrol Dang Edit
blufor_TANK_PATROL5_X =			"LIB_JS2_43_w";						//random patrol Dang Edit

///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"LIB_61K";
blufor_TURRET_AT =				"LIB_Zis3_w";
blufor_TURRET_HMG =				"LIB_Maxim_M30_base";
blufor_TURRET_GMG =				"LIB_Zis3_w";
blufor_TURRET_RAD =				"LIB_Static_zis6_radar";			//LT.Dang Edit Radar Vehicle at HQ and FOBS
blufor_TURRET_FLAG =			"LIB_FlagCarrier_SU";				//LT.Dang Flag at HQ and FOBS

/////////////////////////
// PARADROP SUPPORT TROOPS Dang Edit
/////////////////////////

blufor_PARA_X =				"LIB_SOV_scout_rifleman_w";				//support\paradrop.sqf		
blufor_PARA_AT_X =			"LIB_SOV_AT_M1A1_soldier_w";			//support\paradrop.sqf	
blufor_PARA_GL_X =			"LIB_SOV_grenadier_w";					//support\paradrop.sqf	
blufor_PARA_TL_X =			"LIB_SOV_sergeant_w";					//support\paradrop.sqf	
blufor_PARA_RAD_X =			"LIB_SOV_operator_w";					//support\paradrop.sqf	
blufor_PARA_AR_X =			"LIB_SOV_assault_mgunner_w";			//support\paradrop.sqf	
blufor_PARA_MED_X =			"LIB_SOV_medic_w";						//support\paradrop.sqf

	
/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"LIB_SOV_scout_rifleman_w";			//operator
blufor_SPECOPS_GL_X =			"LIB_SOV_grenadier_w";				//operator
blufor_SPECOPS_LAT_X =			"LIB_SOV_AT_M1A1_soldier_w";		//operator
blufor_SPECOPS_HAT_X =			"LIB_SOV_AT_soldier_w";				//operator
blufor_SPECOPS_AA_X =			"LIB_SOV_operator_w";				//operator
blufor_SPECOPS_MG_X =			"LIB_SOV_assault_mgunner_w";		//operator
blufor_SPECOPS_AR_X =			"LIB_SOV_assault_mgunner_w";		//operator Dang Edit
blufor_SPECOPS_MEDIC_X =		"LIB_SOV_medic_w";					//operator
blufor_SPECOPS_MARK_X =			"LIB_SOV_scout_sniper_w";			//operator
blufor_SPECOPS_SNIPER_X =		"LIB_SOV_scout_sniper_w";			//operator
blufor_SPECOPS_EXP_X =			"LIB_SOV_sapper_w";					//operator
blufor_SPECOPS_ENG_X = 			"LIB_SOV_sapper_w";					//operator
blufor_SPECOPS_SL_X = 			"LIB_SOV_lieutenant_w";				//operator Lt.Dang edit
blufor_SPECOPS_TL_X = 			"LIB_SOV_assault_sergeant_w";		//operator Lt.Dang edit
blufor_SPECOPS_ASS_X = 			"LIB_SOV_assault_smgunner_w";		//operator Lt.Dang edit


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


blufor_RQST_UNIT_01_X = 			["LIB_SOV_rifleman_w","Rifleman Mosin Nagant (2CP)",2];
blufor_RQST_UNIT_02_X =				["LIB_SOV_grenadier_w","Grenadier (3CP)",3];
blufor_RQST_UNIT_03_X =				["LIB_SOV_p_officer_w","Rifleman SVT 40 (3CP)",3];
blufor_RQST_UNIT_04_X =				["LIB_SOV_mgunner_w","Machinegunner (4CP)",4];
blufor_RQST_UNIT_05_X =				["LIB_SOV_medic_w","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["LIB_SOV_AT_M1A1_soldier_w","AT M1A1 Soldier (3CP)",3];
blufor_RQST_UNIT_07_X =				["LIB_SOV_AT_soldier_w","AT Panzershreck Soldier (4CP)",4];
blufor_RQST_UNIT_08_X =				["LIB_SOV_operator_w","Radio Operator (4CP)",4];
blufor_RQST_UNIT_09_X =				["LIB_SOV_sapper_w","Engineer (4CP)",4];
blufor_RQST_UNIT_10_X =				["LIB_SOV_scout_sniper_w","Sniper (3CP)",3];
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

blufor_RQST_VEHICLE_01_X =			["LIB_Willys_MB_w","Willys Jeep (1CP)",1];
blufor_RQST_VEHICLE_02_X =			["LIB_Willys_MB_Hood_w","Covered Willys Jeep (1CP)",1];
blufor_RQST_VEHICLE_03_X =			["LIB_Zis5v_w","Zis5v Truck (8CP)",8];
blufor_RQST_VEHICLE_04_X =			["LIB_Zis5v_Fuel_w","Zis5v Fuel Truck (12CP)",12];
blufor_RQST_VEHICLE_05_X =			["LIB_Zis5v_Med_w","Zis5v Ambulance Truck (12CP)",12];
blufor_RQST_VEHICLE_06_X =			["LIB_US6_Ammo","Studebaker Ammo Truck (12CP)",12];
blufor_RQST_VEHICLE_07_X =			["LIB_Zis6_Parm_w","Zis6 Repair Truck (15CP)",15];
blufor_RQST_VEHICLE_08_X =			["LIB_Scout_M3_FFV_w","M3 Scout Car (18CP)",18];
blufor_RQST_VEHICLE_09_X =			["LIB_SOV_M3_Halftrack_w","M3 Halftrack (20CP)",20];
blufor_RQST_VEHICLE_10_X =			["LIB_SdKfz251_captured_FFV_w","Captured SdKfz251 (20CP)",20];
blufor_RQST_VEHICLE_11_X =			["LIB_US6_BM13","BM13 Katyusha (30CP)",30];
blufor_RQST_VEHICLE_12_X =			["LIB_Zis5v_61K","Zis5v AA Truck (30CP)",30];
blufor_RQST_VEHICLE_13_X =			["LIB_M4A2_SOV_w","M4A2 75mm Sherman Tank (35CP)",35];
blufor_RQST_VEHICLE_14_X =			["LIB_SU85_w","SU-85 Tank (40CP)",40];
blufor_RQST_VEHICLE_15_X =			["LIB_t34_76_w","T-34 76mm Tank (45CP)",45];
blufor_RQST_VEHICLE_16_X =			["LIB_t34_85_w","T-34 85mm Tank (50CP)",50];
blufor_RQST_VEHICLE_17_X =			["LIB_JS2_43_w","JS2-43 Tank (60CP)",60];
blufor_RQST_VEHICLE_18_X =			["LIB_P39_w","P39 Aerocobra (40CP)",40];
blufor_RQST_VEHICLE_19_X =			["sab_i16","Polikarpov I-16 (30CP)",30];
blufor_RQST_VEHICLE_20_X =			["sab_la5","Lavochkin La-5 (35CP)",35];
blufor_RQST_VEHICLE_21_X =			["sab_il2","Il-2 Shturmovik (45CP)",45];
blufor_RQST_VEHICLE_22_X =			["LIB_Pe2_w","Pe-2 Petlyakov (50CP)",50];
blufor_RQST_VEHICLE_23_X =			["sab_tusb2","Tupolev SB (55CP)",55];
blufor_RQST_VEHICLE_24_X =			["empty",0,0];
blufor_RQST_VEHICLE_25_X =			["empty",0,0];
blufor_RQST_VEHICLE_26_X =			["empty",0,0];
blufor_RQST_VEHICLE_27_X =			["empty",0,0];
blufor_RQST_VEHICLE_28_X =			["empty",0,0];
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


