
diag_log format ["------------------ DUWS_X START ----v0------ player: %1", profileName];


_duwsx_isHostedserver = if (isServer && !isDedicated) then {true} else {false};
_duwsx_isServer = if (isDedicated || _duwsx_isHostedserver) then {true} else {false};
_duwsx_isClient = if ((_duwsx_isHostedserver || !isDedicated) && (hasInterface)) then {true} else {false};
_duwsx_isHeadless = if !(hasInterface || isDedicated) then {true} else {false};

if (isNil "serverinit_complete") then {
	serverinit_complete = false;publicVariable "serverinit_complete";
};

if (_duwsx_isServer || _duwsx_isHostedserver || _duwsx_isHeadless) then 
{
	[] execVM "init\server_init.sqf"; 
};

if (_duwsx_isClient) then 
{
    [] execVM "init\client_init.sqf"; 
};

// INIT R3F Logistics
// - has to be run by client and server
waitUntil {sleep 5;serverinit_complete};
waituntil {sleep 5;WARCOM_init_done;};
execVM "R3F_LOG\init.sqf";

