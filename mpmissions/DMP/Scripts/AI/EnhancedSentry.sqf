// Makes a group wait in a position. When they leave safe mode, they will take random actions
// Once the action is started, the group will not return to sentry mode. This script is not suitable for long/persistent missions. It is designed to provide unpredictable reactions on first contact with enemy AI. It is not designed for comprehensive and sustained AI improvement
private["_group","_pos","_formation","_speed","_state","_alive","_timeStamp"];
_group=_this;
_originalPos=getPos (leader _group);
_formation=["COLUMN","FILE","DIAMOND","STAG COLUMN"];
_speed=["Limited","Normal"];
sleep(random 2);
_group setBehaviour"Safe";
_group setCombatMode"Yellow";
_group setFormation(selectRandom _formation);
_group setSpeedMode(selectRandom _speed);
//_state=behaviour((units _group)select 0);
_alive=true;

//_timeStamp=TIME;_group setVariable["dmpAItimestamp",_timeStamp,TRUE];

//while{(_state=="Safe")}do{
while{TRUE}do{
	sleep 5;
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	if!((toUpper(behaviour((units _group)select 0)))=="SAFE")exitWith{};
	//if((_group getVariable"dmpAItimestamp")>_timeStamp)exitWith{};
	//_state=behaviour((units _group)select 0);
};
if!(_alive)exitWith{};
_group execVM"AO\Scripts\AI\EnhancedPatrolActivate.sqf";