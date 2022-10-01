private["_info","_c","_debug","_saveInfo"];
dmpRPGICfirstLoad=TRUE;
waitUntil{!(isNil"dmpRPGReady")};waitUntil{dmpRPGready};
dmpRPGICready=FALSE;
_info=_this;

/*
_info=[
"TRUE", // save pos
"TRUE", // save damage
100, // save radius
"TRUE" // players can trigger endmission
];
*/

_c=0;
//_debug=TRUE;if((_info select _c)=="FALSE")then{_debug=FALSE};_c=_c+1;
dmpRPGsavePlayerPos=TRUE;if((_info select _c)=="FALSE")then{dmpRPGsavePlayerPos=FALSE};_c=_c+1;
dmpRPGsavePlayerDamage=TRUE;if((_info select _c)=="FALSE")then{dmpRPGsavePlayerDamage=FALSE};_c=_c+1;
dmpRPGsaveRadius=_info select _c;_c=_c+1;
dmpRPGplayersCanEnd=TRUE;if((_info select _c)=="FALSE")then{dmpRPGplayersCanEnd=FALSE};_c=_c+1;
//dmpRPGuseMissionGen=TRUE;if((_info select _c)=="FALSE")then{dmpRPGuseMissionGen=FALSE};_c=_c+1;
//dmpRPGpermadeath=TRUE;if((_info select _c)=="FALSE")then{dmpRPGpermadeath=FALSE};_c=_c+1;

//dmpSaveNameRPGIC=format["dmp%1%2",missionName,worldName];
//dmpSaveNameRPGIC="dmpRPGICsave";
dmpSaveNameRPGIC=format["%1_IC",dmpSaveNameRPG];
//if(_deleteCampaign)then{profileNamespace setVariable[dmpSaveNameRPGIC,[]]};

dmpSaveMode="CHARACTER";

dmpRPGsavedObjects=[]; // objects that have been saved
dmpRPGsavedObjectInfo=[]; // virtual information of saved objects

dmp_fnc_RPGsaveObjectsMain=compile preprocessFile"DMP\Scripts\RPGIC\SaveObjectsMain.sqf";
dmp_fnc_RPGsaveObjects=compile preprocessFile"DMP\Scripts\RPGIC\SaveObjects.sqf";
dmp_fnc_RPGloadObjects=compile preprocessFile"DMP\Scripts\RPGIC\LoadObjects.sqf";
dmp_fnc_RPGendMission=compile preprocessFile"DMP\Scripts\RPGIC\EndMission.sqf";

// Load server objects
_saveInfo=[];
if(isServer)then{
	if(dmpRPGsaveRadius<.1)exitWith{};
	//{_x setVariable["dmpPreventSave",TRUE,TRUE]}forEach(allMissionObjects"All");sleep 1;
	if!(isNil{profileNamespace getVariable dmpSaveNameRPGIC})then{
		_saveInfo=profileNamespace getVariable dmpSaveNameRPGIC;
		if((count _saveInfo)==0)exitWith{};
		//sleep .5;hintc format["_saveInfo:\n\n%1",_saveInfo];sleep .5;
		dmpRPGsavedObjectInfo=_saveInfo select 0;
		//hintc format["dmpRPGsavedObjectInfo:\n\n%1",dmpRPGsavedObjectInfo];sleep .5;
		//hintc format["1:\n\n%1",dmpRPGsavedObjectInfo select 0];sleep .5;
		if(dmpDebug)then{
			sleep .5;
			//hintc format["dmpRPGsavedObjectInfo:\n%1",dmpRPGsavedObjectInfo];
			//dmpRPGsavedObjectInfo=(profileNamespace getVariable dmpSaveNameRPGIC)select 0;sleep .5;hintc format["%1",(profileNamespace getVariable dmpSaveNameRPGIC)];
		};
		call dmp_fnc_RPGloadObjects;
		dmpRPGICfirstLoad=FALSE;
	};
	//dmpRPGICready=TRUE;publicVariable"dmpRPGICready";
};

dmpRPGICready=TRUE;

/*

// Load player
if(local player)then{
	if!(isNil{profileNamespace getVariable dmpSaveNameRPGIC})then{"LOAD"execVM"DMP\Scripts\RPG\Player\SaveLoad.sqf"};
};

/*
// Mission loop
while{TRUE}do{
	if(dmpVP<0)exitWith{};
	if(call dmp_fnc_AllPlayersDown)exitWith{dmpVP=-1};
	if((dmpVPtarget>0)AND(dmpVP>=dmpVPtarget))exitWith{};
	sleep 10;
};

// Loss
if(dmpVP<0)exitWith{
	if!(dmpSoundLose=="")then{dmpSoundLose remoteExec["playSound"]};
	//if(dmpDFCindex<0)exitWith{"Lose"execVM"DMP\Scripts\DFC\EndCampaign.sqf"}; // need to make an end state for campaign
	//profileNamespace setVariable[dmpSaveNameRPGIC,["Need to enter campaign info here"]];
	sleep dmpEndDelay;
	"EveryoneLOST"call BIS_fnc_endMissionServer;
};

// Win
if!(dmpSoundWin=="")then{dmpSoundWin remoteExec["playSound"]};
sleep dmpEndDelay;
execVM"DMP\Scripts\RPGIC\EndMission.sqf";
//if(dmpDFCwins>=dmpDFCwinLimit)exitWith{"Win"execVM"DMP\Scripts\DFC\EndCampaign.sqf"}; // need to make an end state for campaign
//profileNamespace setVariable[dmpSaveNameRPGIC,["Need to enter campaign info here"]];
//sleep dmpEndDelay;"EveryoneWON"call BIS_fnc_endMissionServer;