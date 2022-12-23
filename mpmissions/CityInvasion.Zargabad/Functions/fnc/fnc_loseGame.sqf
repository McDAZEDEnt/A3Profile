params ["_man"];

_man addEventHandler ["Killed",
{
	sleep 5;
	"coKilled" call BIS_fnc_endMissionServer;
}];