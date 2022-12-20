// Super simple auto-save script.
// this enables manual save
//enableSaving false;
if (!savingEnabled) then 
{
	enableSaving true;
};
//DMP & HAL on hold
dmpWaitForGo=TRUE;publicVariable"dmpWaitForGo";
(group LeaderHQ) setVariable ['RydHQ_ResetNow',false];
(group LeaderHQB) setVariable ['RydHQ_ResetNow',false];
sleep 5;
//Save to profile
saveMissionProfileNamespace;
saveProfileNamespace;
saveGame;
//endMission
["saved", true, 2] call BIS_fnc_endMissionServer;
