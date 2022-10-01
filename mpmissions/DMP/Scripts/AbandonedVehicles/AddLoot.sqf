private["_vehicle"];
_vehicle=_this;
// New loot system
if((count(entities"DMP_Loot"))>0)exitWith{
	waitUntil{!(isNil"dmpLootReady")};waitUntil{dmpLootReady};
	[(getPos _vehicle),FALSE,_vehicle]execVM"DMP\Scripts\Loot\GenerateStash.sqf";
};
// Old loot system
if(dmpLoot)then{[(getPos _vehicle),FALSE,_vehicle]execVM"DMP\Scripts\Loot\Old\GenerateStash.sqf"};