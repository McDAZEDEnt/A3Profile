private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
if(dmpExit)exitWith{};

if(_activated)then{
[
(_module getVariable"dmpCivAttitudeWest"),
(_module getVariable"dmpCivAttitudeEast"),
(_module getVariable"dmpCivAttitudeRes"),
(_module getVariable"dmpCivAttitudeOther"),
(_module getVariable"dmpCivDetainPenalty"),
(_module getVariable"dmpCivDetainPenaltyL"),
(_module getVariable"dmpCivKillPenalty"),
(_module getVariable"dmpCivKillPenaltyL"),
(_module getVariable"dmpCivKnowledgeRadius"),
(_module getVariable"dmpCivKnowledgeLeader"),
(_module getVariable"dmpCivKnowledgeHVT"),
(_module getVariable"dmpCivKnowledgeTroop"),
(_module getVariable"dmpCivKnowledgeCaptive"),
(_module getVariable"dmpCivKnowledgeCache"),
(_module getVariable"dmpCivKnowledgeSpecial"),
(_module getVariable"dmpCivKnowledgeRadiusL"),
(_module getVariable"dmpCivKnowledgeLeaderL"),
(_module getVariable"dmpCivKnowledgeHVTL"),
(_module getVariable"dmpCivKnowledgeTroopL"),
(_module getVariable"dmpCivKnowledgeCaptiveL"),
(_module getVariable"dmpCivKnowledgeCacheL"),
(_module getVariable"dmpCivKnowledgeSpecialL"),
(_module getVariable"dmpInterrogateRadius"),
(_module getVariable"dmpInterrogateChanceWest"),
(_module getVariable"dmpInterrogateChanceEast"),
(_module getVariable"dmpInterrogateChanceRes"),
(_module getVariable"dmpLanguageWest"),
(_module getVariable"dmpLanguageEast"),
(_module getVariable"dmpLanguageRes"),
(_module getVariable"dmpLanguageCivilian"),
(_module getVariable"dmpCooldown"),
(_module getVariable"dmpCycle")
]execVM"DMP\Scripts\Interaction\Start.sqf";
};
TRUE