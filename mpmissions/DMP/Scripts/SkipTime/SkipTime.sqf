private["_hours"];
_hours=parseNumber(ctrlText 11000);
if(_hours>24)then{_hours=24};
closeDialog 0;
[_hours,"DMP\Scripts\Skiptime\Go.sqf"]remoteExec["execVM"];