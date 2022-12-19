
/////////   OPFOR FACTION INIT  ///////////////////

//hint "OPFOR FACTION INIT";

switch (VERSION_X) do {
	case "MODERN": {
		if (OPFOR_Faction_X == "OPF_F") then {
			OPFOR_FactionFile_X = "OPF_F_ARID";
		};
	};
	case "WW2": {
		if (OPFOR_Faction_X == "LIB_WEHRMACHT") then {
			OPFOR_FactionFile_X = "IFA_WEHRMACHT";
		};
	};
	case "VIETNAM": {
		if (OPFOR_Faction_X == "UNSUNG_E_NVA") then {
			OPFOR_FactionFile_X = "UNSUNG_NVA_68";
		};
	};
};
	
{
	if (OPFOR_Faction_X == (_x select 2)) then {
		OPFOR_FactionFile_X = (_x select 2);
		OPFOR_Faction_X = (_x select 0);	
	};
} foreach Factions_Available_OPFOR_X;

_factionFile = "FACTIONS\" + VERSION_X + "\" + OPFOR_FactionFile_X + "_opfor.sqf";
fnc_OPFOR_FactionFile_X = compile preprocessFileLineNumbers _factionFile;
[] call fnc_OPFOR_FactionFile_X;
sleep 1;

publicVariable "OPFOR_FactionFile_X";
publicVariable "OPFOR_Faction_X";
publicVariable "fnc_OPFOR_FactionFile_X";

// R3F logistics needs to know these values
publicVariable "opfor_TRANS_TRUCK_X";
publicVariable "opfor_AMMO_TRUCK_X";


