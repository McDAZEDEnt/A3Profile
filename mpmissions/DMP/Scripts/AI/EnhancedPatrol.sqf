// Makes a group patrol randomly. When they leave safe mode, they will take random actions
// Once the action is started, the group will not return to patrol mode. This script is not suitable for long/persistent missions. It is designed to provide unpredictable reactions on first contact with enemy AI. It is not designed for comprehensive and sustained AI improvement
private["_group","_pos"];
_group=_this;
if((count(units _group))==0)exitWith{};
_pos=getPos(leader _group);
_group setBehaviour"Safe";
_group setCombatMode"Yellow";
_group setFormation(selectRandom["COLUMN","FILE","DIAMOND","STAG COLUMN"]);
_group setSpeedMode(selectRandom["Limited","Normal"]);
sleep(random 2);
// Start a patrol
[_group,_pos,300]call BIS_fnc_taskPatrol;
//_timeStamp=TIME;_group setVariable["dmpAItimestamp",_timeStamp,TRUE];
sleep 1;
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	if!((toUpper(behaviour((units _group)select 0)))=="SAFE")exitWith{};
	//if!((behaviour((units _group)select 0))=="Safe")exitWith{};
	sleep 10;
};
_group execVM"DMP\Scripts\AI\EnhancedPatrolActivate.sqf";