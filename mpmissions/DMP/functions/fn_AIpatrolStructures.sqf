private["_module","_units","_activated","_groups","_radius"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
_radius=_module getVariable"dmpRadius";
_groups=[];
if(_activated)then{
	{
		if!((group _x)in _groups)then{
			_groups pushBack(group _x);
			[(group _x),getPos _x,_radius]execVM"DMP\Scripts\AI\PatrolStructures.sqf";
		};
	}forEach _units;
};
TRUE