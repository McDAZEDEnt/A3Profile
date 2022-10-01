private["_module","_units","_activated"];
sleep .3;
_module=_this select 0;
_units=_this select 1;
_activated=_this select 2;
if(_activated)then{
[
(_module getVariable"dmpCycle"),
(_module getVariable"dmpIncrementHunger"),
(_module getVariable"dmpIncrementThirst"),
(_module getVariable"dmpIncrementFatigue"),
(_module getVariable"dmpIncrementExposure"),
(_module getVariable"dmpSleep"),
(_module getVariable"dmpUseAnims"),
(_module getVariable"dmpSaveMode"),
(_module getVariable"dmpPlayersCanLoad"),
(_module getVariable"dmpRandomStart"),
(_module getVariable"dmpWeatherOnSleep"),
(_module getVariable"dmpClimate"),
(_module getVariable"dmpCashInWallet"),
(_module getVariable"dmpEquipAI"),
(_module getVariable"dmpSleepScript"),
(_module getVariable"dmpMenuScript"),
(_module getVariable"dmpInteractKey"),
(_module getVariable"dmpMenuKey"),
(_module getVariable"dmpHotKey1"),
(_module getVariable"dmpHotKey2"),
(_module getVariable"dmpHotKey3"),
(_module getVariable"dmpScriptInteraction"),
(_module getVariable"dmpScriptItem"),
(_module getVariable"dmpScriptInventory"),
(_module getVariable"dmpScriptOpenInv"),
(_module getVariable"dmpScriptCloseInv"),
(_module getVariable"dmpScriptHotkey1"),
(_module getVariable"dmpScriptHotkey2"),
(_module getVariable"dmpScriptHotkey3")
]execVM"DMP\Scripts\RPG\Start.sqf";
};
TRUE