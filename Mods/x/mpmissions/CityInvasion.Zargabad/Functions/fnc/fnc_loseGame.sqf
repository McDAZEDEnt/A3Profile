params ["_man"];

_man addEventHandler ["Killed",
{
	"coKilled" call BIS_fnc_endMissionServer;
}];