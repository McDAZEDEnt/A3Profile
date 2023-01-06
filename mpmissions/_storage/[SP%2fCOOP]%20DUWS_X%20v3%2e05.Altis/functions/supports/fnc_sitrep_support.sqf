

if (commandpointsblu1 >= 1) exitWith  
{
	commandpointsblu1 = commandpointsblu1 - 1;
	publicVariable "commandpointsblu1";

	if (isServer) then {
		private _result = [localize "STR_DUWS_X_ylnwrgad", localize "STR_DUWS_X_5xcfatn0", true, true] call BIS_fnc_guiMessage;
		if (_result) then {
			[] call fnc_autoSave;
			sleep 0.5;
			["sitrepinfo",[localize "STR_DUWS_X_qkkva9tk",localize "STR_DUWS_X_biham0s3"]] call bis_fnc_showNotification;
			sleep 5;
		};	
	};

	// Show the SITREP data
	[format[localize "STR_DUWS_X_10dzingj",commandpointsblu1,WARCOM_blufor_ap,WARCOM_opfor_ap]] spawn fnc_sideChat_filter;
	
	[] spawn fnc_sitrep_display;
	
	[] spawn fnc_bottom_right_message;
};

["sitrepinfo",[localize "STR_DUWS_X_qkkva9tk",format[localize "STR_DUWS_X_p6sb3ply",1]]] call bis_fnc_showNotification;
	
	
	
	