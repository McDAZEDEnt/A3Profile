private["_password","_text"];
_password=dmpSelectedTerminal getVariable"dmpTerminalPassword";
_text=ctrlText 7021;
//systemChat format["PW: %1   TEXT: %2",_password,_text];
if!(_password==_text)exitWith{hint"Incorrect password"};
dmpSelectedTerminal setVariable["dmpTerminalPassword","",TRUE];
[]spawn DMP_fnc_TerminalDialog;