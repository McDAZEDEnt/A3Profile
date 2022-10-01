private["_clear"];
hint"load";
dmpSaveInfoServer=profileNameSpace getVariable dmpPersistenceName;
dmpVehicleInfo=dmpSaveInfoServer select 0;
dmpGroupInfo=dmpSaveInfoServer select 1;
dmpMiscInfo=dmpSaveInfoServer select 2;
_clear=[]spawn DMP_fnc_DeleteBeforeLoad;
waitUntil{scriptDone _clear};
call dmp_fnc_LoadGroups;
if(dmpSaveObjects)then{call dmp_fnc_LoadObjects};
setDate(dmpMiscInfo select 0);
TRUE