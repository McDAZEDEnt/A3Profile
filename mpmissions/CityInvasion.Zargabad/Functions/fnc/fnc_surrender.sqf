
redco setCaptive true;

redco addEventHandler ["FiredNear",

{
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
	_unit = (_this select 0);
	_firer = (_this select 1);
	_distance = (_this select 2);

	if 
	(_distance < 15 && isPlayer _firer)
	then
	{
		[_unit, true] call ACE_captives_fnc_setSurrendered;
	}
	else
	{
		exitWith {};
	};
}];