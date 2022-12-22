params["_unit","_isDisabled"];
_unit = (_this select 0);
_isDisabled = (_this select 1);

if not (

	(typeOf _unit) == "NR6_HAL_Leader_Module"

) then 
{

	(group _unit) setVariable ["Unable",_isDisabled]

};
