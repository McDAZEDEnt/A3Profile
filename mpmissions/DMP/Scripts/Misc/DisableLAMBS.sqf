private["_info","_c","_side","_wait"];
_info=_this;
_c=0;
_side=WEST;
if((_info select _c)=="East")then{_side=EAST};if((_info select _c)=="Resistance")then{_side=RESISTANCE};if((_info select _c)=="Civilian")then{_side=CIVILIAN};_c=_c+1;
sleep(_info select _c);_c=_c+1;
_wait=(_info select _c);_c=_c+1;
if((_wait<10)AND(_wait>0))then{_wait=10};
while{TRUE}do{
	{if((side _x)==_side)then{_x setVariable["dangerAIEnabled",FALSE,TRUE]}}forEach allUnits;
	if(_wait<.1)exitWith{};
	sleep _wait;
};