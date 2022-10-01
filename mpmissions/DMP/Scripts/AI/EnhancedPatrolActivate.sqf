// Makes a group patrol randomly. When they leave safe mode, they will take random actions
// Once the action is started, the group will not return to patrol mode. This script is not suitable for long/persistent missions. It is designed to provide unpredictable reactions on first contact with enemy AI. It is not designed for comprehensive and sustained AI improvement
private["_group","_pos","_behaviour","_combatMode","_formation","_speed","_alive","_actions","_action","_wp","_targets","_target"];
_group=_this;
_pos=(getPos leader _group);
_behaviour=["Aware","Combat","Stealth"];
_combatMode=["Yellow","Red"];
_formation=["COLUMN","FILE","DIAMOND","WEDGE","VEE","LINE","ECH LEFT","ECH RIGHT","STAG COLUMN"];
_speed=["Limited","Normal","Full"];
// Group goes out of safe/patrol mode
//[_group]call CBA_fnc_clearWaypoints;
{deleteWaypoint _x}forEach(waypoints _group);
sleep(random 2);
_group setBehaviour(selectRandom _behaviour);
_group setCombatMode(selectRandom _combatMode);
_group setFormation(selectRandom _formation);
_group setSpeedMode(selectRandom _speed);
//if(dmpDebug)then{systemChat format["%1: %2 %3 %4",(behaviour (leader _group)),(combatMode _group),(formation _group),(speedMode _group)]};
// Choose a new action to take
_actions=["Guard","Search","Defend","Attack"];
_actions=["Guard"];
_action="";
_action=(selectRandom _actions);
//if(dmpDebug)then{systemChat format["%1 action is %2",_group,_action]};
// Guard waypoints will make the group respond to threats spotted by other groups
_wp=[];
if(_action=="Guard")then{_wp=_group addWaypoint[_pos,0];_wp setWaypointType"Guard"};
if(_action=="Search")then{_wp=_group addWaypoint[_pos,0];_wp setWaypointType"SAD"};
if(_action=="Defend")then{_wp=_group addWaypoint[_pos,0];_wp setWaypointType"HOLD"};
_targets=[];
_target=objNull;
if(_action=="Attack")then{
	_targets=[(leader _group),1000]call BIS_fnc_enemyTargets;
	if((count _targets)==0)exitWith{_wp=_group addWaypoint[_pos,0];_wp setWaypointType"Guard"};
	_target=(selectRandom _targets);
	_pos=getPos _target;
	_wp=_group addWaypoint[_pos,0];_wp setWaypointType"SAD"
};
// Attempt to call out the contact to other groups
// Delay before a radio message can be made
_delay=5+(random 5);
sleep _delay;
//_alive=_group call dts_fnc_GroupIsAlive;
if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
//_group call dmp_fnc_ReportContact;
_group execVM"DMP\Scripts\AI\ReportContact.sqf";