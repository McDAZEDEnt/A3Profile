
// VEHICLE REFIT STATION WILL RUN ON THE SERVER

_position = _this select 0;
_cost = _this select 1;

_availPOS = [];
_availPOS = Array_of_FOBS + [PosOfBLUHQ];
_no_availPOS=true;

{
	if (_position distance _x < 100) exitWith {_no_availPOS=false};
} forEach _availPOS;	

if (_no_availPOS) exitWith {
	hint localize "STR_DUWS_X_yd0y9b8b"; 
	sleep 5; 
	_art = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
};

if (commandpointsblu1 < _cost) exitWith
{
  ["info",[localize "STR_DUWS_X_e95mc4lv",format[localize "STR_DUWS_X_p6sb3ply",_cost]]] call bis_fnc_showNotification;
  sleep 15;
  _art = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
};

Hint localize "STR_DUWS_X_x89qxhs4";
[localize "STR_DUWS_X_x89qxhs4"] spawn fnc_sideChat_filter;

// try to find a pos, if no pos is found exit the script
_direction = direction player;
_newpos = [_position, 20, _direction] call BIS_fnc_relPos;
_foundPickupPos = [_newpos, 0,10,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos
if ((0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) || ((count nearestObjects [_foundPickupPos, [], 10]) > 0))
	exitWith {
		hint localize "STR_DUWS_X_dmaapo98"; 
		[localize "STR_DUWS_X_dmaapo98"] spawn fnc_sideChat_filter;
		sleep 5; 
		_art = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
	};

commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";
[localize "STR_DUWS_X_c4zbp19e"] spawn fnc_sideChat_filter;
Hint localize "STR_DUWS_X_lalvzf8l";

// DEPLOY THE REFIT ON THE SERVER
//[[_foundPickupPos], fnc_veh_refit_server] remoteExec ["BIS_fnc_execVM", 2];
[_foundPickupPos] remoteExec ["fnc_veh_refit_server", 2];

sleep 600;
_art = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;








