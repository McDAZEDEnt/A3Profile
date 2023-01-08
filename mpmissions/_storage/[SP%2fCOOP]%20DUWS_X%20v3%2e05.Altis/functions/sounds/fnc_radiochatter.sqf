
// Play Radio sounds on an object
_object = _this select 0;
_arrayOfSounds = [];

// loop these every 120 sec
switch (VERSION_X) do {
	case "MODERN": {
		_arrayOfSounds = [
			"modern_radiochatter1",
			"modern_radiochatter2",
			"modern_radiochatter3",
			"dang_radiochatter1",
			"dang_radiochatter2",
			"dang_radiochatter3"
		];
	};
	case "WW2": {
		_arrayOfSounds = [
			"dang_radiochatter1",
			"dang_radiochatter2",
			"dang_radiochatter3"
		];
	};
	case "VIETNAM": {
		_arrayOfSounds = [
			"dang_radiochatter1",
			"dang_radiochatter2",
			"dang_radiochatter3"
		];
	};
};

_indexNb = (count _arrayOfSounds)-1;

fnc_say3d = {
	_speaker = _this select 0;
	_sound 	= _this select 1;
	//if (isDedicated) exitWith {};
	//if ((player distance _speaker) > 100) exitWith {}; //you probably don't need this, not sure
	_speaker say3d _sound;
};
publicVariable "fnc_say3d";

cancel_radio = false;
publicVariable "cancel_radio";
while {alive _object} do {
	if (cancel_radio) exitWith {};
	_pickedIndex = round random _indexNb;
	_pickedSound = _arrayOfSounds select _pickedIndex;
	//_object say3d _pickedSound;
	[_object,_pickedSound] remoteExec ['fnc_say3d', [0,-2] select isDedicated,false];
	sleep 120;
};

