// Super simple auto-save script.
// this enables manual save
//enableSaving false;
if (!savingEnabled) then 
{
	enableSaving [true, false];
};
//DMP & HAL on hold
dmpWaitForGo=TRUE;publicVariable"dmpWaitForGo";
//Save to profile
saveProfileNamespace;
saveMissionProfileNamespace;
saveGame;
//endMission
"saved" call BIS_fnc_endMissionServer;
