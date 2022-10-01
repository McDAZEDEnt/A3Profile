private["_index","_unitString","_unit","_group","_action","_remote","_password"];
disableSerialization;
_index=lbCurSel 7011;
_action=lbData[7011,_index];
_group=grpNull;
_password="";
if(_action=="EXIT")exitWith{
	closeDialog 0;
	if!(isNil{dmpSelectedTerminal getVariable"dmpTerminalPasswordMain"})then{
		_password=dmpSelectedTerminal getVariable"dmpTerminalPasswordMain";
		dmpSelectedTerminal setVariable["dmpTerminalPassword",_password,TRUE];
		dmpTerminalMode="SECURITY";
	};
};
if(dmpTerminalMode=="GENERAL")exitWith{};
// Security stuff
if(isNull dmpSelectedTerminalSystem)exitWith{hintSilent"No remote selected"};
_remote=dmpSelectedTerminalSystem;
if(_action=="DESTROY")then{_remote setDammage 1};
if(_action=="OFF")then{{deleteVehicle _x}forEach(crew _remote)};
if(_action=="WEST")then{
	if((side _remote)==WEST)then{};
	{deleteVehicle _x}forEach(crew _remote);
	createVehicleCrew _remote;
	_group=createGroup WEST;
	{[_x]joinSilent _group}forEach(crew _remote);
};
if(_action=="EAST")then{
	if((side _remote)==EAST)then{};
	{deleteVehicle _x}forEach(crew _remote);
	createVehicleCrew _remote;
	_group=createGroup EAST;
	{[_x]joinSilent _group}forEach(crew _remote);
};
if(_action=="RES")then{
	if((side _remote)==RESISTANCE)then{};
	createVehicleCrew _remote;
	_group=createGroup RESISTANCE;
	{[_x]joinSilent _group}forEach(crew _remote);
};
if(_action=="CIV")then{
	if((side _remote)==RESISTANCE)then{};
	createVehicleCrew _remote;
	_group=createGroup CIVILIAN;
	{[_x]joinSilent _group}forEach(crew _remote);
};
[]spawn DMP_fnc_TerminalDialog;