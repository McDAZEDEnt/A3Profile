private["_hours","_status","_inside","_tent","_bed","_hunger","_thirst","_sleep","_exposure","_misery","_dam","_healChance"];
_hours=parseNumber(ctrlText 11000);
if(_hours>24)then{_hours=24};
//systemChat format["Sleep %1 hours",_hours];
closeDialog 0;
sleep .3;
titleText[" ","BLACK OUT",1];
sleep 1;
//_hours=_this;
_hours=parseNumber(ctrlText 11000);
closeDialog 0;
sleep .3;
_status=call dmp_fnc_PreSleepCheck;
_inside=_status select 0;
_tent=_status select 1;
_bed=_status select 2;
// Multiplayer sleep is less in depth
if(isMultiplayer)exitWith{
	if([player,500]call dmp_fnc_NearEnemies)exitWith{hintSilent"Can not sleep while enemies are nearby"};
	titleText[" ","BLACK OUT",1];
	//{if(_x in dmpDebuffs)then{dmpDebuffs=dmpDebuffs-[_x]}forEach["Fever","Exhausted","Nausea","Weak"];
	dmpDebuffs=[];
	player setDammage 0;
	player setStamina 300;
	dmpFatigue=0;
	dmpHunger=dmpHunger+4;
	dmpThirst=dmpThirst+4;
	sleep 3;
	titleText[" ","BLACK IN",1];
};
if([player,200]call dmp_fnc_NearEnemies)exitWith{hintSilent"Can not sleep while enemies are nearby"};
dmpSleeping=TRUE;
_count=0;
_hunger=0;
_thirst=0;
_sleep=0;
_exposure=0;
_dam=0;
_healChance=5;
while{TRUE}do{
	if!(dmpSleeping)exitWith{};
	if!(dmpSleepScript=="")then{execVM dmpSleepScript};
	[1]remoteExec["skipTime"];
	//TRUE call dmp_fnc_NeedsUpdate;
	// A bit of healing
	_dam=getDammage player;
	if(_dam>0)then{player setDammage(_dam-.1)};
	if((getDammage player)<0)then{player setDammage 0};
	if(_dam>.8)exitWIth{};
	_exposure=call dmp_fnc_CheckTemperature;
	_hunger=dmpIncrementHunger;
	_thirst=dmpIncrementThirst;
	_sleep=dmpIncrementFatigue;
	_healChance=5
	if(_bed)then{_sleep=1;_misery=1;_healChance=10};
	if((_inside)OR(_tent))then{_sleep=_sleep+1;_misery=_misery+1;_healChance=_healChance+10};
	if("Weak"in dmpDebuffs)then{_healChance=_healChance-10};
	if("Parasites"in dmpDebuffs)then{_hunger=_hunger*2};
	if("Fever"in dmpDebuffs)then{_thirst=_thirst*2};
	if("Exhausted"in dmpDebuffs)then{_sleep=_sleep/2};
	dmpHunger=dmpHunger+_hunger;
	dmpThirst=dmpThirst+_thirst;
	dmpFatigue=dmpFatigue-_sleep;
	if(dmpFatigue<1)then{dmpFatigue=0};
	if(dmpHunger>10)exitWith{};
	if(dmpThirst>10)exitWith{};
	if(dmpExposure)>10)exitWith{};
	if((count dmpDebuffs)>0)then{
		if(_count>5)then{dmpDebuffs=dmpDebuffs-["Exhausted"]};
		if("Fever"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Fever"]}};
		//if("Exhausted"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Exhausted"]}};
		if("Poison"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Poison"]}};
		//if("Nausea"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Nausea"]}};
		if("Bleeding"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Bleeding"]}};
		if("Weak"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Weak"]}};
		if("Infection"in dmpDebuffs)then{if((random 10)<_healChance)then{dmpDebuffs=dmpDebuffs-["Infection"]}};
	};
	if("Bleeding"in dmpDebuffs)then{player setDammage(_dam+.1)};
	if("Poison"in dmpDebuffs)then{player setDammage(_dam+.1)};
	if!(alive player)exitWith{};
	_hours=_hours-1;
	_count=_count+1;
};
if(dmpWeatherOnSleep)then{execVM"DMP\Scripts\RPG\Misc\Weather.sqf"};
sleep 1;
titleText[" ","BLACK IN",1];
dmpSleeping=FALSE;