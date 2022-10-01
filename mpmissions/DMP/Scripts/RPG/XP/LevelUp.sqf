hintSilent"Level up";
//dmpPlayerXPnextLevel=(dmpPlayerLevel / 10)^2; //dmpPlayerLevel;
//_c=10;
dmpPlayerLevel=dmpPlayerLevel+1;
dmpPlayerXP=dmpPlayerXPnextLevel-dmpPlayerXP;
//dmpPlayerXPnextLevel=10+(dmpPlayerLevel*_c);
execVM"DMP\Scripts\RPG\XP\XPforNextLevel.sqf";
dmpPlayerSkillPoints=dmpPlayerSkillPoints+1;
systemChat format["Level: %1    XP: %2",dmpPlayerLevel,dmpPlayerXPnextLevel];