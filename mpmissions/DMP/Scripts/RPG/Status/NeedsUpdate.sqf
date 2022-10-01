private["_sleep","_hunger","_thirst","_fatigue","_misery","_alert"];
_sleep=_this;
//_sleep=FALSE;
//if((count _this)>0)then{_sleep=_this};
_hunger=dmpIncrementHunger;
_thirst=dmpIncrementThirst;
_fatigue=dmpIncrementFatigue;
FALSE call dmp_fnc_CheckTemperature;
if!(dmpSleep)then{_fatigue=0};
_alert=FALSE;
//_alert=TRUE;
//if("Parasites"in dmpDebuffs)then{_hunger=_hunger*2};
if("Infection"in dmpDebuffs)then{_hunger=_hunger*2;_fatigue=_fatigue*2};
//if("Fever"in dmpDebuffs)then{_thirst=_thirst*2};
if("Bleeding"in dmpDebuffs)then{
	// Bleeding may stop by itself
	if((random 100)<25)then{dmpDebuffs=dmpDebuffs-["Bleeding"]};
	player setDammage((getDammage player)+.1);
	systemChat"Bleeding";
};
if("Exhausted"in dmpDebuffs)then{
	_fatigue=_fatigue*2;
	//if((random 100)<50)then{player setStamina 0};
	if((random 100)<50)then{player setStamina((getStamina player)/4)};
};
if("Poison"in dmpDebuffs)then{
	// Poison may stop by itself
	if((random 100)<20)then{dmpDebuffs=dmpDebuffs-["Poison"]};
	player setDammage((getDammage player)+.1);
	systemChat"Poisoned";
};
if("Weak"in dmpDebuffs)then{
	_fatigue=_fatigue+1;
	systemChat"Weak";
};
if("Fever"in dmpDebuffs)then{
	_fatigue=_fatigue+1;
	_thirst=_thirst*2;
	systemChat"Fever";
};
//if("Nausea"in dmpDebuffs)then{if((random 100)<20)then{dmpDebuffs=dmpDebuffs-["Nausea"]};

if("Light eater"in dmpPlayerSkills)then{_hunger=_hunger*.7};
if("Light drinker"in dmpPlayerSkills)then{_thirst=_thirst*.7};
if("Light sleeper"in dmpPlayerSkills)then{_fatigue=_fatigue*.7};

dmpHunger=dmpHunger+_hunger;
dmpThirst=dmpThirst+_thirst;
dmpFatigue=dmpFatigue+_fatigue;
if(dmpHunger>10)then{
	_alert=TRUE;
	if(dmpHunger>20)exitWith{player setDammage 1;systemChat"Starved to death"};
	if(dmpHunger>10)then{if((random 10)>5)then{dmpDebuffs pushBackUnique"Weak"}};
	//if(dmpHunger>15)then{if((random 10)>5)exitWith{player setDammage 1;systemChat"Starved to death"}};
	systemChat"Starving";
	dmpFatigue=dmpFatigue+1;
};
if(dmpThirst>10)then{
	_alert=TRUE;
	if(dmpThirst>20)exitWith{player setDammage 1;systemChat"Died of dehydration"};
	if(dmpThirst>10)then{if((random 10)>5)then{player setDammage 1;systemChat"Died of dehydration"}};
	systemChat"Dying of thirst";
	dmpFatigue=dmpFatigue+1;
};
//if!(dmpSleep)then{dmpFatigue=0};
if!(_sleep)then{_fatigue=0};
if(dmpFatigue>10)then{
	_alert=TRUE;
	//systemChat"Exhausted";
	if(dmpFatigue>10)exitWith{player setUnconscious true;sleep 2;player setUnconscious false;dmpDebuffs pushBackUnique"Exhausted"};
	if((random 10)>5)then{player setUnconscious true;sleep 2;player setUnconscious false;dmpDebuffs pushBackUnique"Exhausted"};
};
if(dmpExposure>10)then{
	_alert=TRUE;
	if(dmpExposure>20)exitWith{player setDammage 1;systemChat"Died of exposure"};
	if(dmpExposure>10)then{if((random 10)>5)then{dmpDebuffs pushBackUnique"Fever"}};
	systemChat"Freezing";
	dmpFatigue=dmpFatigue+1;
};

if((count dmpDebuffs)>0)then{_alert=TRUE};
if(_sleep)exitWith{};
//if(_alert)then{hint"WARNING"};
if(_alert)then{systemChat"!"};