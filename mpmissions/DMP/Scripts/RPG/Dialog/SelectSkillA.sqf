private["_index","_skill"];
disableSerialization;
if!(_this)exitWith{};
_index=lbCurSel 10002;
_skill=lbData[10002,_index];
//_skill execVM"DMP\Scripts\RPG\Actions\Skill.sqf";

if(dmpPlayerSkillPoints<1)exitWith{hintSilent"No skill points"};
if(_skill in dmpPlayerSkills)exitWith{hintSilent"You already know this skill"};

dmpPlayerSkillPoints=dmpPlayerSkillPoints-1;
dmpPlayerSkills pushBack _skill;
hintSilent format["Learned %1",_skill];
execVM"DMP\Scripts\RPG\XP\ApplySkills.sqf";
execVM"DMP\Scripts\RPG\Dialog\ShowDialog.sqf";