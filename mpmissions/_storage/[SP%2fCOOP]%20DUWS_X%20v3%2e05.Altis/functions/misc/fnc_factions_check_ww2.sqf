

// misc\factions_check.sqf


// make 2 local arrays [_faction_files_BLU] and [_faction_files_OPF]
//  - fill them with meta data about the faction files
//  - faction files for BLUFOR have a completely different unit/vehicle format
//    than OPFOR faction files
//  - BLUFOR array contents should be identical to the OPFOR array
//
// ARRAY DESCRIPTION
// [basic rifleman classname, faction class, selection menu label, faction file]
//
//  - faction class defines the faction classname i.e.  BLU_F for NATO (arid)
//  - faction class is used primarily for Random Vehicle patrols
//  - faction file defines the file containing all of the classnames available 

//  Don't need a BLUFOR (BLU_F_ARID) or OPFOR (OPF_F_ARID)
//	 - they are DEFAULTs

_faction_files_BLUFOR = [
["LIB_US_NAC_rifleman", "LIB_NAC", "IFA US ARMY (Desert)","IFA_US_ARMY_DESERT"],
["LIB_US_101AB_rifleman", "LIB_US_101AB", "IFA 101st AIRBORNE", "IFA_101stAIRBORNE"],
["LIB_US_82AB_rifleman", "LIB_US_82AB", "IFA 82nd AIRBORNE", "IFA_82ndAIRBORNE"],
["LIB_US_rifleman_w", "LIB_US_ARMY_w", "IFA US ARMY (Winter)","IFA_US_ARMY_WINTER"],
["Simc_US_M41_FC_rifleman", "Simc_UA_ETO", "US GEN EQUIP & ACC IFA US ARMY (Europe)","USGEA_US_ARMY"],
["Simc_US_Mantel_Legging_rifleman_w", "Simc_UA_ETO_w", "US GEN EQUIP & ACC IFA US ARMY (Winter)","USGEA_US_ARMY_WINTER"],
["fow_s_us_ab_m42_101_rifleman", "fow_usa", "FOW IFA 101st AIRBORNE","FOW_IFA_101stAIRBORNE"],
["fow_s_us_ab_m42_82_rifleman", "fow_usa", "FOW IFA 82nd AIRBORNE","FOW_IFA_82ndAIRBORNE"],
["fow_s_usmc_rifleman", "fow_usmc", "FOW IFA US MARINES","FOW_IFA_US_MARINES"],
["LIB_UK_Rifleman", "LIB_UK_ARMY", "IFA UK ARMY (Europe)","IFA_UK_ARMY"],
["LIB_UK_DR_Rifleman", "LIB_UK_DR", "IFA UK ARMY (Desert)","IFA_UK_ARMY_DESERT"],
["LIB_UK_Rifleman_w", "LIB_UK_ARMY_w", "IFA UK ARMY (Winter)","IFA_UK_ARMY_WINTER"],
["fow_s_uk_rifleman", "fow_uk", "FOW IFA UK ARMY","FOW_IFA_UK_ARMY"],
["fow_s_uk_seac_rifleman_l", "fow_uk", "FOW IFA ANZACS (Pacific)","FOW_IFA_ANZACS"],
["LIB_SOV_rifleman", "LIB_RKKA", "IFA RED ARMY (Europe)","IFA_RED_ARMY"],
["LIB_SOV_rifleman_w", "LIB_RKKA_w", "IFA RED ARMY (Winter)","IFA_RED_ARMY_WINTER"],
["LIB_GER_scout_ober_rifleman", "LIB_WEHRMACHT", "IFA WEHRMACHT (Europe)","IFA_WEHRMACHT"],
["LIB_GER_scout_ober_rifleman_w", "LIB_WEHRMACHT_w", "IFA WEHRMACHT (Winter)","IFA_WEHRMACHT_WINTER"],
["LIB_DAK_soldier", "LIB_DAK", "IFA AFRIKA KORPS", "IFA_AFRIKA_KORPS"],
["LIB_FSJ_soldier", "LIB_FSJ_Battle", "IFA FALLSCHIRMJAGERS (Europe)","IFA_FALLSCHIRMJAGERS"],
["LIB_FSJ_soldier_dak", "LIB_FSJ_DAK", "IFA FALLSCHIRMJAGERS (Sicily)","IFA_FALLSCHIRMJAGERS_SICILY"],
["fow_s_ger_luft_rifleman", "fow_luftwaffe", "FOW IFA FALLSCHIRMJAGERS (Europe)","FOW_IFA_FALLSCHIRMJAGERS"],
["fow_s_ger_heer_rifleman", "fow_heer", "FOW IFA HEER (Europe)","FOW_IFA_HEER"],
["LIB_GER_scout_soldier_03v00pMnn3K98", "GEISTWaffenSS", "IFA GEIST WAFFEN SS (Europe)","IFA_GEIST_WAFFEN_SS"],
["LIB_FRA_InfM41VjPgMotRM1Gar", "GEISTArmeeFr", "IFA GEIST FREE FRENCH", "IFA_GEIST_FREE_FRENCH"],
["LIB_POL_Soldier_1AWPInfc7vbpSzM30", "GEIST1ArmiaWojskaPolskiego", "IFA GEIST POLISH ARMY", "IFA_GEIST_POLISH_ARMY"],
["fow_s_ija_rifleman", "fow_ija", "FOW IFA IMPERIAL JAPANESE ARMY","FOW_IFA_IJA"]
];

_faction_files_OPFOR = [
["LIB_US_rifleman", "LIB_US_ARMY", "IFA US ARMY (Europe)","IFA_US_ARMY"],
["LIB_US_NAC_rifleman", "LIB_NAC", "IFA US ARMY (Desert)","IFA_US_ARMY_DESERT"],
["LIB_US_101AB_rifleman", "LIB_US_101AB", "IFA 101st AIRBORNE", "IFA_101stAIRBORNE"],
["LIB_US_82AB_rifleman", "LIB_US_82AB", "IFA 82nd AIRBORNE", "IFA_82ndAIRBORNE"],
["LIB_US_rifleman_w", "LIB_US_ARMY_w", "IFA US ARMY (Winter)","IFA_US_ARMY_WINTER"],
["Simc_US_M41_FC_rifleman", "Simc_UA_ETO", "US GEN EQUIP & ACC IFA US ARMY (Europe)","USGEA_US_ARMY"],
["Simc_US_Mantel_Legging_rifleman_w", "Simc_UA_ETO_w", "US GEN EQUIP & ACC IFA US ARMY (Winter)","USGEA_US_ARMY_WINTER"],
["fow_s_us_ab_m42_101_rifleman", "fow_usa", "FOW IFA 101st AIRBORNE","FOW_IFA_101stAIRBORNE"],
["fow_s_us_ab_m42_82_rifleman", "fow_usa", "FOW IFA 82nd AIRBORNE","FOW_IFA_82ndAIRBORNE"],
["fow_s_usmc_rifleman", "fow_usmc", "FOW IFA US MARINES","FOW_IFA_US_MARINES"],
["LIB_UK_Rifleman", "LIB_UK_ARMY", "IFA UK ARMY (Europe)","IFA_UK_ARMY"],
["LIB_UK_DR_Rifleman", "LIB_UK_DR", "IFA UK ARMY (Desert)","IFA_UK_ARMY_DESERT"],
["LIB_UK_Rifleman_w", "LIB_UK_ARMY_w", "IFA UK ARMY (Winter)","IFA_UK_ARMY_WINTER"],
["fow_s_uk_rifleman", "fow_uk", "FOW IFA UK ARMY","FOW_IFA_UK_ARMY"],
["fow_s_uk_seac_rifleman_l", "fow_uk", "FOW IFA ANZACS (Pacific)","FOW_IFA_ANZACS"],
["LIB_SOV_rifleman", "LIB_RKKA", "IFA RED ARMY (Europe)","IFA_RED_ARMY"],
["LIB_SOV_rifleman_w", "LIB_RKKA_w", "IFA RED ARMY (Winter)","IFA_RED_ARMY_WINTER"],
["LIB_GER_scout_ober_rifleman_w", "LIB_WEHRMACHT_w", "IFA WEHRMACHT (Winter)","IFA_WEHRMACHT_WINTER"],
["LIB_DAK_soldier", "LIB_DAK", "IFA AFRIKA KORPS","IFA_AFRIKA_KORPS"],
["LIB_FSJ_soldier", "LIB_FSJ_Battle", "IFA FALLSCHIRMJAGERS (Europe)","IFA_FALLSCHIRMJAGERS"],
["LIB_FSJ_soldier_dak", "LIB_FSJ_DAK", "IFA FALLSCHIRMJAGERS (Sicily)","IFA_FALLSCHIRMJAGERS_SICILY"],
["fow_s_ger_luft_rifleman", "fow_luftwaffe", "FOW IFA FALLSCHIRMJAGERS (Europe)","FOW_IFA_FALLSCHIRMJAGERS"],
["fow_s_ger_heer_rifleman", "fow_heer", "FOW IFA HEER (Europe)","FOW_IFA_HEER"],
["LIB_GER_scout_soldier_03v00pMnn3K98", "GEISTWaffenSS", "IFA GEIST WAFFEN SS (Europe)","IFA_GEIST_WAFFEN_SS"],
["LIB_FRA_InfM41VjPgMotRM1Gar", "GEISTArmeeFr", "IFA GEIST FREE FRENCH", "IFA_GEIST_FREE_FRENCH"],
["LIB_POL_Soldier_1AWPInfc7vbpSzM30", "GEIST1ArmiaWojskaPolskiego", "IFA GEIST POLISH ARMY", "IFA_GEIST_POLISH_ARMY"],
["fow_s_ija_rifleman", "fow_ija", "FOW IFA IMPERIAL JAPANESE ARMY","FOW_IFA_IJA"]
];

// Add the CUSTOM FACTION entries to the faction menu
_faction_files_BLUFOR = _faction_files_BLUFOR + [["B_Soldier_F", "CUSTOM", "CUSTOM BLUFOR Faction", "CUSTOM"]];
_faction_files_OPFOR = _faction_files_OPFOR + [["O_Soldier_F", "CUSTOM", "CUSTOM OPFOR Faction", "CUSTOM"]];

// create 2x global arrays Factions_Available_BLUFOR_X & Factions_Available_OPFOR_X
// check for existence of each rifleman from above
// add existing rifleman's faction and faction slect menu label to Factions_Available arrays

Factions_Available_BLUFOR_X = [];
Factions_Available_BLUFOR_X pushback ["LIB_US_ARMY", "Choose BLUFOR Faction...Default = IFA US ARMY","IFA_US_ARMY"];

{
	if (isClass(configFile >> "CfgVehicles" >> (_x select 0))) then {
		Factions_Available_BLUFOR_X pushback [(_x select 1), (_x select 2), (_x select 3)];  // faction, label
	};

} foreach _faction_files_BLUFOR;

Factions_Available_OPFOR_X = [];
Factions_Available_OPFOR_X pushback ["LIB_WEHRMACHT", "Choose OPFOR Faction...Default = IFA WEHRMACHT","IFA_WEHRMACHT"];

{
	if (isClass(configFile >> "CfgVehicles" >> (_x select 0))) then {
		Factions_Available_OPFOR_X pushback [(_x select 1), (_x select 2), (_x select 3)];  // faction, label
	};

} foreach _faction_files_OPFOR;

publicVariable "Factions_Available_OPFOR_X";
publicVariable "Factions_Available_BLUFOR_X";

// CIVILIAN CHECK
civ_mod = "vanilla";
if (isClass(configFile >> "CfgVehicles" >> "LIB_US_rifleman")) then {
	civ_mod = "ifa3";
};	
publicVariable "civ_mod";

 
 