

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
["uns_men_RAR_65_RF4", "UNSUNG_AUS", "1st Australian Task Force 6RAR\SAS 1965","UNSUNG_RAR_65"],
["uns_men_NZ_65_RF1", "UNSUNG_NZ", "Royal New Zealand Infantry Regiment 2RARNZ\SAS 1965","UNSUNG_NZ_65"],
["uns_US_25ID_RF1", "UNSUNG_W_US", "US 25th ID 1968","UNSUNG_25ID_68"],
["uns_US_1ID_RF1", "UNSUNG_W_US", "US 1st Infantry Division\3rd Bn 4th Marines 1965", "UNSUNG_1ID_65"],
["uns_men_USMC_65_RF2", "UNSUNG_W_USMC", "US 3rd Bn 4th Marines 1965","UNSUNG_US_MARINES_65"],
["uns_men_USMC_65_RF2", "UNSUNG_W_USMC", "US 3rd Bn 4th Marines\NAVY SEALS 1965","UNSUNG_US_MARINES_SEALS_65"],
["uns_men_USMC_65_RF2", "UNSUNG_W_USMC", "US 3rd Bn 4th Marines\173rd LRRPS 1965","UNSUNG_US_MARINES_LRRPS_65"],
["uns_men_USMC_68_RF4", "UNSUNG_W_USMC", "US 2nd Bn 7th Marines 1968","UNSUNG_US_MARINES_68"],
["uns_men_USMC_68_RF4", "UNSUNG_W_USMC", "US 2nd Bn 7th Marines\3rd Force Recon 1968","UNSUNG_US_MARINES_RECON_68"],
["vn_b_men_army_15", "B_MACV", "PRAIRIE FIRE DLC US ARMY\MIKE FORCE 1968","DLC_US_ARMY_MIKEFORCE"],
["vn_b_men_army_15", "B_MACV", "PRAIRIE FIRE DLC US ARMY\MACV SOG 1968","DLC_US_ARMY_MACVSOG"],
["uns_men_NVA_68_RF1", "UNSUNG_E_NVA", "NVA 324th Bn 812th Rgt\Dac Cong Commandos 2nd Bn 246th Rgt. 1968","UNSUNG_NVA_68"],
["uns_men_NVA_65_RF1", "UNSUNG_E_NVA", "NVA 8th Bn 66th Rgt.\NVA Recon 4th 21st Rgt. 1965","UNSUNG_NVA_65"],
["uns_men_VC_local_RF2", "UNSUNG_EV_VCG", "VC 445th Bn Local Force\4th Bn 12th Rgt. Regional Recon Force 1965","UNSUNG_LOCAL_VC"],
["uns_men_VC_regional_RF2", "UNSUNG_EV_VCG", "VC 8th Bn 6th Rgt Regional Force\VC Mainforce 1967","UNSUNG_VC_REGIONAL"],
["uns_men_VC_regional_RF2", "UNSUNG_EV_VCG", "VC 8th Bn 6th Rgt Regional Force\NVA 324th Bn 812th Rgt 1968","UNSUNG_VC_REGIONAL_NVA_68"],
["vn_o_men_nva_65_05", "O_PAVN", "PRAIRIE FIRE DLC NVA 1965","DLC_NVA_65"],
["vn_o_men_nva_19", "O_PAVN", "PRAIRIE FIRE DLC NVA 1968","DLC_NVA_68"],
["vn_o_men_nva_19", "O_PAVN", "PRAIRIE FIRE DLC NVA\Dac Cong Commandos 1968","DLC_NVA_DAC_CONG_68"],
["vn_o_men_vc_06", "O_VC", "PRAIRIE FIRE DLC VC Mainforce\NVA 1968","DLC_VC_MAIN_NVA"],
["vn_o_men_vc_local_03", "O_VC", "PRAIRIE FIRE DLC VC Local Force\VC Mainforce","DLC_VC_LOCAL_VC_MAIN"],
["vn_o_men_vc_regional_03", "O_VC", "PRAIRIE FIRE DLC VC Regional Force\VC Mainforce","DLC_VC_REGIONAL_VC_MAIN"],
["uns_men_ARVN_RF4", "UNSUNG_G_ARVN", "ARVN 81st Rangers 1967\CIDG Montagnards 1965","UNSUNG_ARVN_67"]
];

_faction_files_OPFOR = [
["uns_men_RAR_65_RF4", "UNSUNG_AUS", "1st Australian Task Force 6RAR\SAS 1965","UNSUNG_RAR_65"],
["uns_men_NZ_65_RF1", "UNSUNG_NZ", "Royal New Zealand Infantry Regiment 2RARNZ\SAS 1965","UNSUNG_NZ_65"],
["uns_US_25ID_RF1", "UNSUNG_W_US", "US 25th ID 1968","UNSUNG_25ID_68"],
["uns_US_25ID_RF1", "UNSUNG_W_US", "US 25th ID\173rd LRRPS 1968","UNSUNG_25ID_LRRPS_68"],
["uns_US_1ID_RF1", "UNSUNG_W_US", "US 1st Infantry Division\3rd Bn 4th Marines 1965","UNSUNG_1ID_65"],
["uns_men_USMC_65_RF2", "UNSUNG_W_USMC", "US 3rd Bn 4th Marines 1965","UNSUNG_US_MARINES_65"],
["uns_men_USMC_65_RF2", "UNSUNG_W_USMC", "US 3rd Bn 4th Marines\NAVY SEALS 1965","UNSUNG_US_MARINES_SEALS_65"],
["uns_men_USMC_65_RF2", "UNSUNG_W_USMC", "US 3rd Bn 4th Marines\173rd LRRPS 1965","UNSUNG_US_MARINES_LRRPS_65"],
["uns_men_USMC_68_RF4", "UNSUNG_W_USMC", "US 2nd Bn 7th Marines 1968","UNSUNG_US_MARINES_68"],
["uns_men_USMC_68_RF4", "UNSUNG_W_USMC", "US 2nd Bn 7th Marines\3rd Force Recon 1968","UNSUNG_US_MARINES_RECON_68"],
["vn_b_men_army_15", "B_MACV", "PRAIRIE FIRE DLC US ARMY\MIKE FORCE 1968","DLC_US_ARMY_MIKEFORCE"],
["vn_b_men_army_15", "B_MACV", "PRAIRIE FIRE DLC US ARMY\MACV SOG 1968","DLC_US_ARMY_MACVSOG"],
["uns_men_NVA_65_RF1", "UNSUNG_E_NVA", "NVA 8th Bn 66th Rgt 1965","UNSUNG_NVA_65"],
["uns_men_VC_local_RF2", "UNSUNG_EV_VCG", "VC 445th Bn Local Force\4th Bn 12th Rgt. Regional Recon Force 1965","UNSUNG_LOCAL_VC"],
["uns_men_VC_regional_RF2", "UNSUNG_EV_VCG", "VC 8th Bn 6th Rgt Regional Force\VC Mainforce 1967","UNSUNG_VC_REGIONAL"],
["uns_men_VC_regional_RF2", "UNSUNG_EV_VCG", "VC 8th Bn 6th Rgt Regional Force\NVA 324th Bn 812th Rgt 1968","UNSUNG_VC_REGIONAL_NVA_68"],
["vn_o_men_nva_65_05", "O_PAVN", "PRAIRIE FIRE DLC NVA 1965","DLC_NVA_65"],
["vn_o_men_nva_19", "O_PAVN", "PRAIRIE FIRE DLC NVA 1968","DLC_NVA_68"],
["vn_o_men_nva_19", "O_PAVN", "PRAIRIE FIRE DLC NVA\Dac Cong Commandos 1968","DLC_NVA_DAC_CONG_68"],
["vn_o_men_vc_06", "O_VC", "PRAIRIE FIRE DLC VC Mainforce\NVA 1968","DLC_VC_MAIN_NVA"],
["vn_o_men_vc_local_03", "O_VC", "PRAIRIE FIRE DLC VC LOCAL\VC Mainforce","DLC_VC_LOCAL_VC_MAIN"],
["vn_o_men_vc_regional_03", "O_VC", "PRAIRIE FIRE DLC VC Regional Force\VC Mainforce","DLC_VC_REGIONAL_VC_MAIN"],
["uns_men_ARVN_RF4", "UNSUNG_G_ARVN", "ARVN 81st Rangers 1967\CIDG Montagnards 1965","UNSUNG_ARVN_67"]
];

// Add the CUSTOM FACTION entries to the faction menu
_faction_files_BLUFOR = _faction_files_BLUFOR + [["B_Soldier_F", "CUSTOM", "CUSTOM BLUFOR Faction", "CUSTOM"]];
_faction_files_OPFOR = _faction_files_OPFOR + [["O_Soldier_F", "CUSTOM", "CUSTOM OPFOR Faction", "CUSTOM"]];

// create 2x global arrays Factions_Available_BLUFOR_X & Factions_Available_OPFOR_X
// check for existence of each rifleman from above
// add existing rifleman's faction and faction slect menu label to Factions_Available arrays

Factions_Available_BLUFOR_X = [];
Factions_Available_BLUFOR_X pushback ["UNSUNG_W_US", "Choose BLUFOR Faction...Default = 25th ID\173rd LRRPS 1968","UNSUNG_25ID_LRRPS_68"];

{
	if (isClass(configFile >> "CfgVehicles" >> (_x select 0))) then {
		Factions_Available_BLUFOR_X pushback [(_x select 1), (_x select 2), (_x select 3)];  // faction, label
	};

} foreach _faction_files_BLUFOR;

Factions_Available_OPFOR_X = [];
Factions_Available_OPFOR_X pushback ["UNSUNG_E_NVA", "Choose OPFOR Faction...Default = NVA 324th Bn 812th Rgt\Dac Cong Commandos 2nd Bn 246th Rgt. 1968","UNSUNG_NVA_68"];

{
	if (isClass(configFile >> "CfgVehicles" >> (_x select 0))) then {
		Factions_Available_OPFOR_X pushback [(_x select 1), (_x select 2), (_x select 3)];  // faction, label
	};

} foreach _faction_files_OPFOR;

publicVariable "Factions_Available_OPFOR_X";
publicVariable "Factions_Available_BLUFOR_X";

// CIVILIAN CHECK
civ_mod = "vanilla";
if (isClass(configFile >> "CfgVehicles" >> "uns_US_25ID_RF1")) then {
	civ_mod = "unsung";
};	
publicVariable "civ_mod";

 
 