private["_chance","_script","_manCount","_manTypes","_type","_pos","_group","_towns"];
if!(isServer)exitWith{};
_chance=_this select 0;
_script=_this select 1;
_manCount=1;
_manTypes=[];
_type="";
_pos=[];
_group=grpNull;
while{((count dmpTypesCivilianLeader)==0)}do{sleep .3};
while{((count dmpTypesCivilianCar)==0)}do{sleep .3};
_manTypes=dmpTypesCivilianLeader;
_towns=dmpLocations;
{
//_pos=getPos _x;
_pos=_x;
if((random 100)<_chance)then{
	if(_pos call dmp_fnc_BlacklistCheck)then{
		_group=createGroup CIVILIAN;
		//_manCount=[2,9]call BIS_fnc_RandomInt;
		_manCount=1;
		while{(_manCount>0)}do{
			_type=selectRandom _manTypes;
			_type createunit[_pos,_group,"",1,"COLONEL"];
			_manCount=_manCount-1;
		};
		//[_group,200]execVM"DMP\Scripts\AI\Garrison.sqf";
		[_group,200]execVM"DMP\Scripts\Civilians\Garrison.sqf";
		if(dmpDebug)then{[_group,"Civ Leader"]execVM"DMP\Scripts\AI\Track.sqf"};
		if!(_script=="")then{{_x execVM _script}forEach units _group};
		{_x execVM"DMP\Scripts\Civilians\PrepLeader.sqf"}forEach units _group;
		{_x setVariable["dmpAItype","CivilianLeader",TRUE]}forEach units _group;
	};
};
sleep .2;
}forEach _towns;