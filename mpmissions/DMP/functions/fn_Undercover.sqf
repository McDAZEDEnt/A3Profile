private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
//if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};
sleep 1;
{
dmpUndercoverClothes pushBackUnique(headgear _x);
dmpUndercoverClothes pushBackUnique(vest _x);
dmpUndercoverClothes pushBackUnique(uniform _x);
if(isServer)then{deleteVehicle _x};
}forEach _units;

if(_activated)then{
	if(local player)then{
		if!(player in _units)exitWith{};
		[
		(_module getVariable"dmpDebug"),
		(_module getVariable"dmpCivsReveal"),
		(_module getVariable"dmpWeaponsAllowed"),
		(_module getVariable"dmpBackpacksAllowed"),
		(_module getVariable"dmpAlertDistance"),
		(_module getVariable"dmpAlertDistanceWeapon"),
		(_module getVariable"dmpAlertDistanceGear"),
		(_module getVariable"dmpAlertDistanceVehicle"),
		(_module getVariable"dmpKnowsAbout"),
		(_module getVariable"dmpCycle")
		]execVM"DMP\Scripts\Stealth\Undercover.sqf";
	};
};
TRUE