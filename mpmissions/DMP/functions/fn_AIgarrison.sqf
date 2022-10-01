private["_module","_units","_activated","_groups","_roof","_radius"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;
_groups=[];
_roof="";
_radius=100;
if(_activated)then{
	_radius=_module getVariable"dmpRadius";
	_roof=_module getVariable"dmpRoof";
	{if!((group _x)in _groups)then{_groups pushBack(group _x);[(group _x),_radius,_roof]execVM"DMP\Scripts\AI\Garrison.sqf"}}forEach _units;
};
true