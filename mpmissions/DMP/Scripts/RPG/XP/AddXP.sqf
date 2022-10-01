private["_target","_XP"];
_target=_this select 0;
_xp=_this select 1;
if(isNull _target)then{_target=player};
if!(player==_target)exitWith{};
if("Fast Learner" in dmpPlayerSkills)then{_xp=_xp*1.33};
dmpPlayerXP=dmpPlayerXP+_xp;
dmpPlayerXP=round dmpPlayerXP;
if(dmpPlayerXP>dmpPlayerXPnextLevel)then{
	dmpPlayerLevel=dmpPlayerLevel+1;
	dmpPlayerXP=0;
	dmpPlayerSkillPoints=dmpPlayerSkillPoints+1;
	execVM"DMP\Scripts\RPG\XP\XPforNextLevel.sqf";
	hintSilent"Level up";
};
//if(dmpPlayerXP>dmpPlayerXPnextLevel)then{call dmp_fnc_LevelUp};