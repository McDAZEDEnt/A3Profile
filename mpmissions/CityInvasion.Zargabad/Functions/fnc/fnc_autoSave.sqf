// Super simple auto-save script.
// this enables manual save
//enableSaving false;
if (!savingEnabled) then 
{
	enableSaving true;
};
//DMP & HAL on hold
dmpWaitForGo=TRUE;publicVariable"dmpWaitForGo";
sleep 5;
//Save to profile
saveProfileNamespace;
saveGame;
//endMission
"saved" call BIS_fnc_endMissionServer;
