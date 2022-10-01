private["_module","_units","_activated"];
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
sleep .1;
if!(isServer)exitWith{};
waitUntil{!(isNil"dmpReady")};waitUntil{dmpReady};

if(_activated)then{
[
(_module getVariable"dmpDynamicLoot"),
(_module getVariable"dmpStaticLoot"),
(_module getVariable"dmpBaseWeapons"),
(_module getVariable"dmpBISmedical"),
(_module getVariable"dmpBISweapons"),
(_module getVariable"dmpBISitems"),
(_module getVariable"dmpBISuniforms"),
(_module getVariable"dmpBISvests"),
(_module getVariable"dmpBISheadgear"),
(_module getVariable"dmpBISgoggles"),
(_module getVariable"dmpBISpacks"),
(_module getVariable"dmpFood"),
(_module getVariable"dmpMedical"),
(_module getVariable"dmpItems"),
(_module getVariable"dmpChanceHouse"),
(_module getVariable"dmpChanceFood"),
(_module getVariable"dmpChanceMedical"),
(_module getVariable"dmpChanceMisc"),
(_module getVariable"dmpChanceWeapon"),
(_module getVariable"dmpChanceAttachment"),
(_module getVariable"dmpChanceMagazine"),
(_module getVariable"dmpChanceUniform"),
(_module getVariable"dmpChanceVest"),
(_module getVariable"dmpChanceHeadgear"),
(_module getVariable"dmpChancePack"),
(_module getVariable"dmpChanceGoggle"),
(_module getVariable"dmpChanceMagazineRandom"),
(_module getVariable"dmpChanceHouseM"),
(_module getVariable"dmpChanceFoodM"),
(_module getVariable"dmpChanceMedicalM"),
(_module getVariable"dmpChanceMiscM"),
(_module getVariable"dmpChanceWeaponM"),
(_module getVariable"dmpChanceAttachmentM"),
(_module getVariable"dmpChanceMagazineM"),
(_module getVariable"dmpChanceUniformM"),
(_module getVariable"dmpChanceVestM"),
(_module getVariable"dmpChanceHeadgearM"),
(_module getVariable"dmpChancePackM"),
(_module getVariable"dmpChanceGoggleM"),
(_module getVariable"dmpChanceMagazineRandomM")
]execVM"DMP\Scripts\Loot\Start.sqf";
};
TRUE