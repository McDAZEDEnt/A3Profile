
diag_log format ["Placement BLUFOR Faction: %1", BLUFOR_Faction_X];
diag_log format ["Placement OPFOR Faction: %1", OPFOR_Faction_X];

player_is_choosing_hqpos = true;
publicVariable "player_is_choosing_hqpos";
hq_manually_placed = true;
publicVariable "hq_manually_placed";

clicked = false;

forceMap true;
mapAnimAdd [3, 1, [5000,5000]];
mapAnimCommit;
sleep 3;
openMap [true, false]; 
//forceMap false;
hint localize "STR_DUWS_X_ahq99ew0";
OnMapSingleClick "ClickedPos = _pos; clicked = true;";

while {true} do {
    if (clicked) then { // player has clicked the map

        _foundPickupPos = [ClickedPos, 0,20,15,0,0.15,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

		_nearRoad = [_foundPickupPos,20] call BIS_fnc_nearestRoad;

        if ((!isNull _nearRoad) || (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1)) then {  

			// INVALID POS
			clicked = false;
            hint localize "STR_DUWS_X_2pcapkjo";
			
        } else {  
		
			// VALID POS
            clicked = false;
			onMapSingleClick "";
            hint localize "STR_DUWS_X_ml7p89yd";
 			PosOfBLUHQ = _foundPickupPOS;
			publicVariable "PosOfBLUHQ";

			// create temp marker on HQ
			_markername = "foo";
			_markerstr = createMarker [str(_markername), PosOfBLUHQ];
			_markerstr setMarkerShape "ICON";
			str(_markername) setMarkerType "mil_flag";
			str(_markername) setMarkerColor "ColorBlue";

			sleep 2;

			// wait for AO direction or "ESC"
			forceMap false;
			hint parseText localize "STR_DUWS_X_k9kxtm85";
			OnMapSingleClick "ClickedPos2 = _pos; clicked = true;";
            waituntil {sleep 0.1;clicked or !(visiblemap)};
			if (clicked) then {
				AO_direction = ClickedPos2;
				publicVariable "AO_direction";
				// create temp marker on HQ
				_markername2 = "foo2";
				_markerstr2 = createMarker [str(_markername2), AO_direction];
				_markerstr2 setMarkerShape "ICON";
				str(_markername2) setMarkerType "mil_flag";
				str(_markername2) setMarkerColor "ColorRed";
				sleep 2;
				deletemarker str(_markername2);
			};	
			deletemarker str(_markername);
			hint "";
			openMap [false, false];
			titleCut ["", "BLACK FADED", 999];
			chosen_hq_placement = true;
			publicVariable "chosen_hq_placement";
		};
    };

    sleep 1;
    if (chosen_hq_placement) exitwith {sleep 3};
};



