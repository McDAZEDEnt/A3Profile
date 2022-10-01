private["_group","_exit","_menStart","_leader","_leaderValue","_menAlive","_menAliveLast","_cycle","_morale","_men","_nearFriendlies","_side","_surrenderChance","_threshold","_thresholdInc","_exit","_anim"];
_group=_this;
_exit=FALSE;
{if(isPlayer _x)exitWith{_exit=TRUE}}forEach(units _group);
if(_exit)exitWith{};
sleep 5;
_menStart=count(units _group);
_leader=leader _group;
_leaderValue=0;
_menAlive=0;
_menAliveLast=0;
_leaderValue=_leader call DMP_fnc_MoraleLeaderValue;
_group deleteGroupWhenEmpty TRUE;
_cycle=0+dmpMoraleCycle;
_morale=100;
_men=units _group;
_nearFriendlies=0;
_side=side _leader;
_surrenderChance=0;
_threshold=1;
_thresholdInc=.33;
_exit=FALSE;
if(_side==WEST)then{_morale=dmpMoraleBaseWest;_surrenderChance=dmpMoraleSurrenderWest};
if(_side==EAST)then{_morale=dmpMoraleBaseEast;_surrenderChance=dmpMoraleSurrenderEast};
if(_side==RESISTANCE)then{_morale=dmpMoraleBaseRes;_surrenderChance=dmpMoraleSurrenderRes};
while{TRUE}do{
    if(isNull _group)exitWith{if(dmpDebug)then{systemChat format["%1 morale OUT (group destroyed)",_group]};};
	_men=units _group;
	{if!(alive _x)then{_men=_men-[_x]}}forEach _men;
	_menAlive=count _men;
	if(dmpDebug)then{systemChat format["%1 MORALE: %2   MEN: %3 CHECK AT: <%4",_group,_morale,_menAlive,floor(_menStart*_threshold)]};
	if(_menAlive<1)exitWith{if(dmpDebug)then{systemChat format["%1 morale OUT (group destroyed)",_group]};};
	_check=FALSE;
	//if!((behaviour _group)=="SAFE")then{_check=TRUE};
	if!(alive _leader)then{
		_check=TRUE;
		_morale=_morale-_leaderValue;
		_leader=leader _group;
		_leaderValue=_leader call DMP_fnc_MoraleLeaderValue;
	};
	if(_menAlive<(floor(_menStart*_threshold)))then{
		_check=TRUE;
		_threshold=_threshold-_thresholdInc;
		if(_threshold<_thresholdInc)then{_threshold=.01};
	};
	if(_check)then{
		if(dmpDebug)then{systemChat format["%1 checking morale:  (%2)",_group,_morale]};
		if(_menAlive<_menAliveLast)then{_morale=_morale-((_menAliveLast-_menAlive)*5)};
		if(fleeing _leader)then{_morale=_morale-20};
		_nearFriendlies=_leader call DMP_fnc_MoraleNearFriendlies;
		if((random 100)>(_morale+_nearFriendlies))then{
			if(dmpDebug)then{systemChat format["%1 FAILED a morale check (%2)",_group,_morale]};
			_exit=TRUE;
		}else{if(dmpDebug)then{systemChat format["%1 PASSED a morale check (%2)",_group,_morale]}}
	};
	if(_exit)exitWith{};
	sleep _cycle;
};
_leader=leader _group;
_men=units _group;
{if!(alive _x)then{_men=_men-[_x]}}forEach _men;
if((count _men)<1)exitWith{};
if((random 100)<(_surrenderChance+(_leader call DMP_fnc_MoraleNearFriendlies)))exitWith{
	if((_leader call DMP_fnc_MoraleNearEnemies)<1)exitWith{};
	{[_x]spawn DMP_fnc_Surrender}forEach _men;
};
_group setSpeedMode"FULL";
_group setCombatMode"GREEN";
{
//if((random 1)>(skill _x))then{_x execVM"Scripts\Cower.sqf"};
if((random 100)>50)then{_x execVM"DMP\Scripts\Morale\Cower.sqf"};
[_x,0.2]remoteExec["setSkill"];
[_x,1]remoteExec["allowFleeing"];
//[_x,["general",0.1]]remoteExec["setSkill"];
[_x,["courage",0]]remoteExec["setSkill"];
[_x,["aimingAccuracy",0]]remoteExec["setSkill"];
[_x,1]remoteExec["setSuppression"];
}forEach _men;