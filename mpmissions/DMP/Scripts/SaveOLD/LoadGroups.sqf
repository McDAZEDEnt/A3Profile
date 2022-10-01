private["_groupInfo"];
_groupInfo=dmpGroupInfo;
if(dmpDebug)then{systemChat"Loading groups"};
{_x execVM"DMP\Scripts\Save\LoadWholeGroup.sqf"}forEach _groupInfo;
if(dmpDebug)then{systemChat"Loading groups DONE"};