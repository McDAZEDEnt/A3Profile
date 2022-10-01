// Basically parseSimpleArray but works whether there are brackets on the array or not
private["_string"];
_string=_this;
if(_string=="")exitWith{[]};
if!(((_string splitString"")select 0)=="[")then{_string=format["[%1]",_string]};
(parseSimpleArray _string)