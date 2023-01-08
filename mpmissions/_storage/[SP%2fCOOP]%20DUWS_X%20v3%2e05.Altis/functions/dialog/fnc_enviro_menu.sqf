
_handle = createDialog "startup_dialog";
waitUntil {dialog};

// WEATHER TYPE
index_weather_type_tropical = lbAdd [2100, localize "STR_DUWS_X_ex41rpdu"];
index_weather_type_arid = lbAdd [2100, localize "STR_DUWS_X_jf8jtvt7"];
index_weather_type_temperate = lbAdd [2100, localize "STR_DUWS_X_kpi5qxd0"];
index_weather_type_temperate_cold = lbAdd [2100, localize "STR_DUWS_X_jr6krtcn"];
index_weather_type_mediterranean = lbAdd [2100, localize "STR_DUWS_X_1777ggdk"];
index_weather_type_varied = lbAdd [2100, localize "STR_DUWS_X_pa387ndd"];
index_weather_type_disable = lbAdd [2100, localize "STR_DUWS_X_6dgte6s0"];
lbSetCurSel [2100, index_weather_type_disable];

// TIME OF DAY
time_of_day_dawn = lbAdd [2101, localize "STR_DUWS_X_4hmx1wzd"];
time_of_day_noon = lbAdd [2101, localize "STR_DUWS_X_95vrzwsq"];
time_of_day_evening = lbAdd [2101, localize "STR_DUWS_X_pshlpqdy"];
time_of_day_midnite = lbAdd [2101, localize "STR_DUWS_X_wmhmoeqt"];
lbSetCurSel [2101, time_of_day_dawn];

// ENABLE CHOPPER FAST TRAVEL
index_chopper_travel_false = lbAdd [2102, localize "STR_DUWS_X_x4zs3lsg"];
index_chopper_travel_true = lbAdd [2102, localize "STR_DUWS_X_vk37aebo"];
lbSetCurSel [2102, index_chopper_travel_false];

// FOB FAST TRAVEL
index_fast_travel_true = lbAdd [2103, localize "STR_DUWS_X_vk37aebo"];
index_fast_travel_false = lbAdd [2103, localize "STR_DUWS_X_x4zs3lsg"];
lbSetCurSel [2103, index_fast_travel_true];

// ZEUS PARAMS
index_zeus_params_full = lbAdd [2104, localize "STR_DUWS_X_m4bqnyut"];
index_zeus_params_blufor = lbAdd [2104, localize "STR_DUWS_X_nque25op"];
index_zeus_params_none = lbAdd [2104, localize "STR_DUWS_X_3i1vcc0n"];
lbSetCurSel [2104, index_zeus_params_blufor];

// ENABLE STAMINA
index_enable_stamina_true = lbAdd [2105, localize "STR_DUWS_X_vk37aebo"];
index_enable_stamina_false = lbAdd [2105, localize "STR_DUWS_X_x4zs3lsg"];
lbSetCurSel [2105, index_enable_stamina_false];

// ENABLE VCOM AI
if (isClass (configFile >> "CfgPatches" >> "VCOM_AI")) then {
	index_VCOM_false = lbAdd [2106, "VCOM AI mod detected"];
	lbSetCurSel [2106, index_VCOM_false];
} else {
	index_VCOM_false = lbAdd [2106, localize "STR_DUWS_X_x4zs3lsg"];
	index_VCOM_true = lbAdd [2106, localize "STR_DUWS_X_vk37aebo"];
	lbSetCurSel [2106, index_VCOM_true];
};

// TIME MULITPLIER
index_timemult_1 = lbAdd [2107, "1x"];
index_timemult_2 = lbAdd [2107, "2x"];
index_timemult_4 = lbAdd [2107, "4x"];
index_timemult_8 = lbAdd [2107, "8x"];
index_timemult_16 = lbAdd [2107, "16x"];
index_timemult_24 = lbAdd [2107, "24x"];
index_timemult_32 = lbAdd [2107, "32x"];
index_timemult_60 = lbAdd [2107, "60x"];
lbSetCurSel [2107, index_timemult_1];

// ENABLE SIMPLE ZONES
index_simpzones_false = lbAdd [2108, localize "STR_DUWS_X_x4zs3lsg"];
index_simpzones_true = lbAdd [2108, localize "STR_DUWS_X_vk37aebo"];
lbSetCurSel [2108, index_simpzones_false];

// ENABLE CIVILIANS
index_civtype_none = lbAdd [2109, localize "STR_DUWS_X_d8he1qkh"];
switch (civ_mod) do {
	case "propfor" : {
		index_civtype_Pcoldeuro = lbAdd [2109, localize "STR_DUWS_X_lez0jp04"];
		index_civtype_Pmideast = lbAdd [2109, localize "STR_DUWS_X_wnfbjquf"];
		index_civtype_Pafrica = lbAdd [2109, localize "STR_DUWS_X_ycoll66i"];
	};
	case "cfp" : {
		index_civtype_Ccoldeuro = lbAdd [2109, localize "STR_DUWS_X_uv3r9klr"];
		index_civtype_Cmideast = lbAdd [2109, localize "STR_DUWS_X_fkysvpi4"];
		index_civtype_Cafghan = lbAdd [2109, localize "STR_DUWS_X_rlykfz31"];
		index_civtype_Cafrica = lbAdd [2109, localize "STR_DUWS_X_p7ahis16"];
	};
	case "cfp" : {
		index_civtype_Unsung = lbAdd [2109, localize "STR_DUWS_X_5kow9zoj"];
	};
	case "ifa3" : {
		index_civtype_IFA3 = lbAdd [2109, localize "STR_DUWS_X_7yc3uncm"];
	};
};
index_civtype_med = lbAdd [2109, localize "STR_DUWS_X_1777ggdk"];
index_civtype_tanoa = lbAdd [2109, localize "STR_DUWS_X_2j83vkge"];
index_civtype_Vafrica = lbAdd [2109, localize "STR_DUWS_X_c0v3wxlw"];
index_civtype_asia = lbAdd [2109, localize "STR_DUWS_X_be1dhnmv"];
index_civtype_sumeuro = lbAdd [2109, localize "STR_DUWS_X_3tbqvi73"];

lbSetCurSel [2109, index_civtype_none];

// ENABLE HARDCORE MODE
index_hardcore_false = lbAdd [2110, localize "STR_DUWS_X_x4zs3lsg"];
index_hardcore_true = lbAdd [2110, localize "STR_DUWS_X_vk37aebo"];
lbSetCurSel [2110, index_hardcore_false];

// ENABLE RESTRICTED ARSENAL
index_restricted_arsenal_false = lbAdd [2111, localize "STR_DUWS_X_pkuqwjtu"];
index_restricted_arsenal_true = lbAdd [2111, localize "STR_DUWS_X_vk37aebo"];
lbSetCurSel [2111, index_restricted_arsenal_true];

