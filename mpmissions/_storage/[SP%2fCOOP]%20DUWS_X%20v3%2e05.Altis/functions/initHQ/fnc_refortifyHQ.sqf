_aaPod = (_this select 3) select 0;
_gl1Pod = (_this select 3) select 1;
_atPod1 = (_this select 3) select 2;
_atPod2 = (_this select 3) select 3;
_atPod3 = (_this select 3) select 4;
_centerPos = (_this select 3) select 5;
_hq = (_this select 3) select 6;

_cost = 20;

if (commandpointsblu1 > _cost) then {
    commandpointsblu1 = commandpointsblu1 - _cost;
    publicVariable "commandpointsblu1";
    
    playSound "loadgun";

    {deletevehicle _x} foreach crew _aaPod + [_aaPod];
    {deletevehicle _x} foreach crew _gl1Pod + [_gl1Pod];
    {deletevehicle _x} foreach crew _atPod1 + [_atPod1];
    {deletevehicle _x} foreach crew _atPod2 + [_atPod2];
    {deletevehicle _x} foreach crew _atPod3 + [_atPod3];

    (_this select 0) removeaction (_this select 2);
    [_centerPos, _hq, true] spawn fnc_fortifyHQ;
} else {
    hint format [localize "STR_DUWS_X_p6sb3ply", _cost];
};