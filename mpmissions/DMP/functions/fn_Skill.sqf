private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};
sleep 10;

if(_activated)then{
[
(_module getVariable"dmpSkillSide"),
(_module getVariable"dmpSkillFaction"),
(_module getVariable"dmpSkillLevel"),
(_module getVariable"dmpSkillDelay"),
(_module getVariable"dmpSkillBase"),
(_module getVariable"dmpSkillAimingAccuracy"),
(_module getVariable"dmpSkillAimingSpeed"),
(_module getVariable"dmpSkillCommanding"),
(_module getVariable"dmpSkillCourage"),
(_module getVariable"dmpSkillGeneral"),
(_module getVariable"dmpSkillReloadSpeed"),
(_module getVariable"dmpSkillSpotDistance"),
(_module getVariable"dmpSkillSpotTime"),
(_module getVariable"dmpSkillAimingShake")
]execVM"DMP\Scripts\Skill\Start.sqf";
};
true