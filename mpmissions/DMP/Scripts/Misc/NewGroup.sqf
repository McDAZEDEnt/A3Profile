// Takes a group and adds them to a new group (for exitin AI scripts etc)
private["_oldGroup","_group"];
_oldGroup=_this;
_group=createGroup(side _oldGroup);
(units _oldGroup)joinSilent _group;
_group