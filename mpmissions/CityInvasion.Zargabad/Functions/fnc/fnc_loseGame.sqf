
redco addEventHandler ["Killed",
{
	waitUntil { sleep 5; not alive redco };	
	"coKilled" call BIS_fnc_endMissionServer;
}];