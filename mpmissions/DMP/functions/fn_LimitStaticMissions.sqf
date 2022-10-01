private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
//sleep .1;
if!(isServer)exitWith{};
dmp_fnc_ParseArray=compile preprocessFile"DMP\Scripts\Misc\ParseArray.sqf";

if(_activated)then{
[
(_module getVariable"dmpType"),
(_module getVariable"dmpCount")
]execVM"DMP\Scripts\Missions\LimitStaticMissions.sqf";
};
TRUE