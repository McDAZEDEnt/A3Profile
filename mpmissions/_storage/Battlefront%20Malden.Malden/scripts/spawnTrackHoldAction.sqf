params["_object"];

[
	_object,											// Object the action is attached to
	"Spawn ACE Track",					// Title of the action
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 5",						// Condition for the action to be shown
	"_caller distance _target < 5",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{
    createVehicle ["ACE_Track", getPos ACETrackSpawn, [], 0, "CAN_COLLIDE"];
  },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	0.5,													// Action duration [s]
	0,													// Priority
	false,												// Remove on completion
	false,											// Show in unconscious state
  true
] remoteExec ["BIS_fnc_holdActionAdd", [0, -2] select isDedicated, _object];	// MP compatible implementation
