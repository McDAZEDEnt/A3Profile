/*
"Fast Healer",
"Stamina", // 
"Accuracy",
"Heightened Senses",
"Wilderness Foraging",
"Light Sleeper", // Halves need for sleep
"Light Eater", // Halves need for food
"Light Drinker", // Halves need for water
"Strong Immune System",
"Barter",
"Fast learner", // Increases XP gain by 33%
"Will to live", // chance to survive dying
"Repair",
"Menacing Figure", // Arrest from further away
"First Aid",
"Medicine"
*/
if("Stamina"in dmpPlayerSkills)then{player setUnitTrait["loadCoef",0]}; //player enableStamina false
//if("First Aid"in dmpPlayerSkills)then{player setUnitTrait["medic",true]};
if("Medic"in dmpPlayerSkills)then{player setUnitTrait["medic",true]};
if("Engineer"in dmpPlayerSkills)then{player setUnitTrait["engineer",true]};
if("Explosives"in dmpPlayerSkills)then{player setUnitTrait["explosiveSpecialist",true]};
if("Stealth"in dmpPlayerSkills)then{player setUnitTrait["camouflageCoef",.3];player setUnitTrait["audibleCoef",.3]};
//if("Advanced Stealth" in dmpPlayerSkills)then{player setUnitTrait["camouflageCoef",0];player setUnitTrait["audibleCoef",0]};
if("Hacking"in dmpPlayerSkills)then{player setUnitTrait["UAVHacker",true]};
if("Sharpshooter"in dmpPlayerSkills)then{player setCustomAimCoef 0.2};


 


//player setunittrait["loadCoef",0];