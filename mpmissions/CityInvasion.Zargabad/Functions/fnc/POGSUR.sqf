_unit = _this select 0;
_bad = _this select 1;
_nearguy = _this select 2;
_fear = _this select 3;

_unit setUnitPos "AUTO";
_unit enableai "PATH";
_unit setCombatMode "BLUE";
_unit leaveVehicle vehicle _unit;
doGetOut _unit;
_unit action ["Eject", vehicle _unit];
sleep .1;
_weapon = currentWeapon _unit;       
_unit removeWeapon (currentWeapon _unit);
sleep .1;
_weaponHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
_weaponHolder addWeaponCargoGlobal [_weapon,1];
_weaponHolder setPos (_unit modelToWorld [0,.2,1.2]);
_weaponHolder disableCollisionWith _unit;
_dir = random(360);
_speed = 1.5;
_weaponHolder setVelocity [_speed * sin(_dir), _speed * cos(_dir),0];
_unit setUnitPos "UP";
_unit setBehaviour "SAFE";
_unit setSpeedMode "Limited";
sleep 0.1;
["ace_captives_setSurrendered",[_unit,true]] call CBA_fnc_globalEvent;


if (_bad == 1) then {
_badboy = selectRandom [0,1,2,3,4];
} else {_badboy = 0;};


if (_badboy == 1) then {
sleep random [0,60,120];
waitUntil {morale _unit >= _fear && !(_unit call BIS_fnc_enemyDetected) && _unit distance (_unit findNearestEnemy _unit) >= _nearguy && _unit getVariable ["ace_captives_isHandcuffed", false]};
["ace_captives_setSurrendered",[_unit,false]] call CBA_fnc_globalEvent;
_unit setUnitPos "AUTO";
_unit setBehaviour "AWARE";
_unit setSpeedMode "NORMAL";
} else {};