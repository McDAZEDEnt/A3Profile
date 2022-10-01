if!(isServer)exitWith{};
{
[
_x,
"Skip Time",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\interact_ca.paa",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\interact_ca.paa",
"_this distance _target < 3",
"_caller distance _target < 3",
{},
{},
{execVM"DMP\Scripts\SkipTime\ShowMenu.sqf"},
{},
[],
0.3,
0,
FALSE,
FALSE
]remoteExec["BIS_fnc_holdActionAdd",0,_x];
}forEach _this;