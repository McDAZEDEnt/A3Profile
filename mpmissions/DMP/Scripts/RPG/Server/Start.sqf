private["_registered","_units"];
_registered=[];
_units=[];
while{TRUE}do{
	_units=allUnits-_registered;
	{
	_registered pushBackUnique _x;
	if(_x isKindOf"man")then{
		if(isPlayer _x)exitWith{};
		_x execVM"DMP\Scripts\RPG\Server\EquipMan.sqf";
		_x addMPEventHandler["mpKilled",{_this execVM"DMP\Scripts\RPG\XP\KilledMan.sqf"}];
	};
	}forEach _units;
	sleep 60;
};