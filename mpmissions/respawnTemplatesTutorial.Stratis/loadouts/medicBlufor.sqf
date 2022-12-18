_unit = _this select 0;
sleep 2;
//medic
hint "Medic Kit Given";

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
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "16Rnd_9x21_Mag";
_unit addItemToUniform "30Rnd_65x39_caseless_mag";
_unit addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 4 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "B_AssaultPack_mcamo";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 6 do {_unit addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_HelmetB_black";

comment "Add weapons";
_unit addWeapon "arifle_MXC_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Holosight";
_unit addWeapon "hgun_P07_F";
_unit addWeapon "Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "NVGoggles";
