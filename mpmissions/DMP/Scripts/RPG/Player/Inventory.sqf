private["_action"];
_action=_this;
if(dmpDebug)then{systemChat _action};
if(_action=="Primary")exitWith{if((primaryWeapon player)=="")exitWith{};closeDialog 0;player selectWeapon(primaryWeapon player)};
if(_action=="Secondary")exitWith{if((secondaryWeapon player)=="")exitWith{};closeDialog 0;player selectWeapon(secondaryWeapon player)};
if(_action=="Handgun")exitWith{if((handgunWeapon player)=="")exitWith{};closeDialog 0;player selectWeapon(handgunWeapon player)};
if!(dmpScriptInventory=="")exitWith{_action execVM dmpScriptInventory};