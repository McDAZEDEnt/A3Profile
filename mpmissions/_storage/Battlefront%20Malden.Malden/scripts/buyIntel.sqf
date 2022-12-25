params["_machine"];

[
	_machine,											// Object the action is attached to
	format ["Buy Intel for %1 Respawn Tickets", ["intelCost", 30] call BIS_fnc_getParamValue],										// Title of the action
	"\a3\ui_f_orange\Data\CfgOrange\Missions\action_nato_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f_orange\Data\CfgOrange\Missions\action_nato_ca.paa",	// Progress icon shown on screen
	"_this distance _target <= 3",						// Condition for the action to be shown
	"_caller distance _target <= 3",						// Condition for the action to progress
	{[name _caller, format ["Everyone, I am going to buy a piece of intel on enemy Commander for %1 Respawn Tickets", ["intelCost", 30] call BIS_fnc_getParamValue]] remoteExec ["BIS_fnc_showSubtitle", [0, -2] select isDedicated, false];},
	{},													// Code executed on every progress tick
	{
    if (([(side (group _caller))] call BIS_fnc_respawnTickets) >= (["intelCost", 30] call BIS_fnc_getParamValue)) then
			{
				[(side (group _caller)), -(["intelCost", 30] call BIS_fnc_getParamValue)] remoteExecCall ["BIS_fnc_respawnTickets", 2, false];
    		private _deviation = 1000 / intelLevel;
    		private _marker = createMarkerLocal ["intel" + (str intelLevel), getPos opforCommander];
    		_marker setMarkerTypeLocal "hd_objective";
    		_marker setMarkerPosLocal [((getPos opforCommander) select 0) + (random _deviation), ((getPos opforCommander) select 1) + (random _deviation)];
    		_marker setMarkerText (format ["Intel lvl %1", intelLevel]);
    		intelLevel = intelLevel + 1;
				[name _caller, format ["Intel Level = %1. Marker Created on Map.", intelLevel]] remoteExec ["BIS_fnc_showSubtitle", [0, -2] select isDedicated, false];
    		sleep 8;
    		[(format ["%1 Respawn tickets left", [(side (group _caller)), 0] call BIS_fnc_respawnTickets])] remoteExecCall ["hint", [0, -2] select isDedicated, false];
			} else {["HQ", "You do not have enough Respawn Tickets to buy Intel on enemy commander"] remoteExec ["BIS_fnc_showSubtitle", [0, -2] select isDedicated, false];};
  },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	3,													// Action duration [s]
	0,													// Priority
	false,												// Remove on completion
	false,												// Show in unconscious state
  true                          // Show window
] remoteExec ["BIS_fnc_holdActionAdd", [0, -2] select isDedicated, _machine];	// MP compatible implementatio
