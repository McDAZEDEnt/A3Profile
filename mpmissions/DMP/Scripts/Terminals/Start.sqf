private["_info","_c","_terminals","_radius","_password","_actions","_object","_subSystems"];
/*
_info=[
//"Name", // Terminal name
[c1], // synced objects
"pw", // password
"[""Update Windows 10"",""test.sqf""],[""Update Windows 11"",""test.sqf""]", // custom array
30 // Radius to control drones
];
*/

_info=_this;
_c=0;
_terminals=_info select _c;_c=_c+1;
_password=_info select _c;_c=_c+1;
if((_info select _c)=="")then{_actions=[]}else{_actions=parseSimpleArray(_info select _c)};_c=_c+1;
//_actionsIn=parseSimpleArray(_info select _c)call dmp_fnc_ParseArray;_c=_c+1;
_radius=_info select _c;_c=_c+1;
_object=objNull;

_subSystems=[];
{if(unitIsUAV _x)then{_terminals=_terminals-[_x];_subSystems pushBack _x}}forEach _terminals;

dmpSelectedTerminal=objNull;
dmpSelectedTerminalSystem=objNull;
dmpTerminalMode="SECURITY";
dmpTerminalGeneral="";

dmpTerminalActionsSecurity=[
["Side to WEST","WEST"],
["Side to EAST","EAST"],
["Side to RESISTANCE","RES"],
["Side to CIVILIAN","CIV"],
["Turn system off","OFF"]
];

dmpTerminalActionsGeneral=[["Log Off","EXIT"]];
DMP_fnc_TerminalDialog=compile preprocessFile"DMP\Scripts\Terminals\TerminalDialog.sqf";

{
	_object=_x;
	_object setVariable["dmpTerminalRadius",_radius,TRUE];
	_object setVariable["dmpTerminalPassword",_password,TRUE];
	_object setVariable["dmpTerminalPasswordMain",_password,TRUE];
	_object setVariable["dmpTerminalActions",_actions,TRUE];
	_object setVariable["dmpTerminalSubsystems",_subSystems,TRUE];
	[
	_object,
	"Use terminal",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\upload_ca.paa",
	"\A3\ui_f\data\igui\cfg\simpleTasks\types\upload_ca.paa",
	"(((_this distance _target)<3)AND(cursorObject==_target))",
	"_caller distance _target < 3",
	{},
	{},
	{_this execVM"DMP\Scripts\Terminals\Use.sqf"},
	{},
	[],
	.3,
	0,
	FALSE,
	FALSE
	]remoteExec["BIS_fnc_holdActionAdd",0,_object];
}forEach _terminals;