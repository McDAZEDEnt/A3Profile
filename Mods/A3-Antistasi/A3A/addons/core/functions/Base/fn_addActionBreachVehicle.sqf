#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle"];

[_vehicle, ["Breach Vehicle", A3A_fnc_startBreachVehicle,nil,4,false,true,"","(isPlayer _this) && (_this == vehicle _this)",5]] remoteExec ["addAction", 0, _vehicle];
