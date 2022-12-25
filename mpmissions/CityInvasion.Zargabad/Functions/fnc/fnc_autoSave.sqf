// Save the game with radio code alpha
if (savingEnabled) then 
{
	enableSaving [false, false];
};
//Pauses DMP spawning
missionNamespace setVariable ["dmpWaitForGo",true];publicVariable"dmpWaitForGo";
//isSaved variable
missionNamespace setVariable ["isSaved",true];publicVariable"isSaved";
//Save persistence data to profile
saveProfileNamespace;
saveMissionProfileNamespace;
[true, 1] call grad_persistence_fnc_saveMission;
//endMission
"saved" call BIS_fnc_endMissionServer;
