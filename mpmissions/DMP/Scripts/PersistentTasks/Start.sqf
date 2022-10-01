private["_info","_c"];
dmpPTready=FALSE;
_info=_this;
_c=0;

_pos=_info select _c;_c=_c+1;

// Name of variable to PT info in
dmpSaveNamePT=format["dmpPT%1%2",missionName,worldName];
dmpPersistentTasks=[];

if(_delete)then{profileNamespace setVariable[dmpSaveNamePT,[]]};

if(isNil{profileNamespace getVariable dmpSaveNamePT})then{profileNamespace setVariable[dmpSaveNamePT,[]]}else{
	_PTinfo=profileNamespace getVariable dmpSaveNamePT;
	if((count _PTinfo)>0)then{
		if(dmpDebug)then{systemChat format["Loading Persistent Tasks: %1",dmpSaveNamePT]};
		dmpPersistentTasks=_PTinfo;
		publicVariable"_PTinfo";
	}else{if(dmpDebug)then{systemChat format["New Persistent Tasks: %1",dmpSaveNamePT];_newCampaign=TRUE}};
};

dmpPTready=TRUE;
publicVariable"dmpPTready";