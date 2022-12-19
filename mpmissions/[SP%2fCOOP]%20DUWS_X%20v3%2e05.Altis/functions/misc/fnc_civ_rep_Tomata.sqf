
_unit = _this select 0;
_killer = _this select 1;
_instigator = _this select 2;
_blu_kill = true;

_maxRep = -5;

// 50% chance to effect reputation
if (random 10 < 5) exitWith {};

// players must be close
_players_close = false;
{
	if ((_x distance _unit) < 750) exitWith {_players_close = true};
} forEach call BIS_fnc_ListPlayers;
if (_players_close == false) exitWith {};

//hint format ["Unit: %1  Killer: %2  Instigator: %3", str _unit, str _killer, str _instigator];sleep 5;

if (isNull _killer || isNull _instigator || side _killer == WEST || side _instigator == WEST) then {
	Player_Reputation = Player_Reputation - 1;
	publicVariable "Player_Reputation";
	["info",[localize "STR_DUWS_X_cycuqbvj",localize "STR_DUWS_X_ayhemuj4"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
	sleep 10;
	["info",[localize "STR_DUWS_X_cycuqbvj",format[localize "STR_DUWS_X_0pluxey2",Player_Reputation]]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
} else {
	_blu_kill = false;
};

if (_blu_kill == false) exitWith {};

sleep 10;

CIV_deaths = CIV_deaths + 1;

if (Player_Reputation < 0) then {
	commandpointsblu1 = round(commandpointsblu1 * 0.9);
	WARCOM_blufor_ap = round(WARCOM_blufor_ap * 0.9);
	publicVariable "commandpointsblu1";
	publicVariable "WARCOM_blufor_ap";
	["info",[localize "STR_DUWS_X_b16p8tvz",localize "STR_DUWS_X_6jv8t94t"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
};

sleep 30;
if (Player_Reputation < _maxRep) then {
	["TaskFailed",["WARCRIMES","You're a terrible human being."]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated,FALSE];
	"shittyReputation" call BIS_fnc_endMissionServer;
};
