private["_object","_password","_name","_chat","_dialog","_list","_dialogOptions","_radius","_remotes","_colour","_name","_actions"];
if(!dialog)then{createDialog"dmp_DialogTerminal"};
{ctrlShow[_x,FALSE]}forEach[7002,7010,7011,7020,7021,7022];
if(isNull dmpSelectedTerminal)exitWith{hint"Remote system not found"};
_object=dmpSelectedTerminal;
_password="";
if!(isNil{dmpSelectedTerminal getVariable"dmpTerminalPassword"})then{_password=dmpSelectedTerminal getVariable"dmpTerminalPassword"};
_name=str _object;
if((_name find"#")>-1)then{_name=(typeOf _object)call DMP_fnc_GetDisplayName}else{
	_name=(str _object)splitString"-_"joinString" ";
};
((findDisplay 7000)displayCtrl 7001)ctrlSetText format["Accessing %1",_name];
if!(_password=="")exitWith{{ctrlShow[_x,TRUE]}forEach[7020,7021,7022]};
{ctrlShow[_x,TRUE]}forEach[7001,7002,7010,7011];
((findDisplay 7000)displayCtrl 7002)ctrlSetText format["%1",dmpTerminalMode];
_chat="";
{ctrlEnable[_x,TRUE]}forEach[7010,7011];
_dialog=findDisplay 7000;
_list=_dialog displayCtrl 7010;
lbClear _list;
_dialogOptions=[];
_radius=30;
_remotes=[];
_colour=[];
_name="";
_actions=[];
// Security, drones etc
if(dmpTerminalMode=="SECURITY")exitWith{
	_remotes=synchronizedObjects _object;
	if(dmpDebug)then{hint format["Remotes:\n\n%1",_remotes]};
	{if!(alive _x)then{_remotes=_remotes-[_x];_object synchronizeObjectsRemove[_x]}}forEach _remotes;
	{
	if!(_x in _remotes)then{
		if!(alive _x)exitWith{};
		if((_x distance _object)<_radius)then{_remotes pushBack _x;_object synchronizeObjectsAdd[_x]};
	};
	}forEach allUnitsUAV;
	if(dmpDebug)then{systemChat format["Remotes 2: %1",_remotes]};
	{
	if((side _x)in[WEST,EAST,RESISTANCE])then{_name=format["%1  (%2)  %3",(typeOf _x)call DMP_fnc_GetDisplayName,(1-getDammage _x)*100,side _x]}else{_name=format["%1  (%2)",(typeOf _x)call DMP_fnc_GetDisplayName,(1-getDammage _x)*100]};
	_list lbAdd _name;
	_list lbSetData[(lbSize _list)-1,str _x];
	_colour=[1,1,1,1];
	if((count(crew _x))>0)then{_colour=[side _x,FALSE]call BIS_fnc_sideColor};
	_list lbSetColor[(lbSize _list)-1,_colour];
	}forEach _remotes;
	_list=_dialog displayCtrl 7011;
	lbClear _list;
	{
	_list lbAdd(_x select 0);
	_list lbSetData[(lbSize _list)-1,(_x select 1)]
	}forEach dmpTerminalActionsSecurity;
};
//General
if!(isNil{dmpSelectedTerminal getVariable"dmpTerminalActions"})then{_actions=dmpSelectedTerminal getVariable"dmpTerminalActions"};
//systemChat format["ACT: %1",_actions];
{
//systemChat format["_x: %1",_x];
_list lbAdd(_x select 0);
_list lbSetData[(lbSize _list)-1,_x select 1];
_colour=[1,1,1,1];
_list lbSetColor[(lbSize _list)-1,_colour];
}forEach _actions;
_list=_dialog displayCtrl 7011;
lbClear _list;
{
_list lbAdd(_x select 0);
_list lbSetData[(lbSize _list)-1,(_x select 1)]
}forEach dmpTerminalActionsGeneral;