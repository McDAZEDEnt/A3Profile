
_hq = _this select 0;

// ONLY SQUAD LEADERS GET REQUEST & SQUAD MENUS

if ((vehiclevarname player) in Request_Players) then {
	_hq addaction [localize "STR_DUWS_X_vw32hahc",fnc_HQ_Request_Menu, "", 6, true, true, "", "_this == player"];
	_hq addaction [localize "STR_DUWS_X_l0xark5g",fnc_squad_manage, "", 0, true, true, "", "_this == player"];
	_hq addaction [localize "STR_DUWS_X_4jabuvz6",fnc_groupReset, "", 0, true, true, "", "_this == player"];
	_hq addaction [localize "STR_DUWS_X_gcidvhn3",fnc_AI_loadout_manager, "", 0, true, true, "", "_this == player"];
};

if ((vehiclevarname player) in game_master) then {
    _hq addaction [localize "STR_DUWS_X_9eiwr3bt",{[] remoteExec ["fnc_rest_heal",2]}];
};

_hq addaction [localize "STR_DUWS_X_iggpsdqo",fnc_FOBmanager, "", 0, true, true, "", "_this == player"];

if (isMultiplayer) then {

	if (support_armory_available) then {
		bluHQ_object addaction [localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal, [_this], 0, true, true, "", "_this == player"];
	};

	if (support_halo_available) then {
		bluHQ_object addaction [localize "STR_DUWS_X_foldimok", fnc_ghst_halo, [false,600,70], 0, true, true, "","alive player"];
		if ((vehiclevarname player) in Request_Players) then {
			bluHQ_object addaction [localize "STR_DUWS_X_u6btu73i", fnc_ghst_halo, [true,600,70], 0, true, true, "","alive player"];
		};	
	};

	"support_armory_available" addPublicVariableEventHandler {
		bluHQ_object addaction [localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal, [_this], 0, true, true, "", "_this == player"];
		{
			_x addaction [localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal, [_this], 0, true, true, "", "_this == player"];
		} forEach (Array_of_FOBS);
		lbSetColor [2103, 5, [0, 1, 0, 1]];
	};

	"support_halo_available" addPublicVariableEventHandler {
		bluHQ_object addaction [localize "STR_DUWS_X_foldimok", fnc_ghst_halo, [false,600,70], 0, true, true, "","alive player"];
		if ((vehiclevarname player) in Request_Players) then {
			bluHQ_object addaction [localize "STR_DUWS_X_u6btu73i", fnc_ghst_halo, [true,600,70], 0, true, true, "","alive player"];
		};	
		{
			_x addaction [localize "STR_DUWS_X_foldimok", fnc_ghst_halo, [false,600,70], 0, true, true, "","alive player"];
			if ((vehiclevarname player) in Request_Players) then {
				_x addaction [localize "STR_DUWS_X_u6btu73i", fnc_ghst_halo, [true,600,70], 0, true, true, "","alive player"];
			};	
		} forEach (Array_of_FOBS);

		lbSetColor [2103, 14, [0, 1, 0, 1]];
	};
};

waitUntil {sleep 600;!alive blu_officer_object};
removeAllActions _hq;