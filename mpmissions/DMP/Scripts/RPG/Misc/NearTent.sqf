private["_near","_o"];
_near=FALSE;
_o=nearestObjects[player,["Camping_base_F"],10];
if((count _o)>0)then{_near=true};
_near