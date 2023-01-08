
//////////////////////////////////////////
// BLUFOR SQUADS and PATROLS
//  - REQUEST, AI Task Force and Patrols
//////////////////////////////////////////
// fnc_request_squad
//   _index = lbCurSel 2101;
// fnc_request_squad_fob
//   _index = lbCurSel 2121;
//////////////////////////////////////////

diag_log format ["Squad File Init"];

switch (VERSION_X) do {
	case "MODERN": {

		// Create a squad/team
		_reconteam = [blufor_SPECOPS_X, blufor_SPECOPS_GL_X, blufor_SPECOPS_MG_X, blufor_SPECOPS_LAT_X];
		_infteam  = [blufor_SOLDIER_TL_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_AR_X];
		_squad = [blufor_SOLDIER_SL_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_AR_X];

		// Combine vehicle with squad/team
		_motor = [selectRandom [blufor_CAR_PATROL1_X,blufor_CAR_PATROL1_X]] + _reconteam;
		_mech  = [selectRandom [blufor_APC_PATROL1_X,blufor_APC_PATROL2_X]] + _infteam;
		_armor = [selectRandom [blufor_TANK_PATROL1_X,blufor_TANK_PATROL1_X]] + _infteam;

		// Define Squad variable
		blufor_RECON_TEAM_X = [_reconteam,"Recon Team (10CP)",10];
		blufor_INF_SQUAD_X = [_squad,"Infantry Squad (18CP)",18];
		blufor_MOTOR_SECTION_X = [_motor,"Motorized Team (25CP)",25];
		blufor_MECH_SECTION_X = [_mech,"Mechanized Team (40CP)",40];
		blufor_ARMOR_SECTION_X = [_armor,"Armor Section (50CP)",50];

		publicVariable "blufor_RECON_TEAM_X";
		publicVariable "blufor_INF_SQUAD_X";
		publicVariable "blufor_MOTOR_SECTION_X";
		publicVariable "blufor_MECH_SECTION_X";
		publicVariable "blufor_ARMOR_SECTION_X";
		
		/*publicVariable "blufor_PLANE_CAS_X";
		publicVariable "blufor_CAR_PATROL1_X";
		publicVariable "blufor_APC_PATROL1_X";
		publicVariable "blufor_APC_PATROL2_X";
		publicVariable "blufor_TANK_PATROL1_X";*/

	};
	case "WW2": {

		// Create a squad/team
		_reconteam = [blufor_SPECOPS_X, blufor_SPECOPS_GL_X, blufor_SPECOPS_MG_X, blufor_SPECOPS_LAT_X];
		_infteam  = [blufor_SOLDIER_TL_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_AR_X];
		_squad = [blufor_SOLDIER_SL_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_AR_X];

		// Combine vehicle with squad/team
		_motor = [selectRandom [blufor_CAR_PATROL1_X,blufor_CAR_PATROL1_X]] + _reconteam;
		_mech  = [selectRandom [blufor_APC_PATROL1_X,blufor_APC_PATROL2_X]] + _infteam;
		_armor = [selectRandom [blufor_TANK_PATROL1_X,blufor_TANK_PATROL1_X]] + _infteam;

		// Define Squad variable
		blufor_RECON_TEAM_X = [_reconteam,"Recon Team (10CP)",10];
		blufor_INF_SQUAD_X = [_squad,"Infantry Squad (18CP)",18];
		blufor_MOTOR_SECTION_X = [_motor,"Motorized Team (25CP)",25];
		blufor_MECH_SECTION_X = [_mech,"Mechanized Team (40CP)",40];
		blufor_ARMOR_SECTION_X = [_armor,"Armor Section (50CP)",50];

		publicVariable "blufor_RECON_TEAM_X";
		publicVariable "blufor_INF_SQUAD_X";
		publicVariable "blufor_MOTOR_SECTION_X";
		publicVariable "blufor_MECH_SECTION_X";
		publicVariable "blufor_ARMOR_SECTION_X";

		//Dang Edit extra tanks and extra planes for secret weapons
		_armor1 = [blufor_TANK_PATROL2_X] + _infteam;
		_armor2 = [blufor_TANK_PATROL5_X] + _infteam;
		blufor_ARMOR_SECTION1_X = [_armor1,"Medium Armor Section (50CP)",50];
		blufor_HEAVY_TANK_SECTION_X = [_armor2,"Heavy Tank (60CP)",60];

		publicVariable "blufor_ARMOR_SECTION1_X";
		publicVariable "blufor_HEAVY_TANK_SECTION_X";
		
		/*publicVariable "blufor_PLANE_PATROL_X";
		publicVariable "blufor_PLANE_PATROL1_X";
		publicVariable "blufor_PLANE_PATROL2_X";
		publicVariable "blufor_PLANE_PATROL3_X";
		publicVariable "blufor_PLANE_PATROL4_X";
		publicVariable "blufor_PLANE_FIGHTER_X";
		publicVariable "blufor_TANK_PATROL_X";
		publicVariable "blufor_TANK_PATROL2_X";
		publicVariable "blufor_TANK_PATROL3_X";
		publicVariable "blufor_TANK_PATROL4_X";
		publicVariable "blufor_TANK_PATROL5_X";*/
	};
	case "VIETNAM": {

		// Create a squad/team
		_reconteam = [blufor_SPECOPS_X, blufor_SPECOPS_GL_X, blufor_SPECOPS_MG_X, blufor_SPECOPS_LAT_X];
		_infteam  = [blufor_SOLDIER_TL_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_AR_X];
		_squad = [blufor_SOLDIER_SL_X, blufor_SOLDIER_X, blufor_SOLDIER_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_GL_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_LAT_X, blufor_SOLDIER_AR_X];
		_specsquad = [blufor_SPECOPS_SL_X, blufor_SPECOPS_AA_X, blufor_SPECOPS_MEDIC_X, blufor_SPECOPS_GL_X, blufor_SPECOPS_GL_X, blufor_SPECOPS_LAT_X, blufor_SPECOPS_HAT_X, blufor_SPECOPS_MG_X];

		// Combine vehicle with squad/team
		_motor = [selectRandom [blufor_CAR_PATROL1_X,blufor_CAR_PATROL1_X]] + _reconteam;
		_mech  = [blufor_APC_PATROL2_X] + _infteam;
		_armor = [blufor_TANK_PATROL2_X] + _infteam;

		// Define Squad variable
		blufor_RECON_TEAM_X = [_reconteam,"Recon Team (10CP)",10];
		blufor_INF_SQUAD_X = [_squad,"Infantry Squad (18CP)",18];
		blufor_SPEC_SQUAD_X = [_specsquad,"Spec Ops Squad (20CP)",20];
		
		blufor_MOTOR_SECTION_X = [_motor,"Motorized Team (25CP)",25];
		blufor_MECH_SECTION_X = [_mech,"Mechanized Team (40CP)",40];
		blufor_ARMOR_SECTION_X = [_armor,"Armor Section (50CP)",50];

		publicVariable "blufor_SPEC_SQUAD_X";
		publicVariable "blufor_RECON_TEAM_X";
		publicVariable "blufor_INF_SQUAD_X";
		publicVariable "blufor_MOTOR_SECTION_X";
		publicVariable "blufor_MECH_SECTION_X";
		publicVariable "blufor_ARMOR_SECTION_X";
	
		//Dang Edit extra tanks
		_AATank = [blufor_APC_PATROL1_X] + _infteam;
		_armor1 = [blufor_TANK_PATROL1_X] + _infteam;
		blufor_AA_TANK_SECTION_X = [_AATank,"AA Tank (40CP)",40];
		blufor_HEAVY_TANK_SECTION_X = [_armor1,"Heavy Tank (60CP)",60];

		publicVariable "blufor_AA_TANK_SECTION_X";
		publicVariable "blufor_HEAVY_TANK_SECTION_X";
	};
};

diag_log format ["Squad file Armor Section: %1", str blufor_ARMOR_SECTION_X];



