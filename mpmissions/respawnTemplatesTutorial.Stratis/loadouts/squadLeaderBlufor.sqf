
//SquadLeader
_unit = _this select 0;
comment "Exported from Arsenal by |TG| Unkl";
sleep 2;
hint "Squd Leader Kit Given";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "16Rnd_9x21_Mag";
_unit addItemToUniform "30Rnd_65x39_caseless_mag";
_unit addItemToUniform "30Rnd_65x39_caseless_mag_Tracer";
_unit addVest "V_PlateCarrier1_rgr";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
_unit addItemToVest "B_IR_Grenade";
_unit addItemToVest "SmokeShellBlue";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "SmokeShellOrange";
_unit addBackpack "B_AssaultPack_mcamo";
for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "MiniGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToBackpack "SmokeShellBlue";
_unit addItemToBackpack "SmokeShellGreen";
_unit addItemToBackpack "SmokeShellOrange";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
_unit addHeadgear "H_HelmetSpecB_sand";

comment "Add weapons";
_unit addWeapon "arifle_MX_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Hamr";
_unit addWeapon "hgun_P07_F";
_unit addWeapon "Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "NVGoggles";