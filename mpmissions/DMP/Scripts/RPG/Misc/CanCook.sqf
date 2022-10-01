private["_canCook","_nearFire"];
_canCook=FALSE;
_nearFire=call dmp_fnc_nearFire;
if!(_nearFire)exitWith{FALSE};
if("dmpMessTin"call dmp_fnc_HasItem)exitWith{TRUE};
FALSE