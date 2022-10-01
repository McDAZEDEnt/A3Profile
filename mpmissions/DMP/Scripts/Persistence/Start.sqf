private["_info","_c","_debug","_autoLoad","_delete"];
if(count(entities"DMP_DFC")>0)exitWith{if(dmpDebug)then{systemChat"Saving is disabled wtih DFC"}};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};

_info=[
"TRUE", // debug
//"TRUE", // player
"TRUE", // West
"TRUE", // East
"TRUE", // Resistance
"TRUE", // Civilian
"TRUE", // Renegade
"TRUE", // Objects
"TRUE", // Date and time
"TRUE", // autoLoad
600, // cycle
"FALSE" //delete save
];

_info=_this;

_c=0;
//dmpSavePlayer=TRUE;
dmpSaveSides=[];
dmpSaveObjects=TRUE;
dmpSaveTime=TRUE;

_debug=TRUE;if((_info select _c)=="FALSE")then{_debug=FALSE};_c=_c+1;
//if((_info select _c)=="TRUE")then{dmpSavePlayer=FALSE};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpSaveSides pushBack WEST};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpSaveSides pushBack EAST};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpSaveSides pushBack RESISTANCE};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpSaveSides pushBack CIVILIAN};_c=_c+1;
if((_info select _c)=="TRUE")then{dmpSaveSides pushBack SIDEENEMY};_c=_c+1;
if((_info select _c)=="FALSE")then{dmpSaveObjects=FALSE};_c=_c+1;
if((_info select _c)=="FALSE")then{dmpSaveTime=FALSE};_c=_c+1;
_autoLoad=TRUE;if((_info select _c)=="FALSE")then{_autoLoad=FALSE};_c=_c+1;
_cycle=_info select _c;_c=_c+1;
_delete=TRUE;if((_info select _c)=="FALSE")then{_delete=FALSE};_c=_c+1;

dmpPersistenceName=format["dmpPersistence%1%2",missionName,worldName];

if(_debug)then{systemChat format["SAVE NAME: %1",dmpPersistenceName]};

if(_delete)exitWith{
	profileNameSpace setVariable[dmpPersistenceName,[]];
	if(_debug)then{hintSilent format["SAVE DELETED: %1",dmpPersistenceName]};
};

dmpSaveInfoServer=[];
dmpVehicleInfo=[];
dmpGroupInfo=[];
dmpMiscInfo=[];

dmpNewGame=TRUE;
dmpLoadGame=FALSE;

dmp_fnc_DoSave=compile preprocessFile"Save\DoSave.sqf";

//dmp_fnc_WaypointInfo=compile preprocessFile"Save\WaypointInfo.sqf";
dmp_fnc_GetVariables=compile preprocessFile"Save\GetVariables.sqf";
dmp_fnc_SaveManInfo=compile preprocessFile"Save\SaveManInfo.sqf";
dmp_fnc_GroupVehiclesSaveInfo=compile preprocessFile"Save\GroupVehiclesSaveInfo.sqf";
dmp_fnc_SaveObjects=compile preprocessFile"Save\SaveObjects.sqf";
dmp_fnc_SaveGroups=compile preprocessFile"Save\SaveGroups.sqf";
dmp_fnc_Save=compile preprocessFile"Save\Save.sqf";

dmp_fnc_DeleteBeforeLoad=compile preprocessFile"Save\DeleteBeforeLoad.sqf";

dmp_fnc_SetVariables=compile preprocessFile"Save\SetVariables.sqf";
dmp_fnc_LoadGroupVehicles=compile preprocessFile"Save\LoadGroupVehicles.sqf";
dmp_fnc_LoadWholeGroup=compile preprocessFile"Save\LoadWholeGroup.sqf";
dmp_fnc_LoadGroups=compile preprocessFile"Save\LoadGroups.sqf";
dmp_fnc_LoadObjects=compile preprocessFile"Save\LoadObjects.sqf";
dmp_fnc_Load=compile preprocessFile"Save\Load.sqf";

// Need load player stuff here

if!(isServer)exitWith{};

if!(isNil{profileNameSpace getVariable dmpPersistenceName})then{
	dmpSaveInfoServer=profileNameSpace getVariable dmpPersistenceName;
	if((count dmpSaveInfoServer)>0)then{
		dmpNewGame=FALSE;
		if(_autoLoad)then{dmpLoadGame=TRUE};
	};
};

if(isNil{profileNameSpace getVariable dmpPersistenceName})then{
	dmpLoadGame=FALSE;
	if(_debug)then{hint"No entry dmpPersistenceName"};
};

if(dmpLoadGame)then{
	if!(_autoLoad)exitWith{};
	if(_debug)then{systemChat"Loading"};
	[]spawn dmp_fnc_Load;
	// Need code to examine all groups and apply AI based on variables ???
};

/*
dmpPersistenceReady=TRUE;
if(_cycle<1)exitWith{};
while{TRUE}do{
	sleep _cycle;
	call dmp_fnc_Save;
};