private["_index","_action"];
disableSerialization;
if!(_this)exitWith{};
_index=lbCurSel 10001;
_action=lbData[10001,_index];
//_action execVM"DMP\Scripts\RPG\XP\Skill.sqf";