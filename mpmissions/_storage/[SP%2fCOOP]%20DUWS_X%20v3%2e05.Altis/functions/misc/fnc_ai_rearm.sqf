
private _result = [localize "STR_DUWS_X_ij1nh3gu", localize "STR_DUWS_X_d7eqef75", true, true] call BIS_fnc_guiMessage;
if (_result) then {
	{
		if !(isplayer _x) then {
			_x setdammage 0;
			// try to set loadout from save
			_saved = [_x, [missionNamespace, format["%1_loadout",_x]]] call BIS_fnc_loadInventory;
			// else set to default
			if (isNil "_saved") then {
				_UnitLoadout = typeof _x;
				_x setUnitLoadout _UnitLoadout;
			};
		};
	} forEach units group player;
	
	player setdammage 0;
	hint localize "STR_DUWS_X_3y5r8lzq";
	sleep 2;
	[] spawn fnc_bottom_right_message;
};
