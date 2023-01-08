  _handle = createDialog "startup_dialog2";
  waitUntil {dialog};

  /// MAX RADIUS
  index_max_radius_2000 = lbAdd [2100, "2000m"];
  index_max_radius_1750 = lbAdd [2100, "1750m"];
  index_max_radius_1500 = lbAdd [2100, "1500m"];
  index_max_radius_1250 = lbAdd [2100, "1250m"];
  index_max_radius_1000 = lbAdd [2100, "1000m"];
  index_max_radius_750 = lbAdd [2100, "750m"];
  index_max_radius_500 = lbAdd [2100, "500m"];
  index_max_radius_250 = lbAdd [2100, "250m"];
  lbSetCurSel [2100, index_max_radius_500];

  // MIN RADIUS
  index_min_radius_1750 = lbAdd [2101, "1750m"];
  index_min_radius_1500 = lbAdd [2101, "1500m"];
  index_min_radius_1250 = lbAdd [2101, "1250m"];
  index_min_radius_1000 = lbAdd [2101, "1000m"];
  index_min_radius_750 = lbAdd [2101, "750m"];
  index_min_radius_500 = lbAdd [2101, "500m"];
  index_min_radius_350 = lbAdd [2101, "350m"];
  index_min_radius_250 = lbAdd [2101, "250m"];
  index_min_radius_100 = lbAdd [2101, "100m"];
  lbSetCurSel [2101, index_min_radius_250];

// AMOUNT ENEMY ZONES
index_amount_zones_15 = lbAdd [2102, localize "STR_DUWS_X_jooz8g8q"];
index_amount_zones_10 = lbAdd [2102, localize "STR_DUWS_X_8gqzfdui"];
index_amount_zones_9 = lbAdd [2102, "9"];
index_amount_zones_8 = lbAdd [2102, "8"];
index_amount_zones_7 = lbAdd [2102, "7"];
index_amount_zones_6 = lbAdd [2102, "6"];
index_amount_zones_5 = lbAdd [2102, "5"];
index_amount_zones_4 = lbAdd [2102, "4"];
index_amount_zones_3 = lbAdd [2102, "3"];
index_amount_zones_2 = lbAdd [2102, "2"];
index_amount_zones_1 = lbAdd [2102, "1"];
lbSetCurSel [2102, index_amount_zones_4];

// MAX DISTANCE FROM HQ
index_max_dist_hq_20 = lbAdd [2103, "2.0 km"];
index_max_dist_hq_25 = lbAdd [2103, "2.5 km"];
index_max_dist_hq_30 = lbAdd [2103, localize "STR_DUWS_X_blqblz86"];
index_max_dist_hq_40 = lbAdd [2103, "4.0 km"];
index_max_dist_hq_50 = lbAdd [2103, "5.0 km"];
index_max_dist_hq_60 = lbAdd [2103, "6.0 km"];
index_max_dist_hq_75 = lbAdd [2103, "7.5 km"];
index_max_dist_hq_100 = lbAdd [2103, "10 km"];
index_max_dist_hq_125 = lbAdd [2103, "12.5 km"];
index_max_dist_hq_150 = lbAdd [2103, "15 km"];
index_max_dist_hq_175 = lbAdd [2103, "17.5 km"];
index_max_dist_hq_200 = lbAdd [2103, "20 km"];
lbSetCurSel [2103, index_max_dist_hq_60];

// MORE URBAN
index_more_urban_yes = lbAdd [2105, localize "STR_DUWS_X_vk37aebo"];
index_more_urban_no = lbAdd [2105, localize "STR_DUWS_X_x4zs3lsg"];
lbSetCurSel [2105, index_more_urban_yes];

// STARTING CP AVAILABLE
index_amount_cp_10 = lbAdd [2104, localize "STR_DUWS_X_xsni194e"];
index_amount_cp_25 = lbAdd [2104, "25"];
index_amount_cp_50 = lbAdd [2104, localize "STR_DUWS_X_rnxjzjos"];
index_amount_cp_100 = lbAdd [2104, "100"];
index_amount_cp_200 = lbAdd [2104, localize "STR_DUWS_X_9pfd6w8o"];
index_amount_cp_400 = lbAdd [2104, "400"];
index_amount_cp_600 = lbAdd [2104, "600"];
index_amount_cp_max = lbAdd [2104, localize "STR_DUWS_X_pwv2bie1"];
lbSetCurSel [2104, index_amount_cp_50];

// CP Reward Multiplier
index_cp_reward_multiplier_half = lbAdd [2106, "0.5"];
index_cp_reward_multiplier_one = lbAdd [2106, "1"];
index_cp_reward_multiplier_two = lbAdd [2106, "2"];
index_cp_reward_multiplier_five = lbAdd [2106, "5"];
lbSetCurSel [2106, index_cp_reward_multiplier_one];

//CP Death Penalty
index_cp_death_penalty_zero = lbAdd [2107, "0"];
index_cp_death_penalty_one = lbAdd [2107, "1"];
index_cp_death_penalty_two = lbAdd [2107, "2"];
index_cp_death_penalty_three = lbAdd [2107, "3"];
index_cp_death_penalty_four = lbAdd [2107, "4"];
index_cp_death_penalty_five = lbAdd [2107, "5"];
index_cp_death_penalty_six = lbAdd [2107, "6"];
index_cp_death_penalty_seven = lbAdd [2107, "7"];
index_cp_death_penalty_eight = lbAdd [2107, "8"];
index_cp_death_penalty_nine = lbAdd [2107, "9"];
index_cp_death_penalty_ten = lbAdd [2107, "10"];
lbSetCurSel [2107, index_cp_death_penalty_zero];

// BLUFOR AP
index_blufor_ap_0 = lbAdd [2108, "0"];
index_blufor_ap_10 = lbAdd [2108, "10"];
index_blufor_ap_50 = lbAdd [2108, "50"];
index_blufor_ap_80 = lbAdd [2108, "80"];
index_blufor_ap_110 = lbAdd [2108, localize "STR_DUWS_X_57jjx7d6"];
index_blufor_ap_150 = lbAdd [2108, "150"];
index_blufor_ap_200 = lbAdd [2108, localize "STR_DUWS_X_rf9c6kt2"];
lbSetCurSel [2108, index_blufor_ap_50];

// OPFOR AP
index_opfor_ap_0 = lbAdd [2109, "0"];
index_opfor_ap_10 = lbAdd [2109, "10"];
index_opfor_ap_50 = lbAdd [2109, "50"];
index_opfor_ap_80 = lbAdd [2109, "80"];
index_opfor_ap_110 = lbAdd [2109, localize "STR_DUWS_X_57jjx7d6"];
index_opfor_ap_170 = lbAdd [2109, "170"];
index_opfor_ap_200 = lbAdd [2109, localize "STR_DUWS_X_rf9c6kt2"];
lbSetCurSel [2109, index_opfor_ap_50];

// AI BLU SKILL
index_blu_skill_elite = lbAdd [2110, localize "STR_DUWS_X_7ovwb13n"];
index_blu_skill_commando = lbAdd [2110, localize "STR_DUWS_X_i9ql9ndj"];
index_blu_skill_veteran = lbAdd [2110, localize "STR_DUWS_X_7szkelef"];
index_blu_skill_trained = lbAdd [2110, localize "STR_DUWS_X_njgzfxj4"];
index_blu_skill_rookie = lbAdd [2110, localize "STR_DUWS_X_hjz2qz8j"];
lbSetCurSel [2110, index_blu_skill_elite];

// AI OPF SKILL
index_op_skill_elite = lbAdd [2111, localize "STR_DUWS_X_7ovwb13n"];
index_op_skill_commando = lbAdd [2111, localize "STR_DUWS_X_i9ql9ndj"];
index_op_skill_veteran = lbAdd [2111, localize "STR_DUWS_X_7szkelef"];
index_op_skill_trained = lbAdd [2111, localize "STR_DUWS_X_njgzfxj4"];
index_op_skill_rookie = lbAdd [2111, localize "STR_DUWS_X_hjz2qz8j"];
lbSetCurSel [2111, index_op_skill_veteran];

// OPFOR Air/Tank Assets
index_opfor_AT_yes_yes = lbAdd [2112, localize "STR_DUWS_X_dge86ern"];
index_opfor_AT_yes_no = lbAdd [2112, localize "STR_DUWS_X_z4j9n0qo"];
index_opfor_AT_no_yes = lbAdd [2112, localize "STR_DUWS_X_reguyhhi"];
index_opfor_AT_no_no = lbAdd [2112, localize "STR_DUWS_X_ps661jx6"];
lbSetCurSel [2112, index_opfor_AT_yes_yes];


// ENEMY MULTIPLIER
index_enemyunit_multiplier_1 = lbAdd [2113, "*1"];
index_enemyunit_multiplier_2 = lbAdd [2113, "*2"];
index_enemyunit_multiplier_3 = lbAdd [2113, "*3"];
lbSetCurSel [2113, index_enemyunit_multiplier_1];



