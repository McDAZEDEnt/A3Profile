_unit = _this select 0;
sleep 2;
hint "Basic Loadout Given";

//RifleBasic
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
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag";};
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "16Rnd_9x21_Mag";
_unit addVest "V_PlateCarrier1_rgr";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "Chemlight_green";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addBackpack "B_AssaultPack_mcamo";
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_HelmetB";

comment "Add weapons";
_unit addWeapon "arifle_MX_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Aco";
_unit addWeapon "hgun_P07_F";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "NVGoggles";