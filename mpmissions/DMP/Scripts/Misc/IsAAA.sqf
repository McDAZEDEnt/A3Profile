// Checks if a vehicle is AAA by checking if it is a landvehicle vehicle, has a radar and can fire bullets at aircraft
private["_v","_ammo","_isAAA","_mags","_parents"];
_v=_this;
_isAAA=false;
_ammo="";
_mags=magazinesAllTurrets _v;
_parents=[];
if(_v isKindOf"LandVehicle")then{
	if(getNumber(configfile>>"CfgVehicles">>typeOf _v>>"radarType")<2)exitWith{_isAAA=false};
	{
	_ammo=getText(configfile>>"CfgMagazines">>(_x select 0)>>"ammo");
	_parents=[configfile>>"CfgAmmo">>_ammo,true]call BIS_fnc_returnParents;
	if(("BulletBase"in _parents)OR("BulletCore"in _parents))then{
		if((getNumber(configfile>>"CfgAmmo">>_ammo>>"airLock"))>0)exitWith{_isAAA=true};
	};
	}forEach _mags;
};
_isAAA