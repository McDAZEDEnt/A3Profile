unitItems = [];
{unitItems = unitItems + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x)} forEach (allUnits);
unitItems = unitItems select {count _x > 0};
unitItems = unitItems arrayIntersect unitItems;
copyToClipboard str unitItems;