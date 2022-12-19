_groupGuard = (_this select 3) select 0;
_groupPatrol = (_this select 3) select 1;
_centerPos = (_this select 3) select 2;
_hq = (_this select 3) select 3;

_cost = 20;

if (commandpointsblu1 > _cost) then {
    commandpointsblu1 = commandpointsblu1 - _cost;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach units _groupGuard;
    {deletevehicle _x} foreach units _groupPatrol;

    (_this select 0) removeaction (_this select 2);
    [_centerPos, _hq] spawn fnc_HQguards;    
} else {
    hint format [localize "STR_DUWS_X_p6sb3ply", _cost];
};