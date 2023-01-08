
///////////////
///////////////   "UNSUNG_EV_VCG", "VC 8th Bn 6th Rgt Regional Force\NVA 324th Bn 812th Rgt 1968","UNSUNG_VC_REGIONAL_NVA_68"
///////////////

//////////////////////////////////////////////////////////////////////
/////  UNITS, VEHICLES WITH FIXED, ONE-OFF ROLES
/////   - Patrols, Guards, Support Units, Task Forces, Side Missions
/////
/////  TRY NOT TO ALTER THE UNIT TYPES.  THESE UNITS HAVE FIXED ROLES
//////////////////////////////////////////////////////////////////////

blufor_SOLDIER_X =				"uns_men_VC_regional_RF2";				//patrol, fortify, paradrop
blufor_SOLDIER_LAT_X =			"uns_men_VC_regional_AT2";			//initHQ\guards.sqf, support\paradrop.sqf
blufor_SOLDIER_GL_X =			"uns_men_VC_regional_RF7";				//initHQ\guards.sqf, support\paradrop.sqf
blufor_SOLDIER_TL_X =			"uns_men_VC_regional_nco";				//initHQ\createpatrol.sqf, initHQ\guards.sqf
blufor_SOLDIER_SL_X =			"uns_men_VC_regional_Roff";				//support\cluster\cluster.sqf (comms voice), Multiplayer slot
blufor_SOLDIER_AR_X =			"uns_men_VC_regional_Rmg";				//support\paradrop.sqf, initHQ\guards.sqf
blufor_MARKSMAN_X = 			"uns_men_VC_regional_MRK";			//initHQ\guards.sqf
blufor_OFFICER_X =				"uns_men_VC_regional_COM";			//initHQ\BluHQinit.sqf
blufor_HELI_PILOT_X	=			"uns_nvaf_pilot2";					//missions\missions\pilot\mission.sqf

blufor_BOAT_ARMED_X	=			"UNS_ASSAULT_BOAT_VC";					//support\taxi\boatTaxi.sqf
blufor_BOAT_CREW_X =			"uns_men_VC_regional_nco";				//support\taxi\boatTaxi.sqf

blufor_HELI_TRANS_ARM_X =		"uns_Mi8T_VPAF_MG";				//support\taxi\helotaxi.sqf, random patrol
blufor_HELI_TRANS_UNARM_X =		"uns_Mi8T_VPAF";   				//random patrol
blufor_HELI_ATTACK_X =			"uns_an2_bmb";					//dialog\request_hcATTchop.sqf
blufor_HELI_ATTACK1_X =			"uns_Mi8T_VPAF_MG";				//dialog\request_hcATTchop.sqf Dang
blufor_HELI_ATTACK2_X =			"uns_Mi8T_VPAF_MG";				//dialog\request_hcATTchop.sqf Dang
blufor_HELI_ATTACK3_X =			"uns_Mi8T_VPAF_MG";				//dialog\request_hcATTchop.sqf Dang
blufor_PLANE_CAS_X =			"uns_Mig21_LGB";				//dialog\request_hcCAS.sqf
blufor_PLANE_FIGHTER_X =		"uns_Mig21_SEAD";				//dialog\request_hcCAS1.sqf Dang
blufor_PLANE_PATROL_X = 		"uns_Mig21_MR";					//random patrol Dang
blufor_PLANE_PATROL1_X = 		"uns_Mig21_CAP";					//random patrol Dang
blufor_PLANE_PATROL2_X = 		"uns_Mig21_HCAS";				//random patrol Dang
blufor_PLANE_PATROL3_X = 		"uns_Mig21_CAS";				//random patrol Dang
blufor_PLANE_CARGO_X = 			"uns_an2_transport";			//support\paradrop.sqf Dang
blufor_PLANE_RECON_X = 			"uns_an2_transport";			//support\uavmap.sqf Dang
blufor_CAR_PATROL1_X =			"uns_Type55_patrol";			//random patrol
blufor_APC_PATROL1_X =			"pook_ZSU_NVA";					//random patrol
blufor_APC_PATROL2_X =			"uns_BTR152_DSHK";				//random patrol
blufor_APC_PATROL3_X =			"uns_Type55_RR73";				//random patrol Dang
blufor_APC_PATROL4_X =			"uns_BTR152_ZPU";				//random patrol Dang
blufor_APC_PATROL5_X =			"uns_Type63_mg";				//random patrol Dang
blufor_APC_PATROL6_X =			"uns_pt76";						//random patrol Dang
blufor_TANK_PATROL1_X =			"uns_t34_76_vc";				//random patrol
blufor_TANK_PATROL2_X =			"uns_ot34_85_nva";				//random patrol Dang
blufor_TANK_PATROL3_X =			"uns_t54_nva";					//random patrol Dang
blufor_TANK_PATROL4_X =			"uns_to55_nva";					//random patrol Dang


///////////////////////////////////
//  STATIC WEAPONS - HQ and FOBs
///////////////////////////////////

blufor_TURRET_AA = 				"uns_ZU23_VC";
blufor_TURRET_AT =				"uns_M40_106mm_VC";
blufor_TURRET_HMG =				"uns_pk_high_VC";
blufor_TURRET_GMG =				"uns_dshk_high_VC";
blufor_STATIC_CRASH =			"uns_mi8_wreck";
blufor_STATIC_FLAG =			"uns_FlagCarrierVC";
blufor_STATIC_RADIO =			"uns_radio2_nva_radio";


/////////////////////////
//  OPERATOR REQUEST
/////////////////////////

blufor_SPECOPS_X =				"uns_men_NVA_68_RF1";					//operator
blufor_SPECOPS_GL_X =			"uns_men_NVA_68_Ra2";					//operator
blufor_SPECOPS_LAT_X =			"uns_men_NVA_68_AT";					//operator
blufor_SPECOPS_HAT_X =			"uns_men_NVA_68_AT2";					//operator
blufor_SPECOPS_AA_X =			"uns_men_NVA_68_AA";					//operator
blufor_SPECOPS_MG_X =			"uns_men_NVA_68_Rmg";					//operator
blufor_SPECOPS_MEDIC_X =		"uns_men_NVA_68_Rmed";					//operator
blufor_SPECOPS_MARK_X =			"uns_men_NVA_68_MRK";					//operator
blufor_SPECOPS_SNIPER_X =		"uns_men_NVA_68_Rmrk";					//operator
blufor_SPECOPS_EXP_X =			"uns_men_NVA_68_RSAP";					//operator
blufor_SPECOPS_ENG_X = 			"uns_men_NVA_68_SAP";					//operator
blufor_SPECOPS_SL_X = 			"uns_men_NVA_68_Roff";					//operator Dang
blufor_SPECOPS_PL_X = 			"uns_men_NVA_68_nco";					//operator Dang
blufor_SPECOPS_ASS_X = 			"uns_men_NVA_68_Ra1";					//operator Dang


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


blufor_RQST_UNIT_01_X = 			["uns_men_VC_regional_RF2","Rifleman (2CP)",2];
blufor_RQST_UNIT_02_X =				["uns_men_VC_regional_RTO","Radio Operator (2CP)",2];
blufor_RQST_UNIT_03_X =				["uns_men_VC_regional_LMG","Automatic Rifleman (3CP)",3];
blufor_RQST_UNIT_04_X =				["uns_men_VC_regional_MED","Medic (4CP)",4];
blufor_RQST_UNIT_05_X =				["uns_men_VC_regional_AT2","L-AT Rifleman (3CP)",3];
blufor_RQST_UNIT_06_X =				["uns_men_VC_regional_AT","H-AT Rifleman (4CP)",4];
blufor_RQST_UNIT_07_X =				["uns_men_VC_regional_SAP","Engineer (4CP)",4];
blufor_RQST_UNIT_08_X =				["uns_men_VC_regional_MRK2","Marksman (3CP)",3];
blufor_RQST_UNIT_09_X =				["uns_men_VC_regional_MRK","Sniper (3CP)",3];
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

blufor_RQST_VEHICLE_01_X =			["uns_Type55","Type 55 Transport (2CP)",2];
blufor_RQST_VEHICLE_02_X =			["uns_Type55_LMG","Type 55 LMG (4CP)",4];
blufor_RQST_VEHICLE_03_X =			["uns_Type55_MG","Type 55 HMG (5CP)",5];
blufor_RQST_VEHICLE_04_X =			["uns_Type55_M40","Type 55 M40 (8CP)",8];
blufor_RQST_VEHICLE_05_X =			["uns_Type55_TwinMG","Type 55 Twin HMG (10CP)",10];
blufor_RQST_VEHICLE_06_X =			["uns_nvatruck_open","Ural Truck Open (5CP)",5];
blufor_RQST_VEHICLE_07_X =			["uns_nvatruck_camo","Ural Truck Camo (5CP)",5];
blufor_RQST_VEHICLE_08_X =			["uns_nvatruck_reammo","Ural Ammo Truck (10CP)",10];
blufor_RQST_VEHICLE_09_X =			["uns_nvatruck_refuel","Ural Fuel Truck (10CP)",10];
blufor_RQST_VEHICLE_10_X =			["uns_nvatruck_repair","Ural Repair Truck (12CP)",12];
blufor_RQST_VEHICLE_11_X =			["uns_Type63_amb","Ural Truck Camo (8CP)",8];
blufor_RQST_VEHICLE_12_X =			["uns_BTR152_DSHK","BTR-152 HMG (15CP)",15];
blufor_RQST_VEHICLE_13_X =			["uns_BTR152_ZPU","BTR-152 AA (20CP)",20];
blufor_RQST_VEHICLE_14_X =			["uns_Type63_mg","Type-63 APC Armed (20CP)",20];
blufor_RQST_VEHICLE_15_X =			["uns_pt76","PT-76B APC (35CP)",35];
blufor_RQST_VEHICLE_16_X =			["pook_ZSU_NVA","ZSU-23-4 Shilka (35CP)",35];
blufor_RQST_VEHICLE_17_X =			["pook_ZSU57_NVA","ZSU-57-2 Sparka (40CP)",40];
blufor_RQST_VEHICLE_18_X =			["uns_t34_76_vc","T-34 76mm Tank (40CP)",40];
blufor_RQST_VEHICLE_19_X =			["uns_ot34_85_nva","T-34 85mm Tank (45CP)",45];
blufor_RQST_VEHICLE_20_X =			["uns_t54_nva","T-54 Tank (50CP)",50];
blufor_RQST_VEHICLE_21_X =			["uns_to55_nva","T-55 Tank (55CP)",55];
blufor_RQST_VEHICLE_22_X =			["uns_Mi8T_VPAF","Mi-8T Unarmed (20CP)",20];
blufor_RQST_VEHICLE_23_X =			["uns_Mi8T_VPAF_MG","Mi-8T Armed (25CP)",25];
blufor_RQST_VEHICLE_24_X =			["uns_an2_bmb","An-2 Colt BMB (30CP)",30];
blufor_RQST_VEHICLE_25_X =			["uns_an2_cas","An-2 Colt CAS (30CP)",30];
blufor_RQST_VEHICLE_26_X =			["uns_Mig21_LGB","Mig-21 LGB (45CP)",45];
blufor_RQST_VEHICLE_27_X =			["uns_Mig21_SEAD","Mig-21 SEAD (45CP)",45];
blufor_RQST_VEHICLE_28_X =			["uns_Mig21_MR","Mig-21 MR (45CP)",45];
blufor_RQST_VEHICLE_29_X =			["uns_Mig21_CAP","Mig-21 CAP (45CP)",45];
blufor_RQST_VEHICLE_30_X =			["uns_Mig21_HCAS","Mig-21 HCAS (45CP)",45];
blufor_RQST_VEHICLE_31_X =			["uns_Mig21_CAS","Mig-21 CAS (45CP)",45];
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
blufor_RQST_VEHICLE_51_X =			["empty",0,0];

