private["_unit","_shooter","_type"];
_unit=_this select 0;
_dam=getDammage player;

//"Save"execVM"DRPG\Scripts\Save\Save.sqf";systemChat"Save deleted";

// Looted and left for dead
if(_status=="Looted")then{
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeBackpack player;
	{player removeItem _x}forEach(items player);
	{player removeItem _x}forEach(assignedItems player);
	player setPos([getPos player,200]call dmp_fnc_ScatterCircle);
};

if(_status=="Rescued")then{
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeBackpack player;
	{player removeItem _x}forEach(items player);
	{player removeItem _x}forEach(assignedItems player);
	// near town
	// add uniform and some basic gear
};

player allowDammage TRUE;
player setDammage(random .6);
player setDir(random 360);
player playMove"AmovPpneMstpSnonWnonDnon";

if(_status=="Looted")then{_message="Looted and left for dead"};

systemChat _message;