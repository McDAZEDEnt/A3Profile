private["_man","_rank"];
_man=_this;
_rank=toUpper(rank _man);
//if(_rank=="PRIVATE"
if(_rank=="CORPORAL")exitWith{10};
if(_rank=="SERGEANT")exitWith{20};
if(_rank=="LIEUTENANT")exitWith{25};
if(_rank=="CAPTAIN")exitWith{30};
if(_rank=="MAJOR")exitWith{35};
if(_rank=="COLONEL")exitWith{40};
5