private["_module","_units","_activated","_groups","_range","_triggerRange","_power","_yell","_yellChance"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;
_groups=[];
_range=300;
_power="Regular";
_yellChance=0;
_yell="";
{if!(_x isKindOf"Man")then{_units=_units-[_x]}}forEach _units;
if(_activated)then{
	_range=_module getVariable"dmpSuicideBomberActivationRange";
	_triggerRange=_module getVariable"dmpSuicideBomberTriggerRange";
	_power=_module getVariable"dmpSuicideBomberPower";
	_yellChance=(_module getVariable"dmpSuicideBomberYellChance");
	_yell=(_module getVariable"dmpSuicideBomberYell");
	{[(getPos _x),(side _x),_range,_triggerRange,[],_power,_yellChance,_yell,_x]execVM"DMP\Scripts\SuicideBomber\AI.sqf"}forEach _units;
};
TRUE