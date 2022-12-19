
// WARCRIMES SCRIPT

_damageThreshold = 9;
_nextLevel = 10;
_maxBuildings = 20;
_maxRep = -5;

_eventHandlerId = addMissionEventhandler ["BuildingChanged", {
	params ["_old", "_damagedObject", "_isRuin"];
	_cfg = configFile >> "CfgVehicles" >> typeOf _damagedObject;
	_EdenSubCat = getText( _cfg >> "editorSubcategory" );
	_objType = (_old call BIS_fnc_objectType) select 1;
	// players must be close
	_players_close = false;
	{
		if ((_x distance _damagedObject) < 750) exitWith {_players_close = true};
	} forEach call BIS_fnc_ListPlayers;
	if (_EdenSubCat != "EdSubcat_Military" && _objType == "House" && _players_close) then {
//	if (_EdenSubCat != "EdSubcat_Military" && (_old isKindOf "House" || _old isKindOf "Building") then {
		//sleep (0 + random 3);
		damagedBuildings = damagedBuildings + [_damagedObject];
	};
}];

while {true} do {

	waitUntil {sleep 30;count damagedBuildings > _damageThreshold};	
	Player_Reputation = Player_Reputation - 1;
	publicVariable "Player_Reputation";
	[{hint format[localize "STR_DUWS_X_5445z2bn", str (count damagedBuildings)]}] remoteExec ["BIS_fnc_Spawn", [0,-2] select isDedicated,false];
	sleep 5;
	["info",[localize "STR_DUWS_X_y9d3jrt6",localize "STR_DUWS_X_g2ehnkc5"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
	sleep 10;
	["info",[localize "STR_DUWS_X_y9d3jrt6",localize "STR_DUWS_X_jly4u3ui",Player_Reputation]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
	sleep 10;
	if (Player_Reputation < 0) then {
		commandpointsblu1 = round(commandpointsblu1 * 0.9);
		WARCOM_blufor_ap = round(WARCOM_blufor_ap * 0.9);
		publicVariable "commandpointsblu1";
		publicVariable "WARCOM_blufor_ap";
		["info",[localize "STR_DUWS_X_b16p8tvz",localize "STR_DUWS_X_bemaxwqq"]] remoteExec ['BIS_fnc_showNotification',[0,-2] select isDedicated,false];
	};
	_damageThreshold = _damageThreshold + _nextLevel;
	sleep 30;
	//if (count damagedBuildings > _maxBuildings || Player_Reputation < _maxRep) exitWith {
	if (Player_Reputation < _maxRep) exitWith {
		["TaskFailed",[localize "STR_DUWS_X_dky7jtnz",localize "STR_DUWS_X_kf4bfq2e"]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated,FALSE];
		"shittyReputation" call BIS_fnc_endMissionServer;
	};
};

