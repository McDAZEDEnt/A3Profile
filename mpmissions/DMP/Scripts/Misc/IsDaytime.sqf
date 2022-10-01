private["_sunInfo","_sunRise","_sunSet"];
_sunInfo=date call BIS_fnc_sunriseSunsetTime;
_sunRise=_sunInfo select 0;
_sunSet=_sunInfo select 1;
if((daytime>_sunRise)AND(daytime<_sunSet))exitWith{TRUE};
FALSE