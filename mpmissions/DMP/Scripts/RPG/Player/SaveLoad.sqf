private["_code","_loadout","_stats","_status","_saveName","_saveData"];
_code=_this;
if!(local player)exitWith{};
if(dmpSaveMode=="DISABLED")exitWith{hintSilent"Saving is disabled"};
if(dmpSaveMode=="MISSION")exitWith{
	if(_code=="SAVE")exitWith{saveGame};
	if(_code=="LOAD")exitWith{loadGame};
	hintSilent"Character saves only";
};

if((count(entities"dmp_RPGIC"))>0)then{
	waitUntil{!(isNil"dmpRPGICReady")};waitUntil{dmpRPGICready};
};

_loadout=getUnitLoadout player;
_stats=[getDammage player,getDir player,getPosASL player,worldName];
//hintc format["%1",dmpPlayerSkills];
_status=
[
([]+dmpPlayerSkills),
(0+dmpPlayerSkillPoints),
(0+dmpPlayerLevel),
(0+dmpPlayerXP),
(0+dmpPlayerCash),
(0+dmpHunger),
(0+dmpThirst),
(0+dmpFatigue),
(0+dmpExposure),
([]+dmpDebuffs)
];

//sleep .5;hintc format["_status: %1",_status];

//_saveName=format["dmp_%1%2%3",missionName,worldName,name player];
//_saveName=format["dmp_%1%",(name player)];
_saveName=dmpSaveNameRPG;
_saveData=
[
_loadout,
_stats,
_status
];

if(isNil{profileNamespace getVariable _saveName})then{_code=="SAVE"};

if(_code=="DELETE")exitWith{
	profileNamespace setVariable[_saveName,[]];
};

if(_code=="SAVE")exitWith{
	profileNamespace setVariable[_saveName,_saveData];
	systemChat format["DMP character saved: %1...",_saveName];
	if(isServer)then{
		if((count entities"dmp_RPGIC")<1)exitWith{};
		call dmp_fnc_RPGsaveObjectsMain;
	};
};

// LOAD
if(_code=="LOAD")exitWith{
	titleText[" ","BLACK IN",2];
	if(isNil{(profileNamespace getVariable _saveName)})exitWith{
		if(dmpDebug)then{systemChat format["DMP load: %1 does not exist, creating new character save",_saveName]};
		"SAVE"execVM"DMP\Scripts\RPG\Player\SaveLoad.sqf";
	};
	if(isServer)then{
		if((count entities"dmp_RPGIC")<1)exitWith{};
		if(dmpRPGICfirstLoad)exitWith{};
		call dmp_fnc_RPGloadObjects;
	};
	_saveData=profileNamespace getVariable _saveName;//sleep .5;hintc format["_saveData: %1",_saveData],
	if((count _saveData)==0)exitWith{"Save"execVM"DMP\Scripts\RPG\Player\SaveLoad.sqf";systemChat"New character"};
	_loadout=_saveData select 0;
	_stats=_saveData select 1;
	_status=_saveData select 2;
	//if((count _saveData)==0)exitWith{systemChat "New character"};
	player setUnitLoadout _loadout;
	if(dmpRPGsavePlayerPos)then{
		player setDir(_stats select 1);
		if!((count(_stats select 2))==0)then{player setPosASL(_stats select 2)};
	};
	dmpPlayerSkills=[];
	dmpPlayerSkills=[]+(_status select 0);
	dmpPlayerSkillPoints=_status select 1;
	dmpPlayerLevel=_status select 2;
	dmpPlayerXP=_status select 3;
	dmpPlayerCash=_status select 4;
	if(dmpRPGsavePlayerDamage)then{
		player setDammage(_stats select 0);
		dmpHunger=_status select 5;
		dmpThirst=_status select 6;
		dmpFatigue=_status select 7;
		dmpExposure=_status select 8;
		dmpDebuffs=_status select 9;
	};
	execVM"DMP\Scripts\RPG\XP\XPforNextLevel.sqf";
	execVM"DMP\Scripts\RPG\XP\ApplySkills.sqf";
	if!((_stats select 3)==worldName)then{systemChat"Different worldName"};
	systemChat format["DMP character loaded: %1...",_saveName];
	//systemChat format["dmp character loaded: %1: %2.",_saveName,_saveData];
	//if(dmpDebug)then{systemChat format["dmp character loaded: %1: %2.",_saveName,_saveData]};
};