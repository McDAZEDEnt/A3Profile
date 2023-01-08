

_index2 = lbCurSel 2103;

switch (_index2) do {

	// SUPPLY DROP
    case 0: {
		_cost = 5;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_supplydrop_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _supplydrop = [player,"ammo"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_supply, [0, 1, 0, 1]];
                playSound "boots";
                support_supplydrop_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// ARSENAL
    case 1: {
		_cost = 10;
        if (commandpointsblu1 >= _cost) then {
            if (!support_armory_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                lbSetColor [2103, index_support_armory, [0, 1, 0, 1]];
                support_armory_available = true;
                bluHQ_object addaction [localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal, "", 0, true, true, "", "_this == player"];
                {
                    _x addaction [localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal, "", 0, true, true, "", "_this == player"];
                } forEach (Array_of_FOBS);

                playSound "loadgun";
                publicVariable "support_armory_available";
                ["armory",[localize "STR_DUWS_X_sg49vbhh",localize "STR_DUWS_X_h5t5vtfs"]] call bis_fnc_showNotification;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// VEHICLE DROP
    case 2: {
		if (VERSION_X == "WW2" || VERSION_X == "VIETNAM") exitWith {};
		_cost = 5;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_veh_drop_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _vehdrop = [player,"veh_drop"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_veh_supply, [0, 1, 0, 1]];
                playSound "boots";
                support_veh_drop_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// VEHICLE REFIT
    case 3: {
		_cost = 10;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_veh_refit_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _veh_refit = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_refit, [0, 1, 0, 1]];
                playSound "loadgun";
                support_veh_refit_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// HALO JUMP
    case 4: {
		_cost = 15;
        if (commandpointsblu1 >= _cost) then {
            if (!support_halo_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                lbSetColor [2103, 15, [0, 1, 0, 1]];
                support_halo_available = true;
				bluHQ_object addAction [localize "STR_DUWS_X_foldimok", fnc_ghst_halo, [false,600,70], 0, true, true, "","alive player"];
				bluHQ_object addAction [localize "STR_DUWS_X_u6btu73i", fnc_ghst_halo, [true,600,70], 0, true, true, "","alive player"];
                {
                    _x addAction [localize "STR_DUWS_X_foldimok", fnc_ghst_halo, [false,600,70], 0, true, true, "","alive player"];
                    _x addAction [localize "STR_DUWS_X_u6btu73i", fnc_ghst_halo, [true,600,70], 0, true, true, "","alive player"];
                } forEach (Array_of_FOBS);

                playSound "loadgun";
                publicVariable "support_halo_available";
                ["halo",[localize "STR_DUWS_X_0m2mxf4u",localize "STR_DUWS_X_adygxrb6"]] call bis_fnc_showNotification;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// UAV RECON
    case 5: {
		_cost = 10;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_uav_recon_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _uav_recon = [player,"uav_recon"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_uavrecon, [0, 1, 0, 1]];
                playSound "boots";
                support_uav_recon_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// HELO TAXI
    case 6: {
		if (VERSION_X == "WW2") exitWith {};
		_cost = 5;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then  {
            if (!support_helotaxi_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _helo = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_helotaxi, [0, 1, 0, 1]];
                playSound "boots";
                support_helotaxi_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// BOAT TAXI
    case 7: {
		_cost = 3;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_boattaxi_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                lbSetColor [2103, index_support_boattaxi, [0, 1, 0, 1]];
                support_boattaxi_available = true;
                _boattaxi = [player,"boat_taxi"] call BIS_fnc_addCommMenuItem;
                playSound "boots";
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// ARTILLERY
    case 8: {
		_cost = 15;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_arty_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _arty = [player,"artillery"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_arty, [0, 1, 0, 1]];
                playSound "boots";
                support_arty_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// MORTAR
    case 9: {
		_cost = 10;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_mortar_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _mortar = [player,"mortar"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_mortar, [0, 1, 0, 1]];
                playSound "boots";
                support_mortar_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// JDAM STRIKE
    case 10: {
		_cost = 15;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_jdam_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _jdam = [player,"jdam"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_jdam, [0, 1, 0, 1]];
                playSound "boots";
                support_jdam_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// LASER GUIDED BOMB
    case 11: {
		if (VERSION_X == "WW2" || VERSION_X == "VIETNAM") exitWith {};
		_cost = 15;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then  {
            if (!support_laser_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _laser = [player,"laser"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_laser, [0, 1, 0, 1]];
                playSound "boots";
                support_laser_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// CLUSTER STRIKE
    case 12: {
		if (VERSION_X == "WW2") exitWith {};
		_cost = 25;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then  {
            if (!support_cluster_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _cluster = [player,"cluster"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_cluster, [0, 1, 0, 1]];
                playSound "boots";
                support_cluster_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// NAPALM STRIKE
    case 13: {
		_cost = 20;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then  {
            if (!support_napalm_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _cluster = [player,"napalm"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_napalm, [0, 1, 0, 1]];
                playSound "boots";
                support_napalm_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// HC ATTACK CHOPPER
    case 14: {
		_cost = 20;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (!support_hcAttChop_available) then {
            if (commandpointsblu1 >= _cost) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _hcAttChop = [player,"hc_ATTchop"] call BIS_fnc_addCommMenuItem;
				hcAttChop = _hcAttChop;
                lbSetColor [2103, index_support_hcAttChop, [0, 1, 0, 1]];
				playSound "boots";
                support_hcAttChop_available = true;
            } else {
				hint localize "STR_DUWS_X_e95mc4lv";
            };
        } else {
            if (AttChopInUse) exitWith {hint localize "STR_DUWS_X_dvbox9ay"};
			commandpointsblu1 = commandpointsblu1 + (floor _cost/2);
			ctrlSetText [1000, format["%1",commandpointsblu1]];
			[player,hcAttChop] call BIS_fnc_removeCommMenuItem;
			lbSetColor [2103, index_support_hcAttChop, [1, 0, 0, 1]];
			playSound "boots";
			support_hcAttChop_available = false;
			hint localize "STR_DUWS_X_wdgpslhe";
        };
    };

	// HC CAS JET
    case 15: {
		_cost = 25;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (!support_hcCAS_available) then {
			if (commandpointsblu1 >= _cost) then {
				commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
				ctrlSetText [1000, format["%1",commandpointsblu1]];
                _hcCAS = [player,"hc_CAS"] call BIS_fnc_addCommMenuItem;
				hcCAS = _hcCAS;
                lbSetColor [2103, index_support_hcCAS, [0, 1, 0, 1]];
				playSound "boots";
                support_hcCAS_available = true;
            } else {
				hint localize "STR_DUWS_X_e95mc4lv";
            };
        } else {
            if (CASInUse) exitWith {hint localize "STR_DUWS_X_dvbox9ay"};
				commandpointsblu1 = commandpointsblu1 + (floor _cost/2);
				ctrlSetText [1000, format["%1",commandpointsblu1]];
				[player,hcCAS] call BIS_fnc_removeCommMenuItem;
				lbSetColor [2103, index_support_hcCAS, [1, 0, 0, 1]];
				playSound "boots";
				support_hcCAS_available = false;
				hint localize "STR_DUWS_X_wdgpslhe";
             };
    };

	// PARADROP
    case 16: {
		_cost = 20;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (!support_paradrop_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _supplydrop = [player,"paradrop"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_paradrop, [0, 1, 0, 1]];
                playSound "boots";
                support_paradrop_available = true;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// Mobile HQ
    case 17: {
		_cost = 30;
		// Check if Radio Support
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (commandpointsblu1 >= _cost) then {
            if (support_mobile_HQ_available) then {
                commandpointsblu1 = commandpointsblu1 - _cost;
                ctrlSetText [1000, format["%1",commandpointsblu1]];
                _mhq = [player,"mobile_HQ"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_mobile_HQ, [0, 1, 0, 1]];
                playSound "boots";
                support_mobile_HQ_available = false;
                publicVariable "support_mobile_HQ_available";
                ["info",[localize "STR_DUWS_X_ooi6w4yh",localize "STR_DUWS_X_cghsxhhu"]] call bis_fnc_showNotification;
            } else {
                hint localize "STR_DUWS_X_8c1i4vga";
            };
        } else {
            hint localize "STR_DUWS_X_e95mc4lv";
        };
    };

	// HC CAP JET - fighter
    case 18: {
		_cost = 25;
		if (support_count > 7) exitWith {["info",[localize "STR_DUWS_X_45a8q6tj",localize "STR_DUWS_X_iadwwap5"]] call bis_fnc_showNotification;};
        if (!support_hcCAP_available) then {
			if (commandpointsblu1 >= _cost) then {
				commandpointsblu1 = commandpointsblu1 - _cost;
				support_count = support_count + 1;
				ctrlSetText [1000, format["%1",commandpointsblu1]];
                _hcCAP = [player,"hc_CAP"] call BIS_fnc_addCommMenuItem;
				hcCAS = _hcCAP;
                lbSetColor [2103, 16, [0, 1, 0, 1]];
				playSound "boots";
                support_hcCAP_available = true;
            } else {
				hint localize "STR_DUWS_X_e95mc4lv";
            };
        } else {
            if (CAPInUse) exitWith {hint localize "STR_DUWS_X_dvbox9ay"};
				commandpointsblu1 = commandpointsblu1 + (floor _cost/2);
				ctrlSetText [1000, format["%1",commandpointsblu1]];
				[player,hcCAS] call BIS_fnc_removeCommMenuItem;
				lbSetColor [2103, 16, [1, 0, 0, 1]];
				playSound "boots";
				support_hcCAP_available = false;
				hint localize "STR_DUWS_X_wdgpslhe";
             };
    };

};

//hint format["index: %1",_index2];
publicVariable "commandpointsblu1";

