// Return type of item by slot etc
private["_item","_type"];
_item=_this;
_type="UNKNOWN";
if(getNumber(configFile>>"cfgWeapons">>_item>>"type")==0)then{_type="Item"};
if(getNumber(configFile>>"cfgWeapons">>_item>>"type")==4096)then{_type="Item"};
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==801)then{_type="Uniform"};
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==701)then{_type="Vest"};
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==605)then{_type="Headgear"};
//if((getText(configFile>>"cfgVehicles">>_item>>"vehicleClass"))isEqualTo"Backpacks")then{_type="Backpack"};
if(getText(configFile>>"cfgVehicles">>_item >>"vehicleClass")=="Backpacks")then{_type="Backpack"};
if(getNumber(configFile>>"cfgWeapons">>_item>>"type")==1)then{_type="Weapon"}; // Primary
if(getNumber(configFile>>"cfgWeapons">>_item>>"type")==2)then{_type="Weapon"}; // Handgun
if(getNumber(configFile>>"cfgWeapons">>_item>>"type")==4)then{_type="Weapon"}; // Secondary
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==101)then{_type="Attachment"}; // Muzzle
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==201)then{_type="Attachment"}; // Optic
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==301)then{_type="Attachment"}; // Pointer
if(getNumber(configFile>>"cfgWeapons">>_item>>"itemInfo">>"type")==302)then{_type="Attachment"}; // Bipod
if(isClass(configFile>>"cfgGlasses">>_item))then{_type="Glasses"};
if(isClass(configFile>>"cfgMagazines">>_item))then{_type="Magazine"};
_type