
_targetPOS = getPOS MHQ1;

// delete the invisible crew
{
	deleteVehicle _x;
} forEach crew MHQ1;

// delete the statics
deleteVehicle MHQ_tent;
deleteVehicle MHQ_ammobox;

// create marker on MHQ
_markerType = "b_motor_inf";
if (MHQ1 isKindof "tank") then {_markerType = "b_armor"};

// Remove Deployed Marker and create an Undeployed Marker 
[MHQ1] remoteExec ["kndr_removeMarker", [0,-2] select isDedicated,false];
sleep 1;
[MHQ1, _markerType, "ColorYellow", 1, 1, localize "STR_DUWS_X_9ziy0qai"] remoteExec ["kndr_assignMarker", [0,-2] select isDedicated,false];

MHQ_respawn call BIS_fnc_removeRespawnPosition;

MHQ_deployed = false;
publicVariable "MHQ_deployed";

// Unlock vehicle
MHQ1 setVehicleLock "UNLOCKED";

["deploy"] remoteExec ["fnc_MHQ_addActions", [0,-2] select isDedicated,true];
