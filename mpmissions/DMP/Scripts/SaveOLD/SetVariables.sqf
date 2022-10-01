private["_object","_vars"];
_object=_this select 0;
_vars=_this select 1;
{_object setVariable[_x select 0,_x select 1,TRUE];}forEach _vars;