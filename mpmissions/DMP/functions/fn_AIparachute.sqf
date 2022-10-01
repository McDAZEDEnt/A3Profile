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
[
_units,
_module,
(_module getVariable"dmpAIparachuteHeight"),
(_module getVariable"dmpAIparachuteScatter"),
(_module getVariable"dmpAIparachuteAI"),
(_module getVariable"dmpAIparachuteDelay"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut")
]execVM"DMP\Scripts\AI\Parachute.sqf";
};
TRUE