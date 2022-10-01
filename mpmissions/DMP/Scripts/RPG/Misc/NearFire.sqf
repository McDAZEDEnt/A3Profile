private["_nearFire","_f"];
_nearFire=FALSE;
_f=nearestObjects[player,["FirePlace_burning_F"],2];
{if(inflamed _x)exitWith{_nearFire=TRUE}}forEach _f;
_nearFire