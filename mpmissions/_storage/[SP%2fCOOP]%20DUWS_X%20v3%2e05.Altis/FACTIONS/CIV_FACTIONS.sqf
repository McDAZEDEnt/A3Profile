
// VANILLA CIVs
if (CIV_PRESENCE == "med") then {
	civ_array = ["C_man_p_beggar_F","C_Man_casual_1_F","C_Man_casual_3_F","C_Man_casual_8_F","C_Man_casual_6_v2_F","C_Man_casual_2_F"];
};
if (CIV_PRESENCE == "tanoa") then {
	civ_array = ["C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_8_F_tanoan","C_Man_casual_2_F_tanoan"];
};
if (CIV_PRESENCE == "asia") then {
	civ_array = ["C_man_p_beggar_F_asia","C_Man_casual_3_F_asia","C_man_sport_2_F_asia","C_Man_casual_6_F_asia","C_Man_casual_9_F_asia"];
};
if (CIV_PRESENCE == "sumeuro") then {
	civ_array = ["C_Man_1_enoch_F","C_Man_3_enoch_F","C_Farmer_01_enoch_F","C_Man_casual_6_v2_F_euro","C_Man_casual_2_F_euro","C_Man_casual_8_F_euro"];
};
if (CIV_PRESENCE == "Vafrica") then {
	civ_array = ["C_man_p_beggar_F_afro","C_Man_casual_8_F_afro","C_Man_casual_4_F_afro","C_Man_casual_5_F_afro","C_Man_casual_6_F_afro"];
};

// CUP-CFP CIVs
if (CIV_PRESENCE == "Ccoldeuro") then {
	civ_array = ["CFP_C_CHERNO_WIN_Civilian_02", "CFP_C_CHERNO_WIN_Civilian_03", "CFP_C_CHERNO_WIN_Civilian_01", "CUP_C_R_Citizen_01", "CUP_C_R_Racketeer_03", "CUP_C_R_Schoolteacher_01", "CUP_C_R_Worker_02", "CUP_C_R_Mechanic_01", "CUP_C_C_Villager_03", "CUP_C_C_Woodlander_03"];
};
if (CIV_PRESENCE == "Cmideast") then {
	civ_array = ["CFP_C_ME_Civ_2_01", "CFP_C_ME_Civ_1_01", "CUP_C_TK_Man_04", "CUP_C_TK_Man_05_Coat", "CUP_C_TK_Man_01_Coat"];
};
if (CIV_PRESENCE == "Cafghan") then {
	civ_array = ["CUP_C_TK_Man_08", "CUP_C_TK_Man_02", "CUP_C_TK_Man_03_Jack", "CFP_C_AFG_Civilian_02", "CFP_C_AFG_Civilian_01"];
};
if (CIV_PRESENCE == "Cafrica") then {
	civ_array = ["CFP_C_AFRCHRISTIAN_Civ_8_01", "CFP_C_AFRCHRISTIAN_Civ_6_01", "CFP_C_AFRCHRISTIAN_Civ_9_01", "CFP_C_AFRCHRISTIAN_Civ_13_01", "CFP_C_AFRCHRISTIAN_Civ_4_01", "CFP_C_AFRISLAMIC_Civ_7_01", "CFP_C_AFRISLAMIC_Civ_1_01", "CFP_C_AFRISLAMIC_Civ_11_01", "CFP_C_AFRISLAMIC_Civ_12_01"];
};

// RHS-PrOpfor CIVs
if (CIV_PRESENCE == "Pcoldeuro") then {
	civ_array = ["LOP_CHR_Civ_Citizen_03", "LOP_CHR_Civ_Profiteer_02", "LOP_CHR_Civ_Worker_03", "LOP_CHR_Civ_Woodlander_02", "LOP_CHR_Civ_SchoolTeacher", "LOP_CHR_Civ_Random", "LOP_CHR_Civ_Worker_04"];
};
if (CIV_PRESENCE == "Pmideast") then {
	civ_array = ["LOP_Tak_Civ_Man_06", "LOP_Tak_Civ_Man_08", "LOP_Tak_Civ_Man_07", "LOP_Tak_Civ_Man_10", "LOP_Tak_Civ_Man_11", "LOP_Tak_Civ_Man_12", "LOP_Tak_Civ_Man_04", "LOP_Tak_Civ_Man_15"];
};
if (CIV_PRESENCE == "Pafrica") then {
	civ_array = ["LOP_AFR_Civ_Man_01", "LOP_AFR_Civ_Man_02", "LOP_AFR_Civ_Man_03", "LOP_AFR_Civ_Man_04", "LOP_AFR_Civ_Man_05", "LOP_AFR_Civ_Man_06", "LOP_AFR_Civ_Man_06_S"];
};

// UNSUNG Civs
if (CIV_PRESENCE == "Unsung") then {
	civ_array = ["uns_civilian1", "uns_civilian2", "uns_civilian3", "uns_civilian4"];
};

// IFA3 Civs
if (CIV_PRESENCE == "IFA3") then {
	civ_array = ["LIB_CIV_Citizen_1", "LIB_CIV_Citizen_2", "LIB_CIV_Citizen_3", "LIB_CIV_Citizen_6", "LIB_CIV_Citizen_8", "LIB_CIV_Worker_4", "LIB_CIV_Villager_4", "LIB_CIV_Villager_3"];
};

publicVariable "civ_array";





