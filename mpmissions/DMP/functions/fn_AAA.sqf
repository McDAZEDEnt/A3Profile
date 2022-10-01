private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(dmpExit)exitWith{};
sleep 4;
if(_activated)then{
[
getPos _module,
[
(_module getVariable"dmpAAAfactionName"),
(_module getVariable"dmpAAAsiteCount"),
(_module getVariable"dmpAAAradarChance"),
(_module getVariable"dmpAAAsamCount"),
(_module getVariable"dmpAAAAAAcount"),
(_module getVariable"dmpAAAsquadChance"),
(_module getVariable"dmpAAAspawnTowns"),
(_module getVariable"dmpAAAspawnRemote"),
(_module getVariable"dmpAAAspawnCompounds")
]
]execVM"DMP\Scripts\AAA\Start.sqf";
};
TRUE