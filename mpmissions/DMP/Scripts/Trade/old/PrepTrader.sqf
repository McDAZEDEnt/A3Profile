private["_man","_allowDamage","_allowMove","_marker","_garrison"];
_man=_this select 0;
_allowDamage=_this select 1;
_allowMove=_this select 2;
_garrison=_this select 3;

if!(_allowDamage)then{_man allowDamage FALSE};
if!(_allowMove)then{_man forceSpeed 0};

_man setVariable["dmpAItype","Trader",TRUE];
_man setVariable["dmpTraderInfo",[],TRUE];

if(_garrison)then{[group _man,200]execVM"DMP\Scripts\AI\Garrison.sqf";sleep 3};

//_man switchMove"Acts_millerCamp_A";_man disableAI"ALL";//_man setCaptive true;//_man triggerDynamicSimulation false;
_marker="";
if(dmpDebug)then{
	_marker=createMarkerLocal[format["dmpTrader_%1",_man],getPos _man];	
	_marker setMarkerTypeLocal"mil_flag";
	_marker setMarkerColorLocal"ColorBLUE";
	_marker setMarkerSizeLocal[.5,.5];
	_marker setMarkerText"Trader";
};
sleep 1;
_man execVM"DMP\Scripts\Trade\GenerateStock.sqf";

sleep 1;
[
_man,
"Trade",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
"\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa",
"_this distance _target < 3",
"_caller distance _target < 3",
{},
{},
{TRUE execVM"DMP\Scripts\Trade\Dialog.sqf"},
{},
[],
.5,
0,
FALSE,
FALSE
]remoteExec["BIS_fnc_holdActionAdd",0,_man];