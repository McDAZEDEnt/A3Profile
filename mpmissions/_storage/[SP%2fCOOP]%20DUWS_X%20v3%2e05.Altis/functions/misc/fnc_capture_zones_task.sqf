// CREATE MAIN TASK/OBJECTIVE
while {true} do {
		
	sleep 60;
	if (DUWS_MODE != "DOMINATION") then {
		[west, [localize "STR_DUWS_X_347ohzwn"], 
		[localize "STR_DUWS_X_92465yls", localize "STR_DUWS_X_q5xntd8z", localize "STR_DUWS_X_q5xntd8z"], objNull, true] call BIS_fnc_taskCreate; 
//	} else {
//		[west, ["Domination"], 
//		["Perpetual War.  Capture Zones, Rinse, Repeat. The enemy is controlling some critical zones in the area, we must take them back! Capture every zone under enemy control and the mission will reset and create the next set of zones.<br />You can help BLUFOR take the zones and/or accomplish side missions to increase BLUFOR resources.  As the campaign progresses, the war will escalate and the armies will get stronger and start to use bigger assets. <br />To capture a zone, you need to have a stronger presence in the zone than the enemy.<br /><br />It's up to you on how you want to play this.<br />Good luck, soldier!", localize "STR_DUWS_X_q5xntd8z", localize "STR_DUWS_X_q5xntd8z"], objNull, true] call BIS_fnc_taskCreate; 
	};
	
	// WAIT UNTIL ALL ZONES ARE CAPTURED
	waitUntil {sleep 10; WARCOM_init_done};
	waitUntil {sleep 30; zoneundercontrolblu >= amount_zones_created}; // Toutes les zones sont capturées

	if (DUWS_MODE != "DOMINATION") then {
		if (amount_zones_created > 4) then {
			["info",[localize "STR_DUWS_X_fo1ihi1n",localize "STR_DUWS_X_h6xmg512"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
			[localize "STR_DUWS_X_fo1ihi1n" + localize "STR_DUWS_X_h6xmg512",{hint _this}] remoteExec ["BIS_fnc_Spawn",  [0,-2] select isDedicated,false];
			[localize "STR_DUWS_X_fo1ihi1n" + localize "STR_DUWS_X_h6xmg512"] spawn fnc_sideChat_filter;
		} else {
			["info",[localize "STR_DUWS_X_fo1ihi1n", localize "STR_DUWS_X_6tjd7a6q"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
			[localize "STR_DUWS_X_fo1ihi1n" + localize "STR_DUWS_X_6tjd7a6q",{hint _this}] remoteExec ["BIS_fnc_Spawn",  [0,-2] select isDedicated,false];
			[localize "STR_DUWS_X_fo1ihi1n" + localize "STR_DUWS_X_6tjd7a6q"] spawn fnc_sideChat_filter;
		};
		// Add the 'End or Extend' Action to the HQ Officer
		[] remoteExec ["fnc_HQ_endCampaign", [0,-2] select isDedicated,true];

		waitUntil {sleep 1;DUWS_MODE == "FINISH" || DUWS_MODE == "DOMINATION"};
	};
		
	if (DUWS_MODE == "FINISH") exitWith {
		["Campaign", "SUCCEEDED"] remoteExec ["BIS_fnc_taskSetState", 0];
		sleep 20;
		"island_captured_win" call BIS_fnc_endMissionServer;
	};
	if (DUWS_MODE == "DOMINATION") then {
		sleep 5;
		["info",[localize "STR_DUWS_X_i44ddgrq",localize "STR_DUWS_X_dlzkc4c2"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
		[localize "STR_DUWS_X_i44ddgrq" + localize "STR_DUWS_X_dlzkc4c2"] spawn fnc_sideChat_filter;
		[localize "STR_DUWS_X_i44ddgrq" + localize "STR_DUWS_X_6p70rgp4",{hint _this}] remoteExec ["BIS_fnc_Spawn",  [0,-2] select isDedicated,false];
		// remove triggers
		// RECALL VARNAMES FOR ZONE TRIGGERS and NOTIFICATION TRIGGERS --> use the pos of the trigger
		{
			private "_trg";
			call compile format["_trg = trigger%1%2",round (_x select 0),round (_x select 1)];
			deleteVehicle _trg;
			private "_trg2";
			call compile format["_trg2 = trigger2%1%2",round (_x select 0),round (_x select 1)];
			deleteVehicle _trg2;
		} forEach serv_zones_array;
	
		serv_zones_array_temp = serv_zones_array;publicVariable "serv_zones_array_temp";
		// CLEANUP OBJECTS AFTER 20 min
		{
			_zonePos = _x;
			[_zonePos] spawn {  
				params ["_zonePos"];
				_markername = format["prevZone%1",str (_zonePos)]; // Define marker name
				_markerstr = createMarker [str(_markername), _zonePos];
				_markerstr setMarkerShape "ICON";
				str(_markername) setMarkerType "hd_objective";
				str(_markername) setMarkerSize [.6,.6];
				str(_markername) setMarkerColor "ColorRED";

				_radius = 50;
				sleep 1200;  // 20 min
				_zoneObj = nearestObjects [_zonePos, [], _radius];
				{deleteVehicle _x;}foreach _zoneObj;

				deleteMarker str(_markername);
			};
		} forEach serv_zones_array_temp;

		sleep 120;
		["info",[localize "STR_DUWS_X_i44ddgrq",localize "STR_DUWS_X_gur3301v"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
		[localize "STR_DUWS_X_i44ddgrq" + localize "STR_DUWS_X_gur3301v"] spawn fnc_sideChat_filter;
	
		// remove markers
		{
			_markername = format["%1%2",round(_x select 0),round(_x select 1)]; // Define marker name
			_markername2 = format["%1%2ellipse",round(_x select 0),round(_x select 1)]; // Define marker name

			deleteMarker str(_markername2);
			deleteMarker str(_markername);
		} forEach serv_zones_array;

		// Delete all Opfor units not near players
		{
			if (side _x == EAST) then {
				_eastUnit = _x;
				_engaged = false;
				{
					if ((_eastUnit knowsAbout _x) > 0) then {
						_engaged = true;
					};
				} forEach PlayableUnits;

				if (_engaged == false) then {
					deleteVehicle _eastUnit;
				};
			};		
		} foreach allUnits;

		sleep 120;

		zones_created = false;publicVariable "zones_created";
		amount_zones_created = 0;publicVariable "amount_zones_created";
		amount_zones_captured = 0;publicVariable "amount_zones_captured";
		Array_of_OPFOR_zones = [];publicVariable "Array_of_OPFOR_zones";
		serv_zones_array = [];publicVariable "serv_zones_array";
		WARCOM_init_done = false;publicVariable "WARCOM_init_done";
		WARCOM_zones_controled_by_BLUFOR = [];publicVariable "WARCOM_zones_controled_by_BLUFOR";
		WARCOM_zones_controled_by_OPFOR = [];publicVariable "WARCOM_zones_controled_by_OPFOR";
		zone_namePOS_pairs = [];publicVariable "zone_namePOS_pairs";
		zoneundercontrolblu = 0;publicVariable "zoneundercontrolblu";
		zone_spawn_array = [];

		// RESTART WARCOM FOR DOMINATION
		if (isServer) then { [] spawn fnc_init_OPFOR_WARCOM };
	};

};