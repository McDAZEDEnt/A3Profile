private["_pos","_factionName","_info"];
if!(isServer)exitWith{};
if(TIME<5)then{sleep 5};
_pos=_this select 0;
_factionName=_this select 1;
_info=[];
while{TRUE}do{
	{if(((_x select 0)select 0)==_factionName)exitWith{_info=_x}}forEach dmpAllFactions;
	if((count _info)>0)exitWith{};
	sleep 1;
};
[_info select 0,_info select 1,_pos]execVM"DMP\Scripts\OccupiedTown\PopulateTown.sqf";