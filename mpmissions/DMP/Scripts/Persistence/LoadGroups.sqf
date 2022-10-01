private["_groupInfo"];
_groupInfo=[]+dmpGroupInfo;
{_x call dmp_fnc_LoadWholeGroup}forEach _groupInfo;
TRUE