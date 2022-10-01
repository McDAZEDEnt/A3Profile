private["_object","_vars"];
_object=_this;
_vars=[];
{_vars pushBack[_x,(_object getVariable _x)]}forEach(allVariables _object);
_vars