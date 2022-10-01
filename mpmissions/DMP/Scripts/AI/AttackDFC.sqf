private["_group","_pos","_modules"];
_group=_this;
sleep(random 2);
if((random 100)>dmpDFCdefendGroupPOP)exitWith{_group call dmp_fnc_DeleteGroup};
_pos=dmpDFCstartPos;
_group setBehaviour"AWARE";
_group setCombatMode"YELLOW";
_group setFormation"LINE";
_group setSpeedmode"NORMAL";

[_group,(selectRandom dmpDFCspawnPoints)]call dmp_fnc_Teleport;
sleep 5;
//_group addWaypoint[_pos,0];_group addWaypoint[_pos,1];
_group move _pos;
{_x allowFleeing 0}forEach(units _group);
{_x execVM"DMP\Scripts\Defend\PrepMan.sqf";dmpDFCenemyCount=dmpDFCenemyCount+1}forEach(units _group);
while{TRUE}do{
	if!(_group call dmp_fnc_GroupIsAlive)exitWith{};
	if(((leader _group)distance2D _pos)<100)exitWith{[_group,_pos]execVM"DMP\Scripts\AI\Search.sqf"};
	sleep 60;
	_group move _pos;
};