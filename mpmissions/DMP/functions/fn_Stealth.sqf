private["_module","_units","_activated","_groups"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};

if(_activated)then{
[
_module,
(_module getVariable"dmpDebug"),
(_module getVariable"dmpSide"),
(_module getVariable"dmpDelay"),
(_module getVariable"dmpRadius"),
(_module getVariable"dmpKnowsAbout"),
(_module getVariable"dmpSpotTime"),
(_module getVariable"dmpSpotDistance"),
(_module getVariable"dmpCombatMode"),
(_module getVariable"dmpReveal"),
(_module getVariable"dmpSAD"),
(_module getVariable"dmpPlaySound"),
(_module getVariable"dmpFail"),
(_module getVariable"dmpSleep"),
(_module getVariable"dmpDuration"),
(_module getVariable"dmpScript"),
(_module getVariable"dmpGoCodeIn"),
(_module getVariable"dmpGoCodeOut")
]execVM"DMP\Scripts\Stealth\Start.sqf";
};
TRUE