private["_group","_alive"];
_group=_this;
_alive=FALSE;
{if(alive _x)exitWith{_alive=TRUE}}forEach units _group;
_alive