_playersWeapons = weapons player;
_playerRole = "BasicRifle";
_playerBackpackItems = backpackItems player;

if ("Binocular" in _playersWeapons) then {_playerRole = "SquadLeader";};
if ("launch_NLAW_F" in _playersWeapons) then {_playerRole = "LAT";};
if ("arifle_MX_SW_pointer_F" in _playersWeapons) then {_playerRole = "AR";};
if ("Medikit" in _playerBackpackItems) then {_playerRole = "Medic";};

player sideChat format ["Role: %1",_playerRole];


switch (_playerRole) do {
	case "SquadLeader":
	{
		_loadoutPlayer = [player]execVM "loadouts\squadLeaderBlufor.sqf";
		player setUnitTrait ["medic",false,false];		
	};
	
	case "Medic":
	{
		player setUnitTrait ["medic",true,false];
		_loadoutPlayer = [player]execVM "loadouts\medicBlufor.sqf";
	};
	
	case "BasicRifle":
	{
		_loadoutPlayer = [player]execVM "loadouts\rifleBasicBlufor.sqf";
		player setUnitTrait ["medic",false,false];		
	};
	
	case "LAT":
	{
		//_loadoutPlayer = [player]execVM "loadouts\rifleBasicBlufor.sqf";
		player setUnitTrait ["medic",false,false];		
	};

	case "AR":
	{
		//_loadoutPlayer = [player]execVM "loadouts\rifleBasicBlufor.sqf";
		player setUnitTrait ["medic",false,false];		
	};
	
};

