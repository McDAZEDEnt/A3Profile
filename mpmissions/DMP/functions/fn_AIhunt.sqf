private["_module","_units","_activated","_groups"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;
_groups=[];
if(_activated)then{
{if!((group _x)in _groups)then{_groups pushBack(group _x);(group _x)execVM"DMP\Scripts\AI\Hunt.sqf"}}forEach _units;
};
TRUE