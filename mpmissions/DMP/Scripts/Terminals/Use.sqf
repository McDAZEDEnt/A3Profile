if(dialog)then{closeDialog 0};
sleep .2;
dmpSelectedTerminal=objNull;
dmpSelectedTerminal=_this select 0;
[]spawn DMP_fnc_TerminalDialog;