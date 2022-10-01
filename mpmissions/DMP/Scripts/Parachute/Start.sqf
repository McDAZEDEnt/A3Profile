private["_units","_text","_device"];
_units=_this select 0;
_text=_this select 1;
dmpParachuteGroup=TRUE;
if((_this select 2)=="FALSE")then{dmpParachuteGroup=FALSE};
publicVariable"dmpParachuteGroup";
dmpParachuteAlt=_this select 3;
if!(isServer)exitWith{};
if((count _units)==0)exitWith{};
_device=objNull;

{
_device=_x;
// Taken from here: https://community.bistudio.com/wiki/BIS_fnc_holdActionAdd
[
_device,
_text,
"\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\land_ca.paa",
"_this distance _target < 5",
"_caller distance _target < 5",
{},
{},
{execVM"\DMP\Scripts\Parachute\Parachute1.sqf"},
{},
[],
.3,
0,
false,
false
]remoteExec["BIS_fnc_holdActionAdd",0,_device];
}forEach _units;