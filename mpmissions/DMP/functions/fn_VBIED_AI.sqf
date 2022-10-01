private["_module","_units","_activated","_groups","_range","_triggerRange","_power"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;
_groups=[];
_range=1000;
_triggerRange=20;
_power="Regular";
{if!(_x isKindOf"Man")then{_units=_units-[_x]}}forEach _units;
if(_activated)then{
	_range=_module getVariable"dmpVBIEDactivationRange";
	_triggerRange=_module getVariable"dmpVBIEDtriggerRange";
	_power=_module getVariable"dmpVBIEDpower";
	{[(getPos _x),(side _x),_range,_triggerRange,[],[],_power,_x]execVM"DMP\Scripts\VBIED\AI.sqf"}forEach _units;
};
TRUE