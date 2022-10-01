private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
dmpOvercast=0;
dmpRain=0;
if!(isServer)exitWith{};
//waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
dmp_fnc_ParseArray=compile preprocessFile"DMP\Scripts\Misc\ParseArray.sqf";
sleep 1;
if(_activated)then{
[
(_module getVariable"dmpWeatherSkiptime"),
(_module getVariable"dmpWeatherRain"),
(_module getVariable"dmpWeatherOvercast")
]execVM"DMP\Scripts\Weather\Start.sqf";
};
TRUE