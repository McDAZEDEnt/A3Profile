{
	_x setdammage 0;
} forEach call BIS_fnc_ListPlayers;

{
	if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
		[_x] call ace_medical_treatment_fnc_fullHealLocal;
	};
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[_x] call ace_medical_treatment_fnc_fullHealLocal;
	};
} forEach call BIS_fnc_ListPlayers;
