
///////////////
///////////////   "fow_ija", "FOW IFA IMPERIAL JAPANESE ARMY","FOW_IFA_IJA"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"fow_s_ija_rifleman";				//patrol, fortify
blufor_SOLDIER_LAT_X =			"fow_s_ija_rifleman_at";			//initHQ\guards.sqf
blufor_SOLDIER_GL_X =			"fow_s_ija_type99_asst";			//initHQ\guards.sqf 
blufor_SOLDIER_TL_X =			"fow_s_ija_nco";					//initHQ\createpatrol.sqf
blufor_SOLDIER_SL_X =			"fow_s_ija_officer";				//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"fow_s_ija_type99_gunner";			//initHQ\guards.sqf
blufor_MARKSMAN_X = 			"fow_s_ija_rifleman";				//initHQ\guards.sqf
blufor_OFFICER_X =				"fow_s_ija_officer";				//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"fow_s_ija_pilot";					//missions\missions\pilot\mission.sqf

blufor_BOAT_ARMED_X	=			"sab_boat_subchaser_o_x";					//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"fow_s_ija_rifleman";				//support\taxi\boatTaxi.sqf

blufor_PLANE_SUPP_X =			"sab_w34";							//Support Paratroopers and Supply drop
blufor_PLANE_PATROL_X =			"fow_va_a6m_white";					//support\taxi\helotaxi.sqf, random patrol
blufor_PLANE_PATROL1_X =		"sab_ki100";   						//support\uav_map.sqf, random patrol
blufor_PLANE_PATROL2_X =		"sab_ki61";   						//random patrol
blufor_PLANE_PATROL3_X =		"sab_m6a";   						//random patrol
blufor_PLANE_PATROL4_X =		"sab_kate";   						//random patrol
blufor_PLANE_FIGHTER_X =		"fow_va_a6m_green";					//dialog\request_hcATTchop.sqf
blufor_PLANE_CAS_X =			"sab_aichival";						//dialog\request_hcCAS.sqf
blufor_CAR_PATROL1_X =			"fow_ija_type95_HaGo_1_ija";		//random patrol
blufor_APC_PATROL1_X =			"fow_ija_type95_HaGo_2_ija";		//random patrol
blufor_APC_PATROL2_X =			"fow_ija_type95_HaGo_3_ija";		//random patrol
blufor_TANK_PATROL_X =			"fow_ija_type95_HaGo_3_ija";		//random patrol
blufor_TANK_PATROL1_X =			"fow_ija_type95_HaGo_1_ija";		//random patrol Dang Edit
blufor_TANK_PATROL2_X =			"fow_ija_type95_HaGo_2_ija";		//random patrol Dang Edit
blufor_TANK_PATROL3_X =			"fow_ija_type95_HaGo_1_ija";		//random patrol Dang Edit
blufor_TANK_PATROL4_X =			"fow_ija_type95_HaGo_3_ija";		//random patrol Dang Edit
blufor_TANK_PATROL5_X =			"fow_ija_type95_HaGo_2_ija";		//random patrol Dang Edit

///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"LIB_Flak_38";
blufor_TURRET_AT =				"fow_w_pak40_camo_foliage_ger_heer";
blufor_TURRET_HMG =				"fow_w_type92_tripod_ija";
blufor_TURRET_GMG =				"fow_w_pak40_camo_foliage_ger_heer";
blufor_TURRET_RAD =				"LIB_Static_opelblitz_radio";			//LT.Dang Edit Radar Vehicle at HQ and FOBS
blufor_TURRET_FLAG =			"fow_Flag_Japan01";						//LT.Dang Flag at HQ and FOBS

/////////////////////////
// PARADROP SUPPORT TROOPS Dang Edit
/////////////////////////

blufor_PARA_X =				"fow_s_ija_snlf_rifleman";				//support\paradrop.sqf		
blufor_PARA_AT_X =			"fow_s_ija_snlf_rifleman_at";			//support\paradrop.sqf	
blufor_PARA_GL_X =			"fow_s_ija_snlf_type99_asst";			//support\paradrop.sqf	
blufor_PARA_TL_X =			"fow_s_ija_snlf_nco";					//support\paradrop.sqf	
blufor_PARA_RAD_X =			"fow_s_ija_snlf_rifleman";				//support\paradrop.sqf	
blufor_PARA_AR_X =			"fow_s_ija_snlf_type99_gunner";			//support\paradrop.sqf	
blufor_PARA_MED_X =			"fow_s_ija_snlf_medic";					//support\paradrop.sqf

	
/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"fow_s_ija_f_rifleman";					//operator
blufor_SPECOPS_GL_X =			"fow_s_ija_f_type99_asst";				//operator
blufor_SPECOPS_LAT_X =			"fow_s_ija_f_rifleman_at";				//operator
blufor_SPECOPS_HAT_X =			"fow_s_ija_f_rifleman_at";				//operator
blufor_SPECOPS_AA_X =			"fow_s_ija_f_nco";						//operator
blufor_SPECOPS_MG_X =			"fow_s_ija_f_type99_gunner";			//operator
blufor_SPECOPS_AR_X =			"fow_s_ija_f_type99_gunner";			//operator Dang Edit
blufor_SPECOPS_MEDIC_X =		"fow_s_ija_f_medic";					//operator
blufor_SPECOPS_MARK_X =			"fow_s_ija_f_type99_asst";				//operator
blufor_SPECOPS_SNIPER_X =		"fow_s_ija_f_rifleman";					//operator
blufor_SPECOPS_EXP_X =			"fow_s_ija_f_rifleman_at";				//operator
blufor_SPECOPS_ENG_X = 			"fow_s_ija_f_rifleman_at";				//operator
blufor_SPECOPS_SL_X = 			"fow_s_ija_f_officer";					//operator Lt.Dang edit
blufor_SPECOPS_TL_X = 			"fow_s_ija_f_nco";						//operator Lt.Dang edit
blufor_SPECOPS_ASS_X = 			"fow_s_ija_f_nco";						//operator Lt.Dang edit



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


blufor_RQST_UNIT_01_X = 			["fow_s_ija_rifleman","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["fow_s_ija_type99_asst","MG Asst. (3CP)",3];
blufor_RQST_UNIT_03_X =				["fow_s_ija_type99_gunner","Type99 Gunner (3CP)",3];
blufor_RQST_UNIT_04_X =				["fow_s_ija_officer","Officer (2CP)",2];
blufor_RQST_UNIT_05_X =				["fow_s_ija_medic","Medic (4CP)",4];
blufor_RQST_UNIT_06_X =				["fow_s_ija_nco","Team Leader (2CP)",2];
blufor_RQST_UNIT_07_X =				["fow_s_ija_rifleman_at","AT Soldier (3CP)",3];
blufor_RQST_UNIT_08_X =				["empty",0,0];
blufor_RQST_UNIT_09_X =				["empty",0,0];
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

blufor_RQST_VEHICLE_01_X =			["fow_v_type97_truck_ija","Type97 Truck Closed (10CP)",10];
blufor_RQST_VEHICLE_02_X =			["fow_v_type97_truck_open_ija","Type97 Truck Open (10CP)",10];
blufor_RQST_VEHICLE_03_X =			["fow_v_type97_truck_fuel_ija","Type97 Fuel Truck (12CP)",12];
blufor_RQST_VEHICLE_04_X =			["fow_v_type97_truck_utility_ija","Type97 Repair Rearm Refuel Truck (20CP)",20];
blufor_RQST_VEHICLE_05_X =			["fow_ija_type95_HaGo_1_ija","Type95 HaGo Tank (Grey) (30CP)",30];
blufor_RQST_VEHICLE_06_X =			["fow_ija_type95_HaGo_2_ija","Type95 HaGo Tank (Cammo) (30CP)",30];
blufor_RQST_VEHICLE_07_X =			["fow_ija_type95_HaGo_3_ija","Type95 HaGo Tank (Yellow Cammo) (30CP)",30];
blufor_RQST_VEHICLE_08_X =			["sab_a5m","Mitsubishi A5M (Claude) (20CP)",20];
blufor_RQST_VEHICLE_09_X =			["sab_ki61","Kawasaki Ki-61 (Tony)  (30CP)",30];
blufor_RQST_VEHICLE_10_X =			["sab_ki100","Kawasaki Ki-100 (30CP)",30];
blufor_RQST_VEHICLE_11_X =			["fow_va_a6m_green","Mitsubishi A6M (Zero) (35CP)",35];
blufor_RQST_VEHICLE_12_X =			["sab_m6av2","Aichi M6A (Jack) (40CP)",40];
blufor_RQST_VEHICLE_13_X =			["sab_kate","Nakajima B5N (Kate) (35CP)",35];
blufor_RQST_VEHICLE_14_X =			["sab_aichival","Aichi D3A (Val) (45CP)",45];
blufor_RQST_VEHICLE_15_X =			["empty",0,0];
blufor_RQST_VEHICLE_16_X =			["empty",0,0];
blufor_RQST_VEHICLE_17_X =			["empty",0,0];
blufor_RQST_VEHICLE_18_X =			["empty",0,0];
blufor_RQST_VEHICLE_19_X =			["empty",0,0];
blufor_RQST_VEHICLE_20_X =			["empty",0,0];
blufor_RQST_VEHICLE_21_X =			["empty",0,0];
blufor_RQST_VEHICLE_22_X =			["empty",0,0];
blufor_RQST_VEHICLE_23_X =			["empty",0,0];
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


