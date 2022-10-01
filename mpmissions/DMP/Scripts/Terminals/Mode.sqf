if(dmpTerminalMode=="SECURITY")exitWith{
	dmpTerminalMode="GENERAL";
	[]spawn DMP_fnc_TerminalDialog;
};
dmpTerminalMode="SECURITY";
[]spawn DMP_fnc_TerminalDialog;