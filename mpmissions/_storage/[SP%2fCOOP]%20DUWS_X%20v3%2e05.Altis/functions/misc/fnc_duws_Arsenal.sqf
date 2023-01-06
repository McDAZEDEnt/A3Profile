/*
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	[player, player, true] call ace_arsenal_fnc_openBox;
} else {
	if (restricted_arsenal == true) then {
		["Open",false] call BIS_fnc_arsenal;
	} else {
		["Open",true] call BIS_fnc_arsenal;
	};
};
*/


if (restricted_arsenal == true) then {
	["Open",false] call BIS_fnc_arsenal;
} else {
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[player, player, true] call ace_arsenal_fnc_openBox;
	} else {
		["Open",true] call BIS_fnc_arsenal;
	};
};
	
	
