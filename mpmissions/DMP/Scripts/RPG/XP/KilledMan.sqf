private["_man","_shooter","_type"];
_man=_this select 0;
_shooter=_this select 2;
_type=typeOf _man;
if(dmpDebug)then{systemChat format["%1 killed %2",_shooter,_type]};
[[_shooter,1],"DMP\Scripts\RPG\XP\AddXP.sqf"]remoteExec["execVM"];