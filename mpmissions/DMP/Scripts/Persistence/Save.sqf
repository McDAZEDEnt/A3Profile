private["_saveData","_objects","_groups"];
_saveData=[];
// Get all empty vehicles/objects (and cargo)
_objects=[];
if(dmpSaveObjects)then{_objects=call dmp_fnc_SaveObjects};
_saveData pushBack _objects;
// Get all AI groups (and their crewed vehicles)
_groups=call dmp_fnc_SaveGroups;
_saveData pushBack _groups;
//_campaignData=[dmpCVP,dmp...
// To do: misc info (time, weather, etc)
_saveData pushBack[(date)];
//systemChat format["SD: %1",_saveData select 2];
profileNameSpace setVariable[dmpPersistenceName,_saveData];
TRUE