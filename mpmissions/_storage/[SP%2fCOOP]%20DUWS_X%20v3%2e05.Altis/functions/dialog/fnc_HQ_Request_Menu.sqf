// case #

_handle = createDialog "ressourceheader";
waitUntil {dialog};
ctrlSetText [1000, format["%1",commandpointsblu1]];
ctrlSetText [1001, format["%1",zoneundercontrolblu]];
ctrlSetText [1002, format["%1",WARCOM_blufor_ap]];

// REQUEST UNITS - 14 MAX
_index = lbAdd [2100, localize "STR_DUWS_X_zo6ih0pt"];      // 0
_index = lbAdd [2100, ""];                              	// 1

_var_count = 1;
while {true} do {
	_unitArray = [];
	_var = "";
	if (_var_count > 99) exitWith {};
	if (_var_count > 9) then {
		_var = "blufor_RQST_UNIT_" + str _var_count + "_X"; // Parse the name of the variable as a string
	} else {
		_var = "blufor_RQST_UNIT_0" + str _var_count + "_X"; // Parse the name of the variable as a string
	};
	if (isNil _var) exitWith {}; // Get the vehicle variable
	_unitArray = call (compile _var);
	if (_unitArray select 0 == "empty" || _unitArray select 2 == 0) exitWith {}; 
	_displayName = [configFile >> "CfgVehicles" >> (_unitArray select 0)] call BIS_fnc_displayName;
	_index = lbAdd [2100, _displayName  + " (" + str (_unitArray select 2) + "cp)"];
	_var_count = _var_count + 1;
};
lbSetCurSel [2100, 0];

// REQUEST SQUADS
switch (VERSION_X) do {
	case "MODERN": {  // - 10 Squads MAX
		_index0 = lbAdd [2101, localize "STR_DUWS_X_zo6ih0pt"];     		// 0
		_index0 = lbAdd [2101, ""];                  						// 1
		_index0 = lbAdd [2101, "HC " + (blufor_RECON_TEAM_X select 1)];		// 2
		_index0 = lbAdd [2101, "HC " + (blufor_INF_SQUAD_X select 1)];		// 3
		_index0 = lbAdd [2101, "HC " + (blufor_MOTOR_SECTION_X select 1)];	// 4
		_index0 = lbAdd [2101, "HC " + (blufor_MECH_SECTION_X select 1)];	// 5
		_index0 = lbAdd [2101, "HC " + (blufor_ARMOR_SECTION_X select 1)];	// 6
		_index0 = lbAdd [2101, ""];                  						// 7
		_index0 = lbAdd [2101, "TF " + (blufor_RECON_TEAM_X select 1)];		// 8
		_index0 = lbAdd [2101, "TF " + (blufor_INF_SQUAD_X select 1)];		// 9
		_index0 = lbAdd [2101, "TF " + (blufor_MOTOR_SECTION_X select 1)];	// 10
		_index0 = lbAdd [2101, "TF " + (blufor_MECH_SECTION_X select 1)];	// 11
		_index0 = lbAdd [2101, "TF " + (blufor_ARMOR_SECTION_X select 1)];	// 12
	};
	case "WW2": {  //  - 14 Squads MAX
		_index0 = lbAdd [2101, localize "STR_DUWS_X_zo6ih0pt"];     		// 0
		_index0 = lbAdd [2101, ""];                  						// 1
		_index0 = lbAdd [2101, "HC " + (blufor_RECON_TEAM_X select 1)];		// 2
		_index0 = lbAdd [2101, "HC " + (blufor_INF_SQUAD_X select 1)];		// 3
		_index0 = lbAdd [2101, "HC " + (blufor_MOTOR_SECTION_X select 1)];	// 4
		_index0 = lbAdd [2101, "HC " + (blufor_MECH_SECTION_X select 1)];	// 5
		_index0 = lbAdd [2101, "HC " + (blufor_ARMOR_SECTION_X select 1)];	// 6
		_index0 = lbAdd [2101, "HC " + (blufor_ARMOR_SECTION1_X select 1)];	// 7
		_index0 = lbAdd [2101, "HC " + (blufor_HEAVY_TANK_SECTION_X select 1)];		// 8
		_index0 = lbAdd [2101, ""];                  						// 9
		_index0 = lbAdd [2101, "TF " + (blufor_RECON_TEAM_X select 1)];		// 10
		_index0 = lbAdd [2101, "TF " + (blufor_INF_SQUAD_X select 1)];		// 11
		_index0 = lbAdd [2101, "TF " + (blufor_MOTOR_SECTION_X select 1)];	// 12
		_index0 = lbAdd [2101, "TF " + (blufor_MECH_SECTION_X select 1)];	// 13
		_index0 = lbAdd [2101, "TF " + (blufor_ARMOR_SECTION_X select 1)];	// 14
		_index0 = lbAdd [2101, "TF " + (blufor_ARMOR_SECTION1_X select 1)];	// 15
		_index0 = lbAdd [2101, "TF " + (blufor_HEAVY_TANK_SECTION_X select 1)];		// 16
	};
	case "VIETNAM": {  //  - 16 Squads MAX
		_index0 = lbAdd [2101, localize "STR_DUWS_X_zo6ih0pt"];     		// 0
		_index0 = lbAdd [2101, ""];                  						// 1
		_index0 = lbAdd [2101, "HC " + (blufor_RECON_TEAM_X select 1)];		// 2
		_index0 = lbAdd [2101, "HC " + (blufor_INF_SQUAD_X select 1)];		// 3
		_index0 = lbAdd [2101, "HC " + (blufor_SPEC_SQUAD_X select 1)];		// 4
		_index0 = lbAdd [2101, "HC " + (blufor_MOTOR_SECTION_X select 1)];	// 5
		_index0 = lbAdd [2101, "HC " + (blufor_MECH_SECTION_X select 1)];	// 6
		_index0 = lbAdd [2101, "HC " + (blufor_ARMOR_SECTION_X select 1)];	// 7
		_index0 = lbAdd [2101, "HC " + (blufor_AA_TANK_SECTION_X select 1)];		// 8
		_index0 = lbAdd [2101, "HC " + (blufor_HEAVY_TANK_SECTION_X select 1)];		// 9
		_index0 = lbAdd [2101, ""];                  						// 10
		_index0 = lbAdd [2101, "TF " + (blufor_RECON_TEAM_X select 1)];		// 11
		_index0 = lbAdd [2101, "TF " + (blufor_INF_SQUAD_X select 1)];		// 12
		_index0 = lbAdd [2101, "TF " + (blufor_SPEC_SQUAD_X select 1)];		// 13
		_index0 = lbAdd [2101, "TF " + (blufor_MOTOR_SECTION_X select 1)];	// 14
		_index0 = lbAdd [2101, "TF " + (blufor_MECH_SECTION_X select 1)];	// 15
		_index0 = lbAdd [2101, "TF " + (blufor_ARMOR_SECTION_X select 1)];	// 16
		_index0 = lbAdd [2101, "TF " + (blufor_AA_TANK_SECTION_X select 1)];		// 17
		_index0 = lbAdd [2101, "TF " + (blufor_HEAVY_TANK_SECTION_X select 1)];		// 18
	};
};
	
lbSetCurSel [2101, 0];

// REQUEST VEHICLES-STATICS - 50 MAX
_index1 = lbAdd [2102, localize "STR_DUWS_X_zo6ih0pt"]; 	// 0
_index1 = lbAdd [2102, ""];              					// 1

_var_count = 1;
while {true} do {
	_vehArray = "";
	_var = "";
	if (_var_count > 99) exitWith {};
	if (_var_count > 9) then {
		_var = "blufor_RQST_VEHICLE_" + str _var_count + "_X"; // Parse the name of the variable as a string
	} else {
		_var = "blufor_RQST_VEHICLE_0" + str _var_count + "_X"; // Parse the name of the variable as a string
	};
	if (isNil _var) exitWith {}; 
	_vehArray = call (compile _var);
	if (_vehArray select 0 == "empty" || _vehArray select 2 == 0) exitWith {}; 
	_displayName = [configFile >> "CfgVehicles" >> (_vehArray select 0)] call BIS_fnc_displayName;
	_index = lbAdd [2102, _displayName  + " (" + str (_vehArray select 2) + "cp)"];
	_var_count = _var_count + 1;
};

lbSetCurSel [2102, 0];

// Supports  
// Some supports are not available for WW2 or Vietnam

index_support_supply = lbAdd [2103, localize "STR_DUWS_X_5n277nzo"];                 // 0
index_support_armory = lbAdd [2103, localize "STR_DUWS_X_kw2lnaig"];                      // 1

switch (VERSION_X) do {
	case "MODERN": {
		index_support_veh_supply = lbAdd [2103, localize "STR_DUWS_X_oq3q7yrq"];   // 2
	};
	case "WW2": {
		index_support_veh_supply = lbAdd [2103, ""];      											// 2
	};
	case "VIETNAM": {
		index_support_veh_supply = lbAdd [2103, ""];   												// 2
	};
};

index_support_refit = lbAdd [2103, localize "STR_DUWS_X_0aswdrax"];                    // 3
index_support_halo = lbAdd [2103, localize "STR_DUWS_X_xghf3qqd"];				          	 // 4

switch (VERSION_X) do {
	case "MODERN": {
		index_support_uavrecon = lbAdd [2103, localize "STR_DUWS_X_892wo8h0"];         // 5
	};
	case "WW2": {
		index_support_uavrecon = lbAdd [2103, localize "STR_DUWS_X_37e388r7"];         // 5
	};
	case "VIETNAM": {
		index_support_uavrecon = lbAdd [2103, localize "STR_DUWS_X_37e388r7"];         // 5
	};
};	
switch (VERSION_X) do {
	case "MODERN": {
		index_support_helotaxi = lbAdd [2103, localize "STR_DUWS_X_witoiij3"];       // 6
	};
	case "WW2": {
		index_support_helotaxi = lbAdd [2103, ""];               					// 6
	};
	case "VIETNAM": {
		index_support_helotaxi = lbAdd [2103, localize "STR_DUWS_X_witoiij3"];       // 6
	};
};

index_support_boattaxi = lbAdd [2103, localize "STR_DUWS_X_3wiovyga"];               // 7
index_support_arty = lbAdd [2103, localize "STR_DUWS_X_btiiyafy"];                  // 8
index_support_mortar = lbAdd [2103, localize "STR_DUWS_X_xca5aaxu"];                // 9

switch (VERSION_X) do {
	case "MODERN": {
		index_support_jdam = lbAdd [2103, localize "STR_DUWS_X_mbhh2q2e"];           // 10
	};
	case "WW2": {
		index_support_jdam = lbAdd [2103, localize "STR_DUWS_X_2vd6lsvm"];           // 10
	};
	case "VIETNAM": {
		index_support_jdam = lbAdd [2103, localize "STR_DUWS_X_2vd6lsvm"];          // 10
	};
};	
switch (VERSION_X) do {
	case "MODERN": {
		index_support_laser = lbAdd [2103, localize "STR_DUWS_X_xja6gemx"];		  	// 11
	};
	case "WW2": {
		index_support_laser = lbAdd [2103, ""];		          											// 11
	};
	case "VIETNAM": {
		index_support_laser = lbAdd [2103, ""];		          											// 11
	};
};
switch (VERSION_X) do {
	case "MODERN": {
		index_support_cluster = lbAdd [2103, localize "STR_DUWS_X_d5qzh6mj"];    		// 12
	};
	case "WW2": {
		index_support_cluster = lbAdd [2103, ""];         							 	// 12
	};
	case "VIETNAM": {
		index_support_cluster = lbAdd [2103, localize "STR_DUWS_X_d5qzh6mj"];    		// 12
	};
};

index_support_napalm = lbAdd [2103, localize "STR_DUWS_X_owven8ki"];       			// 13

switch (VERSION_X) do {
	case "MODERN": {
		index_support_hcAttChop = lbAdd [2103, localize "STR_DUWS_X_t4jo046q"];   	// 14
	};
	case "WW2": {
		index_support_hcAttChop = lbAdd [2103, localize "STR_DUWS_X_z7o7t4hd"];    	// 14
	};
	case "VIETNAM": {
		index_support_hcAttChop = lbAdd [2103, localize "STR_DUWS_X_t4jo046q"];  		// 14
	};
};
switch (VERSION_X) do {
	case "MODERN": {
		index_support_hcCAS = lbAdd [2103, localize "STR_DUWS_X_6khosjp7"];        	// 15
	};
	case "WW2": {
		index_support_hcCAS = lbAdd [2103, localize "STR_DUWS_X_r73lk2kv"];         	// 15
	};
	case "VIETNAM": {
		index_support_hcCAS = lbAdd [2103, localize "STR_DUWS_X_6khosjp7"];        	// 15
	};
};

index_support_paradrop = lbAdd [2103, localize "STR_DUWS_X_9hmlads9"];              	// 16
index_mobile_HQ = lbAdd [2103, localize "STR_DUWS_X_b7gmddq3"];               		// 17
switch (VERSION_X) do {
	case "VIETNAM": {
		index_support_hcCAP = lbAdd [2103, localize "STR_DUWS_X_zfwwi081"];        	// 18
	};
};

////////////////////////////////////////////

// Change menu colors
//  lbSetCurSel [2103, 0];
if (support_supplydrop_available) then {
    lbSetColor [2103, 0, [0, 1, 0, 1]];
};
if (support_armory_available) then {
    lbSetColor [2103, 1, [0, 1, 0, 1]];
};
if (support_veh_drop_available) then {
    lbSetColor [2103, 2, [0, 1, 0, 1]];
};
if (support_veh_refit_available) then {
    lbSetColor [2103, 3, [0, 1, 0, 1]];
};
if (support_halo_available) then {
	lbSetColor [2103, 4, [0, 1, 0, 1]];
};
if (support_uav_recon_available) then {
    lbSetColor [2103, 5, [0, 1, 0, 1]];
};
if (support_helotaxi_available) then {
    lbSetColor [2103, 6, [0, 1, 0, 1]];
};
if (support_boattaxi_available) then {
    lbSetColor [2103, 7, [0, 1, 0, 1]];
};
if (support_arty_available) then {
    lbSetColor [2103, 8, [0, 1, 0, 1]];
};
if (support_mortar_available) then {
    lbSetColor [2103, 9, [0, 1, 0, 1]];
};
if (support_jdam_available) then {
    lbSetColor [2103, 10, [0, 1, 0, 1]];
};
if (support_laser_available) then {
    lbSetColor [2103, 11, [0, 1, 0, 1]];
};
if (support_cluster_available) then {
    lbSetColor [2103, 12, [0, 1, 0, 1]];
};
if (support_napalm_available) then {
    lbSetColor [2103, 13, [0, 1, 0, 1]];
};
if (support_hcAttChop_available) then {
	lbSetColor [2103, 14, [0, 1, 0, 1]];
};
if (support_hcCAS_available) then {
	lbSetColor [2103, 15, [0, 1, 0, 1]];
};
if (support_paradrop_available) then {
    lbSetColor [2103, 16, [0, 1, 0, 1]];
};
if (!support_mobile_HQ_available) then {
    lbSetColor [2103, 17, [0, 1, 0, 1]];
};
if (support_hcCAP_available) then {
	lbSetColor [2103, 18, [0, 1, 0, 1]];	
};

