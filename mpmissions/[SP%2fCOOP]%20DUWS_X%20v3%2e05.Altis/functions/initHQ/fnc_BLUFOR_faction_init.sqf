

/////////  BLUFOR INIT  ///////////////////

//hint "BLUFOR INIT";
switch (VERSION_X) do {
	case "MODERN": {
		if (BLUFOR_Faction_X == "BLU_F") then {
			BLUFOR_FactionFile_X = "BLU_F_ARID";
		};
	};
	case "WW2": {
		if (BLUFOR_Faction_X == "LIB_US_ARMY") then {
			BLUFOR_FactionFile_X = "IFA_US_ARMY";
		};
	};
	case "VIETNAM": {
		if (BLUFOR_Faction_X == "UNSUNG_W_US") then {
			BLUFOR_FactionFile_X = "UNSUNG_25ID_LRRPS_68";
		};
	};
};

{
	if (BLUFOR_Faction_X == (_x select 2)) then {
		BLUFOR_FactionFile_X = (_x select 2);
		BLUFOR_Faction_X = (_x select 0);	
	};
} foreach Factions_Available_BLUFOR_X;

diag_log format ["Faction init: %1", BLUFOR_FactionFile_X];

_factionFile = "FACTIONS\" + VERSION_X + "\" + BLUFOR_FactionFile_X + "_blufor.sqf";
fnc_BLUFOR_FactionFile_X = compile preprocessFileLineNumbers _factionFile;
[] call fnc_BLUFOR_FactionFile_X;
sleep 1;

diag_log format ["Faction init Faction file done"];

publicVariable "BLUFOR_Faction_X";
publicVariable "BLUFOR_FactionFile_X";
publicVariable "fnc_BLUFOR_FactionFile_X";



