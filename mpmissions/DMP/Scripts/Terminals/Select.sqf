private["_index","_dataString","_unit"];
disableSerialization;
_index=lbCurSel 7010;
_dataString=lbData[7010,_index];
_unit=objNull;
if(dmpTerminalMode=="GENERAL")exitWith{
	if(_dataString=="")exitWith{};
	dmpSelectedTerminal execVM _dataString;
};
{if((str _x)==_dataString)exitWith{_unit=_x}}forEach allUnitsUAV;
if(isNull _unit)exitWith{};
dmpSelectedTerminalSystem=_unit;