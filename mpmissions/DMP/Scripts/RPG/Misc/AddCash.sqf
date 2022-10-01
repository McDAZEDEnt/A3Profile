private["_target","_cash"];
_target=_this select 0;
_cash=_this select 1;
if(isNull _target)then{_target=player};
if!(player==_target)exitWith{};
dmpPlayerCash=dmpPlayerCash+_cash;
dmpPlayerCash=round dmpPlayerCash;