private["_found","_type"];
_found=FALSE;
_type="";
{
//_type=toLower(typeOf _x);
_type=toLower format["%1",_x];
	{
	if((_type find _x)>-1)exitWith{_found=TRUE};
	}forEach dmpWaterSources;
	if(_found)exitWith{};
}forEach(nearestObjects[player,[],6]);
_found