
////////////////////////////////////////////////
//// CHANGE PLAYER LOADOUT TO FACTION LOADOUT
////////////////////////////////////////////////

	if (typeof player == "B_Soldier_SL_F") then {
		player setUnitLoadout blufor_SOLDIER_SL_X;
	};

///////////////////////////////////////////////
//// OLD STYLE -  if players get diff loadouts
///////////////////////////////////////////////

	if (typeof player == "B_Soldier_LAT_F") then {
		player setUnitLoadout blufor_SOLDIER_LAT_X;
	};
	
	if (typeof player == "B_Soldier_AR_F") then {
		player setUnitLoadout blufor_SOLDIER_AR_X;
	};
	
	if (typeof player == "B_engineer_F") then {
		player setUnitLoadout blufor_ENGINEER_X;
	};
	
	if (typeof player == "B_medic_F") then {
		player setUnitLoadout blufor_MEDIC_X;
	};
	
	if (typeof player == "B_recon_M_F") then {
		player setUnitLoadout blufor_MARKSMAN_X;
	};
	
	if (typeof player == "B_Soldier_F") then {
		player setUnitLoadout blufor_SOLDIER_X;
	};

	if (typeof player == "B_Soldier_GL_F") then {
		player setUnitLoadout blufor_SOLDIER_GL_X;
	};
