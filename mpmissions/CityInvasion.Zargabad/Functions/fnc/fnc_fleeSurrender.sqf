params["_unit"];

_h = _unit spawn {
	waitUntil {morale _unit <= -0.5 && _this call BIS_fnc_enemyDetected};
	_unit action ["Eject", vehicle, _unit];
	["ace_captives_setSurrendered",[_unit,true]] call CBA_fnc_globalEvent;
};