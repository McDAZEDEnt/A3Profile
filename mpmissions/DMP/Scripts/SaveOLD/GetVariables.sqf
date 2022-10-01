private["_vars"];
_vars=[];
{_vars pushBack[(_x,_this getVariable _x)]}forEach(allVariables _this);
_vars