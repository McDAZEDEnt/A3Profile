
_fob = _this select 0;
_fob_owner = _this select 1;
	
if ((vehiclevarname player) in Request_Players) then {
	_fob addaction [localize "STR_DUWS_X_vw32hahc",fnc_FOB_Request_Menu, "", 6, true, true, "", "_this == player"];
	_fob addaction [localize "STR_DUWS_X_l0xark5g",fnc_squad_manage, "", 0, true, true, "", "_this == player"];
	_fob addaction [localize "STR_DUWS_X_gcidvhn3",fnc_AI_loadout_manager, "", 0, true, true, "", "_this == player"];
};
	
_fob addaction [localize "STR_DUWS_X_iggpsdqo",fnc_FOBmanager, "", 0, true, true, "", "_this == player"];
	
if (support_armory_available) then {
    _fob addaction [localize "STR_DUWS_X_160jkc3a",fnc_duws_Arsenal, "", 0, true, true, "", "_this == player"];
};

if (support_halo_available) then {
	_fob addAction [localize "STR_DUWS_X_foldimok", fnc_ghst_halo, [false,600,70], 0, true, true, "","_this == player"];
	if ((vehiclevarname player) in Request_Players) then {
		_fob addAction [localize "STR_DUWS_X_u6btu73i", fnc_ghst_halo, [true,600,70], 0, true, true, "","_this == player"];
	};	
};

if ((vehiclevarname player) in game_master) then {
    _fob addaction [localize "STR_DUWS_X_9eiwr3bt",{[] remoteExec ["fnc_rest_heal",2]}];
};

waitUntil {sleep 600;!alive blu_officer_object};
removeAllActions _fob;