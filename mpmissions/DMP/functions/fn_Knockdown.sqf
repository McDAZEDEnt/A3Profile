private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 1;

if(_activated)then{
[
(_module getVariable"dmpKnockdownThreshold"),
(_module getVariable"dmpKnockdownDuration"),
(_module getVariable"dmpKnockdownAffectPlayers"),
(_module getVariable"dmpKnockdownAffectCrew"),
(_module getVariable"dmpKnockdownInterval"),
(_module getVariable"dmpKnockdownDebug")
]execVM"DMP\Scripts\Knockdown\Start.sqf";
};
true