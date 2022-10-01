private["_weapon","_price","_type"];
_weapon=_this;
_price=2;
_type=_weapon call BIS_fnc_itemType;
switch(_type select 1)do{
	case"MachineGun":{_price=4};
	case"Mortar":{_price=10};
	case"GrenadeLauncher":{_price=7};
	case"BombLauncher":{_price=10};
	case"MissileLauncher":{_price=15};
	case"RocketLauncher":{_price=10};
	case"Cannon":{_price=20};
	default{_price=2};
};
ceil _price