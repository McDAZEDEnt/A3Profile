private["_group"];
_group=_this;
_group setBehaviour"SAFE";
_group setCombatMode"YELLOW";
_group setFormation"DIAMOND";
_group setSpeedmode"NORMAL";
if((random 10)>5)exitWith{};
[_group,getPos leader _group,70]call BIS_fnc_taskPatrol;